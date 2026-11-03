# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 5 of 12 (student script)
# Getting Data into and out of R
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. explain the difference between data input and data output;
#  2. identify common data file formats used in introductory data
#  2. analysis;
#  3. explain the role of a file path and working directory;
#  4. inspect the current working directory and list available files;
#  5. distinguish absolute and relative file paths;
#  6. import CSV and tab-delimited text files;
#  7. import and export spreadsheet files using an appropriate package;
#  8. inspect imported objects using head(), tail(), dim(), names() and
#  8. str();
#  9. identify common import problems involving delimiters, headers,
#  9. missing-value codes, encoding and data types;
#  10. export data frames to CSV and other supported formats;
#
# HOW TO WORK WITH THIS SCRIPT
#   * Open your DTS211 RStudio Project first (File > Open Project).
#   * Run one line at a time: Ctrl+Enter (Windows/Linux) or Cmd+Enter (Mac).
#   * PREDICT before you run, INVESTIGATE after you run, then do YOUR TURN.
#   * Lines wrapped in try() are EXPECTED to give an error. Read the message.
#   * Write your own notes in comments (#). Save often (Ctrl+S).
# =====================================================================

# ---- SETUP: run this first ----------------------------------------
if (!file.exists("00_make_data.R")) {
  stop("Open your DTS211 RStudio Project so that the working directory is the project folder.")
}
if (!dir.exists("data")) source("00_make_data.R")   # creates data/ and output/ once
if (!dir.exists("output")) dir.create("output")
set.seed(42)                                   # makes random results repeatable
getwd()                                        # confirm the project folder


# =====================================================================
# SECTION: 2. The data input–processing–output workflow
# =====================================================================

# ---- 2.1 Input and output --------------------------------------------
# WHY: Examples (run source("00_make_data.R") first so that the file
# WHY: exists):
# PREDICT: before you run it, say in one sentence what this block should show.
# Input: read a CSV file into R
students <- read.csv("data/students.csv")

# Output: write an R data frame to a CSV file
write.csv(students, "output/students_export.csv", row.names = FALSE)


# =====================================================================
# SECTION: 4. Files, folders and paths
# =====================================================================

# ---- 4.2 Absolute paths ----------------------------------------------
# WHY: An absolute path specifies the full location of a file from the
# WHY: root of the file system or drive. Example:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Absolute path (Windows example). It only works on one particular computer,
# so it is commented out here. Prefer a project-relative path.
# students <- read.csv("C:/Users/Student/Documents/DTS211/students.csv")


# ---- 4.3 Relative paths ----------------------------------------------
# WHY: If the working directory is DTS211_Project, the relative path to
# WHY: the dataset is:
# CHECK: after running, type the object name in the Console. What does R show?
students <- read.csv("data/students.csv")
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.4 The working directory ---------------------------------------
# WHY: The working directory is the default folder in which R looks for
# WHY: files when a relative path is supplied and the default destination
# WHY: for many file-w...
# PREDICT: before you run it, say in one sentence what this block should show.
getwd()

# WHY: List files in the current directory:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
list.files()

# WHY: List files in a subfolder:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
list.files("data")
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: Change the working directory:
# PREDICT: before you run it, say in one sentence what this block should show.
# Example only: this exact folder does not exist on your computer, so the line is commented out.
# setwd("C:/Users/Student/Documents/DTS211_Project")
getwd()   # inside an RStudio Project this is already the project folder


# =====================================================================
# SECTION: 5. Importing CSV files
# =====================================================================

# ---- 5.1 Basic CSV import --------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students <- read.csv("data/students.csv")

students


# ---- 5.2 Inspect immediately after importing -------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 5.3 Important arguments of read.csv() ---------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students <- read.csv(
  file = "data/students.csv",
  header = TRUE,
  sep = ",",
  na.strings = c("", "NA", "N/A"),
  stringsAsFactors = FALSE
)


