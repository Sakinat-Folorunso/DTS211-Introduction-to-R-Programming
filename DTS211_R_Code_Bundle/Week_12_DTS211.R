# DTS 211 — Week 12 R Code Collection
# Extracted from: DTS211_Week12_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
getwd()
list.files()
file.exists("data/attendance.csv")


# ====================================================================
# Code example 2
# ====================================================================
attendance <- data.frame(
  student_id = c(
    "STU001", "STU002", "STU003", "STU004",
    "STU005", "STU006", "STU007", "STU008"
  ),
  week = c(1, 1, 1, 1, 2, 2, 2, 2),
  status = c(
    "Present", "Present", "Absent", "Present",
    "Present", "Absent", "Present", "Present"
  ),
  stringsAsFactors = FALSE
)

str(attendance)


# ====================================================================
# Code example 3
# ====================================================================
head(attendance)
str(attendance)
summary(attendance)

stopifnot(all(c("student_id", "week", "status") %in% names(attendance)))
stopifnot(!anyDuplicated(attendance[c("student_id", "week")]))


# ====================================================================
# Code example 4
# ====================================================================
attendance$status <- tolower(trimws(attendance$status))

attendance_summary <- aggregate(
  student_id ~ week + status,
  data = attendance,
  FUN = length
)

names(attendance_summary)[3] <- "record_count"
attendance_summary


# ====================================================================
# Code example 5
# ====================================================================
weekly_total <- aggregate(
  student_id ~ week,
  data = attendance,
  FUN = length
)

names(weekly_total)[2] <- "records"
weekly_total


# ====================================================================
# Code example 6
# ====================================================================
weekly_present <- aggregate(
  I(status == "present") ~ week,
  data = attendance,
  FUN = sum
)

names(weekly_present)[2] <- "present_count"

weekly_total <- aggregate(
  student_id ~ week,
  data = attendance,
  FUN = length
)

names(weekly_total)[2] <- "record_count"

weekly_result <- merge(weekly_present, weekly_total, by = "week")

weekly_result$attendance_percent <-
  100 * weekly_result$present_count / weekly_result$record_count

weekly_result


# ====================================================================
# Code example 7
# ====================================================================
print(weekly_result)


# ====================================================================
# Code example 8
# ====================================================================
barplot(
  weekly_result$attendance_percent,
  names.arg = weekly_result$week,
  ylim = c(0, 100),
  xlab = "Week",
  ylab = "Attendance (%)",
  main = "Weekly Attendance Summary"
)


# ====================================================================
# Code example 9
# ====================================================================
write.csv(
  weekly_result,
  "output/weekly_attendance_summary.csv",
  row.names = FALSE
)


# ====================================================================
# Code example 10
# ====================================================================
if (!dir.exists("output")) {
  dir.create("output")
}


# ====================================================================
# Code example 11
# ====================================================================
png(
  "output/weekly_attendance_chart.png",
  width = 900,
  height = 600,
  res = 120
)

barplot(
  weekly_result$attendance_percent,
  names.arg = weekly_result$week,
  ylim = c(0, 100),
  xlab = "Week",
  ylab = "Attendance (%)",
  main = "Weekly Attendance Summary"
)

dev.off()


# ====================================================================
# Code example 12
# ====================================================================
saveRDS(weekly_result, "output/weekly_result.rds")

reloaded_result <- readRDS("output/weekly_result.rds")
all.equal(weekly_result, reloaded_result)


# ====================================================================
# Code example 13
# ====================================================================
stopifnot(all(c(
  "week",
  "present_count",
  "record_count",
  "attendance_percent"
) %in% names(weekly_result)))

stopifnot(all(
  weekly_result$attendance_percent >= 0 &
  weekly_result$attendance_percent <= 100
))
