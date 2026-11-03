# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 12 of 12 (student script)
# Creating Data Products Using R
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain what a data product is and distinguish it from a data file,
#  1. analysis script, and static chart.
#  2. Identify an intended audience, purpose, input data, processing
#  2. steps, output, and limitations for a small data product.
#  3. Plan a simple R-based data product with a clear problem statement
#  3. and user requirement.
#  4. Organise an R project using scripts, data folders, output folders,
#  4. and documentation.
#  5. Use R to produce a reproducible report containing narrative, code,
#  5. tables, and visual outputs.
#  6. Explain the role of R Markdown or Quarto in producing documents from
#  6. R code.
#  7. Create and render a simple reproducible report using an appropriate
#  7. authoring tool.
#  8. Apply basic principles of data communication, accessibility,
#  8. privacy, and responsible interpretation.
#  9. Test a data product using representative inputs and check that its
#  9. outputs are correct.
#  10. Present a small R data product and explain its purpose, workflow,
#  10. and limitations.
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
# SECTION: 5. Organising an R project
# =====================================================================

# ---- 5.1 Use an RStudio Project --------------------------------------
# WHY: Use relative paths rather than paths tied to one computer.
# PREDICT: before you run it, say in one sentence what this block should show.
getwd()
list.files()
file.exists("data/attendance.csv")


# =====================================================================
# SECTION: 6. Build a reproducible workflow
# =====================================================================

# ---- 6.1 Example: create a synthetic dataset -------------------------
# WHY: They do not represent actual OOU students.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# ---- 6.2 Inspect and validate the input ------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
head(attendance)
str(attendance)
summary(attendance)

stopifnot(all(c("student_id", "week", "status") %in% names(attendance)))
stopifnot(!anyDuplicated(attendance[c("student_id", "week")]))
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 6.3 Standardise labels and calculate summaries ------------------
# PREDICT: before you run it, say in one sentence what this block should show.
attendance$status <- tolower(trimws(attendance$status))

attendance_summary <- aggregate(
  student_id ~ week + status,
  data = attendance,
  FUN = length
)

names(attendance_summary)[3] <- "record_count"
attendance_summary

# WHY: A clearer summary of the number of records per week can be produced
# WHY: with base R:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
weekly_total <- aggregate(
  student_id ~ week,
  data = attendance,
  FUN = length
)

names(weekly_total)[2] <- "records"
weekly_total


# ---- 6.4 Calculate attendance percentages ----------------------------
# WHY: For this synthetic example, assume each row represents one
# WHY: student's attendance record for one week.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
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
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 7. Communicating results responsibly
# =====================================================================

# ---- 7.1 Tables ------------------------------------------------------
# WHY: Tables are useful when readers need exact values or comparisons.
# PREDICT: before you run it, say in one sentence what this block should show.
print(weekly_result)


# ---- 7.2 Charts ------------------------------------------------------
# WHY: A chart can communicate a pattern more quickly than a table, but it
# WHY: must be appropriate for the question and data.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
barplot(
  weekly_result$attendance_percent,
  names.arg = weekly_result$week,
  ylim = c(0, 100),
  xlab = "Week",
  ylab = "Attendance (%)",
  main = "Weekly Attendance Summary"
)


# =====================================================================
# SECTION: 9. Exporting product outputs
# =====================================================================

# ---- 9.1 Export a summary table --------------------------------------
# WHY: Ensure the output folder exists before writing to it:
# CHECK: after running, type the object name in the Console. What does R show?
if (!dir.exists("output")) {
  dir.create("output")
}
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: Then write the table:
# PREDICT: before you run it, say in one sentence what this block should show.
write.csv(
  weekly_result,
  "output/weekly_attendance_summary.csv",
  row.names = FALSE
)


# ---- 9.2 Save a chart ------------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# ---- 9.3 Save an R object --------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
saveRDS(weekly_result, "output/weekly_result.rds")

reloaded_result <- readRDS("output/weekly_result.rds")
all.equal(weekly_result, reloaded_result)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 12. Testing a data product
# =====================================================================

# ---- 12.1 Simple automated checks ------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
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


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Title: A Small Reproducible Data Product Using R
# Students should develop a small data product that demonstrates the core
# skills covered in DTS 211. The project may be individual or completed in
# a small group, subject to the instructor's direction.
#   - Student performance or attendance summary using synthetic or
#   - authorised data.
#   - Agricultural measurement summary using synthetic or open data.
#   - Library usage report.
#   - Campus service or event registration summary.
#   - Small survey summary with appropriately anonymised data.
#   - A data-quality report for a supplied dataset.
# The product must include:
# TASK 1: A clear problem statement and intended audience.
# YOUR CODE:


# TASK 2: A documented data source or synthetic data-generation procedure.
# YOUR CODE:


# TASK 3: An organised R project or clearly structured script.
# YOUR CODE:


# TASK 4: Data inspection and at least one validation step.
# YOUR CODE:


# TASK 5: At least one meaningful computation or summary.
# YOUR CODE:


# TASK 6: At least one appropriate chart or table.
# YOUR CODE:


# TASK 7: A report or other clearly communicated output.
# YOUR CODE:


# TASK 8: A README or equivalent usage instructions.
# YOUR CODE:


# TASK 9: A limitations and responsible-use statement.
# YOUR CODE:


# TASK 10: Evidence that the project can be run again.
# YOUR CODE:


#   - RStudio Project folder or a compressed project folder.
#   - All required R scripts.
#   - Input data, where sharing is permitted.
#   - Generated report (.html, .pdf, or another agreed format).
#   - Generated table/chart outputs.
#   - README and data dictionary where appropriate.
#   - A short presentation or demonstration.
# If the data cannot legally or ethically be shared, submit a synthetic
# example or a documented procedure that allows the instructor to assess
# the workflow without exposing restricted records.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Q1. What makes a data product different from a data file or a chart?
# A: 

# Q2. Why should a data product begin with an audience and a question?
# A: 

# Q3. What is the purpose of an RStudio Project?
# A: 

# Q4. How does a reproducible report differ from a manually assembled
# Q4. document?
# A: 

# Q5. Why should a data product state its limitations?
# A: 

# Q6. What checks should be completed before sharing a data product?
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_12_DTS211_student.R in your project and commit your notes.