# ---- 5.4 Header rows -------------------------------------------------
# WHY: If the file has no header row, use header = FALSE; R will assign
# WHY: default names such as V1, V2, and V3.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
measurements <- read.csv(
  "data/measurements_no_header.csv",
  header = FALSE
)

names(measurements) <- c("sample_id", "temperature", "humidity")


# ---- 5.5 Missing-value codes during import ---------------------------
# WHY: A dataset may use blank cells, NA, N/A, or a numeric code such as
# WHY: 999 to indicate missing information.
# CHECK: run the block, then find the new object(s) in the Environment pane.
survey <- read.csv(
  "data/survey.csv",
  na.strings = c("", "NA", "N/A", "999")
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 6. Importing delimited text files
# =====================================================================

# ---- 6.1 Tab-separated files -----------------------------------------
# WHY: Use read.delim() for tab-delimited files:
# CHECK: after running, type the object name in the Console. What does R show?
students_tsv <- read.delim(
  "data/students.tsv",
  header = TRUE,
  na.strings = c("", "NA")
)

# WHY: The equivalent general function is read.table():
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_tsv <- read.table(
  "data/students.tsv",
  header = TRUE,
  sep = "\t",
  na.strings = c("", "NA")
)


# ---- 6.2 Semicolon-separated files -----------------------------------
# WHY: Some systems use semicolons as separators, particularly in
# WHY: environments where commas are used as decimal marks.
# CHECK: after running, type the object name in the Console. What does R show?
data_semicolon <- read.table(
  "data/data_semicolon.txt",
  header = TRUE,
  sep = ";"
)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 6.3 Delimiter mismatch ------------------------------------------
# WHY: A quick diagnostic is:
# PREDICT: before you run it, say in one sentence what this block should show.
# Deliberately use the wrong function: read.csv() expects commas, the file uses semicolons
data_imported <- read.csv("data/data_semicolon.txt")

dim(data_imported)
names(data_imported)
head(data_imported)


# =====================================================================
# SECTION: 7. Importing Excel workbooks
# =====================================================================

# ---- 7.1 Installing and loading readxl -------------------------------
# WHY: Install a package once on a computer:
# CHECK: after running, type the object name in the Console. What does R show?
if (!requireNamespace("readxl", quietly = TRUE)) install.packages("readxl")

# WHY: Load it when needed in an R session:
# CHECK: run the block, then find the new object(s) in the Environment pane.
library(readxl)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.2 Listing worksheets ------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
excel_sheets("data/student_records.xlsx")


# ---- 7.3 Reading a worksheet -----------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students"
)

students_excel
str(students_excel)

# WHY: A worksheet can also be selected by position:
# CHECK: after running, type the object name in the Console. What does R show?
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = 1
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 7.4 Skipping title rows and selecting a range -------------------
# WHY: Some workbooks contain a report title or explanatory note above the
# WHY: table.
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students",
  skip = 2
)

# WHY: A specific range can also be supplied:
# CHECK: after running, type the object name in the Console. What does R show?
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students",
  range = "A3:E20"
)


# ---- 7.5 Inspecting imported Excel data ------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
dim(students_excel)
names(students_excel)
str(students_excel)
head(students_excel)
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 8. Exporting data from R
# =====================================================================

# ---- 8.1 Exporting a data frame to CSV -------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
write.csv(
  students,
  file = "output/students_export.csv",
  row.names = FALSE
)


# ---- 8.2 Exporting with row names ------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
write.csv(
  students,
  file = "output/students_with_row_names.csv",
  row.names = TRUE
)


