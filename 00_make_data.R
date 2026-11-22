# =====================================================================
# DTS 211: Introduction to R Programming
# 00_make_data.R  --  Build the course data folder
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (primary). Posit Cloud also works.
# ---------------------------------------------------------------------
# WHAT THIS SCRIPT DOES
#   Creates the folders  data/  and  output/  inside your DTS 211
#   RStudio Project, and writes every small practice dataset used in
#   Weeks 5-12. Run it ONCE, from the project root:
#
#       source("00_make_data.R")
#
#   It is safe to run again: it simply rewrites the same files.
#   (All data are small, illustrative teaching data, not real records.)
# =====================================================================

options(stringsAsFactors = FALSE)
set.seed(42)

# ---- 0. Are we in the project root? ---------------------------------
cat("Working directory:", getwd(), "\n")
if (!file.exists("00_make_data.R")) {
  stop("Please open your DTS 211 RStudio Project and make sure ",
       "00_make_data.R is in the project root folder (see getwd()).")
}

# ---- 1. Folders -----------------------------------------------------
for (folder in c("data", "output", "scripts")) {
  if (!dir.exists(folder)) dir.create(folder)
}

# ---- 2. students.csv / students.tsv  (Week 5, 6, 8) ------------------
students <- data.frame(
  student_id = sprintf("DTS%03d", 1:8),
  name       = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola", "Ganiyu", "Hauwa"),
  programme  = c("Computer Science", "Statistics", "Mathematics", "Computer Science",
                 "Statistics", "Mathematics", "Computer Science", "Statistics"),
  study_mode = c("Full-time", "Full-time", "Part-time", "Full-time",
                 "Part-time", "Full-time", "Part-time", "Full-time"),
  score      = c(68, 74, 55, 81, NA, 77, 69, 88)
)
write.csv(students, "data/students.csv", row.names = FALSE, na = "NA")
write.table(students, "data/students.tsv", sep = "\t", row.names = FALSE,
            quote = FALSE, na = "NA")

# ---- 3. Semicolon-separated file  (Week 5) ---------------------------
semicolon <- data.frame(
  course = c("DTS211", "DTS201", "CSC324", "SEN201"),
  units  = c(3, 3, 3, 3),
  level  = c(200, 200, 300, 200)
)
write.table(semicolon, "data/data_semicolon.txt", sep = ";", row.names = FALSE,
            quote = FALSE)

# ---- 4. File with no header row  (Week 5) -----------------------------
measurements <- data.frame(
  sample_id   = sprintf("S%02d", 1:10),
  temperature = c(27.1, 28.4, 29.0, 30.2, 31.5, 30.8, 29.9, 28.7, 27.6, 27.0),
  humidity    = c(81, 78, 74, 70, 66, 68, 72, 76, 80, 83)
)
write.table(measurements, "data/measurements_no_header.csv", sep = ",",
            row.names = FALSE, col.names = FALSE, quote = FALSE)

# ---- 5. Survey with the missing-value code 999  (Week 5) --------------
survey <- data.frame(
  respondent_id = 1:10,
  age           = c(19, 20, 21, 999, 22, 20, 19, 21, 999, 23),
  satisfaction  = c(4, 5, 3, 4, NA, 2, 5, 4, 3, 999),
  hours_online  = c(3, 5, 2, 6, 4, 999, 7, 3, 5, 4)
)
write.csv(survey, "data/survey.csv", row.names = FALSE, na = "")

# ---- 6. Deliberately messy student file  (Week 6) ---------------------
students_raw <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004",
                 "DTS005", "DTS006", "DTS006", "DTS008"),
  name       = c(" Amina", "Bola ", "Chidi", "Dayo", "Efe", "Fola", "Fola", "Ganiyu"),
  programme  = c("Computer Science", "statistics", "Mathematics ", "Comp. Science",
                 "Statistics", "Mathematics", "Mathematics", "Computer Science"),
  age        = c(21, 22, -3, 23, 21, 22, 22, NA),
  score      = c(68, 74, 55, 105, NA, 77, 77, 69),
  study_mode = c("Full-time", "FT", "Part-time", "Full-time",
                 "PT", "Full-time", "Full-time", "Part-time")
)
write.csv(students_raw, "data/students_raw.csv", row.names = FALSE, na = "")

