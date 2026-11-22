# DTS 211 — Week 8 R Code Collection
# Extracted from: DTS211_Week8_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
getwd()                    # inspect the working directory
list.files()               # list files in the working directory
file.exists("attendance.csv")


# ====================================================================
# Code example 2
# ====================================================================
# Create a small text file for this practical
notes <- c(
  "DTS 211 practical record",
  "Topic: text and date-time handling",
  "Department: Computer Science"
)

writeLines(notes, "week8_notes.txt")

# Read the file back into R
read_notes <- readLines("week8_notes.txt")
read_notes
length(read_notes)


# ====================================================================
# Code example 3
# ====================================================================
paragraph <- paste(read_notes, collapse = " ")
paragraph


# ====================================================================
# Code example 4
# ====================================================================
report_lines <- c(
  "Week 8 practical",
  "The file was read successfully.",
  "Date parsing should be checked before analysis."
)

writeLines(report_lines, "week8_report.txt")


# ====================================================================
# Code example 5
# ====================================================================
# CSV file
students <- read.csv(
  "data/students.csv",
  stringsAsFactors = FALSE,
  na.strings = c("", "NA", "N/A")
)

# Tab-separated file
observations <- read.delim(
  "data/observations.tsv",
  stringsAsFactors = FALSE
)

str(students)
head(students)
summary(students)


# ====================================================================
# Code example 6
# ====================================================================
# Run once if readr is not installed:
# install.packages("readr")

library(readr)
students_readr <- read_csv("data/students.csv")


# ====================================================================
# Code example 7
# ====================================================================
# For a readr tibble:
problems(students_readr)


# ====================================================================
# Code example 8
# ====================================================================
# Example for a UTF-8 text file
utf8_lines <- readLines(
  "data/field_notes.txt",
  encoding = "UTF-8",
  warn = FALSE
)


# ====================================================================
# Code example 9
# ====================================================================
raw_names <- c("  adeola", "BOLA ", " Chinedu  ")

clean_names <- trimws(raw_names)
clean_names


# ====================================================================
# Code example 10
# ====================================================================
raw_departments <- c(
  "Computer Science",
  "computer science ",
  " COMPUTER SCIENCE",
  "Mathematics"
)

department_clean <- tolower(trimws(raw_departments))
department_clean


# ====================================================================
# Code example 11
# ====================================================================
unique(raw_departments)


# ====================================================================
# Code example 12
# ====================================================================
codes <- c("DTS211-001", "DTS211-002", "CSC333-014")

substr(codes, 1, 6)
grepl("^DTS", codes)
grep("014", codes, value = TRUE)


# ====================================================================
# Code example 13
# ====================================================================
date_text <- c("2026-11-02", "2026-11-05", "2026-12-01")

dates <- as.Date(date_text, format = "%Y-%m-%d")
dates
class(dates)


# ====================================================================
# Code example 14
# ====================================================================
as.Date("02/11/2026", format = "%d/%m/%Y")
as.Date("11/02/2026", format = "%m/%d/%Y")
as.Date("02-Nov-2026", format = "%d-%b-%Y")


# ====================================================================
# Code example 15
# ====================================================================
class(dates)
str(dates)
format(dates, "%d %B %Y")
format(dates, "%Y")
format(dates, "%m")


# ====================================================================
# Code example 16
# ====================================================================
start_date <- as.Date("2026-11-02")
start_date + 7
start_date - 3

end_date <- as.Date("2026-11-16")
end_date - start_date


# ====================================================================
# Code example 17
# ====================================================================
event_dates <- as.Date(c("2026-11-02", "2026-11-09", "2026-11-16"))
event_dates[2] - event_dates[1]


# ====================================================================
# Code example 18
# ====================================================================
Sys.Date()


# ====================================================================
# Code example 19
# ====================================================================
time_text <- "2026-11-02 09:30:00"

event_time <- as.POSIXct(
  time_text,
  format = "%Y-%m-%d %H:%M:%S",
  tz = "Africa/Lagos"
)

class(event_time)
event_time