# ---- 8.3 Exporting tab-separated data --------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
write.table(
  students,
  file = "output/students_export.tsv",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 8.4 Exporting to Excel ------------------------------------------
# WHY: Install once:
# CHECK: run the block, then find the new object(s) in the Environment pane.
if (!requireNamespace("writexl", quietly = TRUE)) install.packages("writexl")

# WHY: Load:
# CHECK: after running, type the object name in the Console. What does R show?
library(writexl)

# WHY: Export one data frame:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
write_xlsx(
  students,
  path = "output/students_export.xlsx"
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Export multiple worksheets:
# PREDICT: before you run it, say in one sentence what this block should show.
# A small summary table to place on the second worksheet
programme_summary <- as.data.frame(table(students$programme))
names(programme_summary) <- c("programme", "n_students")

write_xlsx(
  list(
    Student_Records = students,
    Programme_Summary = programme_summary
  ),
  path = "output/student_report.xlsx"
)


# ---- 8.5 Exporting an R object with RDS ------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
saveRDS(students, "output/students.rds")

# WHY: Read it back:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_restored <- readRDS("output/students.rds")
str(students_restored)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 8.6 Saving multiple R objects with RData ------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
programme_summary <- table(students$programme)

save(
  students,
  programme_summary,
  file = "output/week5_objects.RData"
)

# WHY: Restore the objects:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
load("output/week5_objects.RData")


# =====================================================================
# SECTION: 9. Verifying exports and round-trip consistency
# =====================================================================

# ---- 9.1 CSV round-trip ----------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
write.csv(
  students,
  "output/students_check.csv",
  row.names = FALSE
)

students_check <- read.csv("output/students_check.csv")

dim(students)
dim(students_check)
names(students)
names(students_check)
str(students_check)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 9.2 Compare values ----------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
all.equal(
  as.data.frame(students),
  as.data.frame(students_check),
  check.attributes = FALSE
)


# ---- 9.3 RDS round-trip ----------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
saveRDS(students, "output/students_check.rds")
students_rds <- readRDS("output/students_check.rds")

identical(students, students_rds)


# =====================================================================
# SECTION: 10. Common import and export problems
# =====================================================================

# ---- 10.1 A systematic import diagnostic routine ---------------------
# WHY: When an imported dataset looks unexpected, work through the
# WHY: following:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# Replace the file name below with the file you are diagnosing
imported_data <- read.csv("data/students.csv", na.strings = c("", "NA"))

getwd()
list.files()
dim(imported_data)
names(imported_data)
head(imported_data)
str(imported_data)
summary(imported_data)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 11. Reproducible data-import scripts
# =====================================================================
# WHY: A simple script might look like this:
# PREDICT: before you run it, say in one sentence what this block should show.
# DTS 211 — Week 5
# Topic: Getting Data into and out of R

# 1. Identify the project directory
getwd()

# 2. Load required package
# install.packages("readxl")  # Run once if not installed
library(readxl)

# 3. Import data
students <- read.csv(
  "data/students.csv",
  header = TRUE,
  na.strings = c("", "NA")
)

# 4. Inspect imported data
head(students)
dim(students)
names(students)
str(students)
summary(students)

# 5. Export a copy
write.csv(
  students,
  "output/students_export.csv",
  row.names = FALSE
)


# =====================================================================
# SECTION: 12. Worked example: departmental student records
# =====================================================================

# ---- 12.1 Create a data frame in R -----------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_source <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005", "DTS006"),
  name = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola"),
  programme = c(
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics", "Mathematics"
  ),
  study_mode = c(
    "Full-time", "Full-time", "Part-time",
    "Full-time", "Part-time", "Full-time"
  ),
  score = c(68, 74, 55, 81, NA, 77)
)

students_source


# ---- 12.2 Export the source table to CSV -----------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
write.csv(
  students_source,
  "students_source.csv",
  row.names = FALSE,
  na = "NA"
)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 12.3 Import the file --------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students_imported <- read.csv(
  "students_source.csv",
  header = TRUE,
  na.strings = c("", "NA")
)

students_imported


# ---- 12.4 Inspect the imported object --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
head(students_imported)
dim(students_imported)
names(students_imported)
str(students_imported)
summary(students_imported)


# ---- 12.5 Export a separate deliverable ------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
write.csv(
  students_imported,
  "students_final_export.csv",
  row.names = FALSE
)
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 13. Guided practical: import, inspect and export a dataset
# =====================================================================

# ---- Task C: Import the CSV file -------------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students <- read.csv(
  "data/students.csv",
  header = TRUE,
  na.strings = c("", "NA")
)