# ---- 7. Raw survey for cleaning practice  (Week 6) --------------------
student_survey_raw <- data.frame(
  respondent_id = sprintf("R%02d", 1:10),
  programme     = c("Computer Science", "computer science", "Statistics", "Statistics ",
                    "Mathematics", "Data Science", "data science", "Mathematics",
                    "Computer Science", "Statistics"),
  study_hours   = c(12, 8, 15, NA, 6, 20, 18, 9, -2, 11),
  sleep_hours   = c(7, 6, 8, 5, NA, 6, 7, 7, 8, 6),
  satisfaction  = c(4, 5, 3, 4, 2, 5, 5, NA, 3, 4)
)
write.csv(student_survey_raw, "data/student_survey_raw.csv", row.names = FALSE, na = "")

# ---- 8. Tab-separated observations with dates  (Week 8) ---------------
observations <- data.frame(
  obs_id   = 1:8,
  station  = c("Ago-Iwoye", "Ago-Iwoye", "Ijebu-Ode", "Ijebu-Ode",
               "Abeokuta", "Abeokuta", "Ikenne", "Ikenne"),
  obs_date = c("2026-03-02", "2026-03-09", "2026-03-02", "2026-03-09",
               "2026-03-02", "2026-03-09", "2026-03-02", "2026-03-09"),
  temp_c   = c(29.4, 30.1, 29.8, 30.5, 31.2, 31.8, 29.1, 29.7)
)
write.table(observations, "data/observations.tsv", sep = "\t",
            row.names = FALSE, quote = FALSE)

# ---- 9. UTF-8 text file  (Week 8) -------------------------------------
field_notes <- c(
  "Visit 1: Ago-Iwoye market. Recorded prices of tomatoes and peppers.",
  "Visit 2: Ìjẹ̀bú-Òdè junction. Counted 42 vehicles in 10 minutes.",
  "Visit 3: Campus gate, OOU. Interviewed 5 students about study habits.",
  "Visit 4: Ikenne. Weather: light rain after 4 pm.",
  "Visit 5: Abeokuta. Photographs saved as IMG_001 to IMG_014."
)
con <- file("data/field_notes.txt", open = "wb")   # binary: no re-encoding
writeLines(enc2utf8(field_notes), con, useBytes = TRUE)
close(con)

# ---- 10. Attendance and scores  (Weeks 11-12) -------------------------
attendance <- data.frame(
  student_id = sprintf("STU%03d", 1:8),
  week       = c(1, 1, 1, 1, 2, 2, 2, 2),
  status     = c("Present", "Present", "Absent", "Present",
                 "Present", "Absent", "Present", "Present")
)
write.csv(attendance, "data/attendance.csv", row.names = FALSE)

student_scores <- data.frame(
  student_id  = sprintf("STU%03d", 1:8),
  coursework  = c(18, 22, 15, 27, 20, 25, 12, 28),
  examination = c(45, 50, 38, 62, 41, 58, 30, 66)
)
write.csv(student_scores, "data/student_scores.csv", row.names = FALSE)

# ---- 11. Excel workbook (Week 5) --------------------------------------
# student_records.xlsx has title rows above the header, so it is supplied
# ready-made in the data/ folder of the course project. If it is missing,
# we write a simplified one so that later code still runs.
if (!file.exists("data/student_records.xlsx")) {
  if (requireNamespace("writexl", quietly = TRUE)) {
    writexl::write_xlsx(list(Students = students), "data/student_records.xlsx")
    message("Wrote a simplified student_records.xlsx (no title rows).")
  } else {
    message("student_records.xlsx not found. Copy it from the course project folder.")
  }
}

# ---- 12. Report ---------------------------------------------------------
cat("\nFiles now in data/:\n")
print(list.files("data"))
cat("\nDone. You are ready for Week 5 onward.\n")