# ====================================================================
# Code example 20
# ====================================================================
as.POSIXct(
  "02/11/2026 9:30 AM",
  format = "%d/%m/%Y %I:%M %p",
  tz = "Africa/Lagos"
)


# ====================================================================
# Code example 21
# ====================================================================
Sys.time()

format(event_time, "%d %B %Y")
format(event_time, "%H:%M")
format(event_time, "%A")


# ====================================================================
# Code example 22
# ====================================================================
event_parts <- as.POSIXlt(event_time, tz = "Africa/Lagos")

event_parts$year + 1900
event_parts$mon + 1
event_parts$mday
event_parts$hour
event_parts$min


# ====================================================================
# Code example 23
# ====================================================================
raw_dates <- c(
  "02/11/2026",
  "09/11/2026",
  "31/11/2026",
  "",
  "15/11/2026"
)

parsed_dates <- as.Date(raw_dates, format = "%d/%m/%Y")
parsed_dates
is.na(parsed_dates)


# ====================================================================
# Code example 24
# ====================================================================
date_check <- data.frame(
  original = raw_dates,
  parsed = parsed_dates,
  parse_failed = is.na(parsed_dates)
)

date_check


# ====================================================================
# Code example 25
# ====================================================================
attendance <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005"),
  student_name = c(" Ada ", "Bola", "Chika", "Dayo", "Efe"),
  attendance_date_text = c(
    "02/11/2026",
    "02/11/2026",
    "09/11/2026",
    "09/11/2026",
    "16/11/2026"
  ),
  arrival_time_text = c(
    "08:05:00", "08:17:00", "07:58:00", "08:32:00", "08:10:00"
  ),
  status = c("Present", "Present", "Present", "Absent", "Present"),
  stringsAsFactors = FALSE
)

str(attendance)


# ====================================================================
# Code example 26
# ====================================================================
attendance$student_name <- trimws(attendance$student_name)
attendance$status <- tolower(trimws(attendance$status))


# ====================================================================
# Code example 27
# ====================================================================
attendance$attendance_date <- as.Date(
  attendance$attendance_date_text,
  format = "%d/%m/%Y"
)


# ====================================================================
# Code example 28
# ====================================================================
attendance$arrival_datetime_text <- paste(
  format(attendance$attendance_date, "%Y-%m-%d"),
  attendance$arrival_time_text
)

attendance$arrival_datetime <- as.POSIXct(
  attendance$arrival_datetime_text,
  format = "%Y-%m-%d %H:%M:%S",
  tz = "Africa/Lagos"
)


# ====================================================================
# Code example 29
# ====================================================================
attendance[, c(
  "student_id",
  "student_name",
  "attendance_date_text",
  "attendance_date",
  "arrival_time_text",
  "arrival_datetime",
  "status"
)]

stopifnot(!any(is.na(attendance$attendance_date)))
class(attendance$attendance_date)
class(attendance$arrival_datetime)


# ====================================================================
# Code example 30
# ====================================================================
attendance$attendance_month <- format(
  attendance$attendance_date,
  "%B"
)

attendance$attendance_day <- format(
  attendance$attendance_date,
  "%A"
)

attendance


# ====================================================================
# Code example 31
# ====================================================================
raw_values <- c(
  "  COMPUTER SCIENCE",
  "computer science ",
  "Mathematics",
  " DATA SCIENCE  ",
  "data science"
)


# ====================================================================
# Code example 32
# ====================================================================
date_values <- c(
  "02/11/2026",
  "09/11/2026",
  "16/11/2026",
  "23/11/2026",
  "30/11/2026"
)


# ====================================================================
# Code example 33
# ====================================================================
clock_values <- c(
  "02/11/2026 08:05",
  "02/11/2026 08:17",
  "02/11/2026 09:02",
  "02/11/2026 09:15"
)


# ====================================================================
# Code example 34
# ====================================================================
dates_to_check <- c(
  "02/11/2026",
  "31/11/2026",
  "15/11/2026",
  "not recorded",
  ""
)