# ---- Task D: Inspect the imported dataset ----------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)


# ---- Task E: Import a TSV version ------------------------------------
# WHY: Create a tab-separated copy named data/students.tsv, then import
# WHY: it:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_tab <- read.delim(
  "data/students.tsv",
  header = TRUE,
  na.strings = c("", "NA")
)

str(students_tab)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Task F: Export the imported data --------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
write.csv(
  students,
  "output/students_export.csv",
  row.names = FALSE
)

# WHY: If using Excel export:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# Install once if necessary:
# install.packages("writexl")

library(writexl)

write_xlsx(
  students,
  "output/students_export.xlsx"
)


# ---- Task G: Verify the exported file --------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_check <- read.csv(
  "output/students_export.csv",
  na.strings = c("", "NA")
)

dim(students_check)
names(students_check)
head(students_check)
str(students_check)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- Task H: Save an R object ----------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
saveRDS(students, "output/students.rds")

students_restored <- readRDS("output/students.rds")

identical(students, students_restored)


# =====================================================================
# SECTION: 18. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the purpose of each expression before running it:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
getwd()
list.files()

x <- read.csv("data/students.csv", na.strings = c("", "NA"))
head(x)
dim(x)
str(x)

write.csv(x, "output/students.csv", row.names = FALSE)

saveRDS(x, "output/students.rds")
y <- readRDS("output/students.rds")

identical(x, y)


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# A research team provides a dataset about participation in a student
# learning programme. The files are available in CSV and Excel formats.
# Complete the following:
# TASK 1: Create a new RStudio Project with data, scripts and output
# TASK 1: folders.
# YOUR CODE:


# TASK 2: Import the CSV file using a relative path.
# YOUR CODE:


# TASK 3: Inspect the data using at least six inspection functions or
# TASK 3: commands.
# YOUR CODE:


# TASK 4: Identify the number of rows, columns and variable types.
# YOUR CODE:


# TASK 5: Import the equivalent worksheet from an Excel workbook using
# TASK 5: readxl.
# YOUR CODE:


# TASK 6: Compare the two imported objects and explain any differences.
# YOUR CODE:


# TASK 7: Export the CSV-imported object to CSV and XLSX.
# YOUR CODE:


# TASK 8: Save the same object using saveRDS().
# YOUR CODE:


# TASK 9: Read each exported file back into R where appropriate.
# YOUR CODE:


# TASK 10: Write a short report describing the import functions, file
# TASK 10: paths, export formats and verification results.
# YOUR CODE:


# Research integrity requirement: Do not assume that two files are
# equivalent merely because they have similar names. Compare their
# structure and contents.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer in your own words:
# Q1. What is the difference between importing and exporting data?
# A: 

# Q2. What is a CSV file?
# A: 

# Q3. How does a TSV file differ from a CSV file?
# A: 

# Q4. What is a working directory?
# A: 

# Q5. What is the difference between an absolute and a relative path?
# A: 

# Q6. Why are RStudio Projects useful?
# A: 

# Q7. What does read.csv() do?
# A: 

# Q8. When would you use read.delim()?
# A: 

# Q9. Why should you inspect an object immediately after importing it?
# A: 

# Q10. What does na.strings specify?
# A: 

# Q11. Why might an Excel workbook require a package such as readxl?
# A: 

# Q12. What is the purpose of row.names = FALSE in write.csv()?
# A: 

# Q13. What is the difference between saveRDS() and save()?
# A: 

# Q14. Why might a CSV round-trip not preserve factor classes?
# A: 

# Q15. What information should be recorded about the source of a dataset?
# A: 

# Predict the purpose of each expression before running it:
# Explain what each command contributes to a reproducible data workflow.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_05_DTS211_student.R in your project and commit your notes.
