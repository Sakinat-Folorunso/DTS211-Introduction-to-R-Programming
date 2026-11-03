# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 8 of 12 (student script)
# Reading Text and External Data; Dates and Times
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain the difference between reading a text file, importing
#  1. tabular data, and parsing values contained in a data field.
#  2. Use readLines() to read plain-text files and writeLines() to create
#  2. text files.
#  3. Use basic string functions to inspect, extract, combine, and
#  3. standardise text.
#  4. Explain why dates and date-times should not normally remain
#  4. unprocessed character strings.
#  5. Create and inspect Date, POSIXct, and POSIXlt objects.
#  6. Parse date strings using explicit format specifications and
#  6. recognise common parsing errors.
#  7. Extract date components, format dates for display, and perform basic
#  7. date arithmetic.
#  8. Apply these techniques to a small, reproducible dataset and document
#  8. assumptions about date formats and time zones.
#  9. Open, read from and close a connection to a file, and retrieve lines
#  9. from a URL with error handling.
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
# SECTION: 3. Text files and structured external data
# =====================================================================

# ---- 3.2 File paths and reproducibility ------------------------------
# WHY: A relative path is interpreted from the current working directory;
# WHY: an absolute path identifies a location from the file system root.
# PREDICT: before you run it, say in one sentence what this block should show.
getwd()                    # inspect the working directory
list.files()               # list files in the working directory
file.exists("attendance.csv")


# ---- 3.3 Reading plain text with readLines() -------------------------
# WHY: readLines() reads a text file as a character vector, with one
# WHY: element per line.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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

# WHY: joining with "", " ", or "\n" produces different results.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
paragraph <- paste(read_notes, collapse = " ")
paragraph
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 3.4 Writing text with writeLines() ------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
report_lines <- c(
  "Week 8 practical",
  "The file was read successfully.",
  "Date parsing should be checked before analysis."
)

writeLines(report_lines, "week8_report.txt")


# ---- 3.5 Importing tabular data --------------------------------------
# WHY: Base R provides read.csv() and read.delim() for common delimited
# WHY: files.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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

# WHY: They return tibbles and provide useful parsing messages.
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Run once if readr is not installed:
# install.packages("readr")

library(readr)
students_readr <- read_csv("data/students.csv")
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: If R reports parsing problems, investigate them rather than
# WHY: ignoring the warning.
# PREDICT: before you run it, say in one sentence what this block should show.
# For a readr tibble:
problems(students_readr)


# ---- 3.6 Text encoding -----------------------------------------------
# WHY: Do not assume that every encoding problem can be repaired by
# WHY: changing the font.
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Example for a UTF-8 text file
utf8_lines <- readLines(
  "data/field_notes.txt",
  encoding = "UTF-8",
  warn = FALSE
)


# ---- 3.7 Connections: files, text and URLs ---------------------------
# WHY: When you create a connection yourself, you control it step by step
# WHY: and must close it with close().
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
con <- file("data/field_notes.txt", open = "r")   # open a connection to a file
first_two <- readLines(con, n = 2)                  # read the first two lines
next_one  <- readLines(con, n = 1)                  # continues where the last call stopped
close(con)                                          # always close what you open

first_two
next_one
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: This is a safe way to practise parsing web-page-like text without
# WHY: internet access:
# PREDICT: before you run it, say in one sentence what this block should show.
page <- c("<title>OOU notice</title>",
          "<p>Registration is open.</p>",
          "<p>Contact: registry@example.org</p>")

tc <- textConnection(page)
page_lines <- readLines(tc)
close(tc)

paragraphs <- page_lines[grepl("<p>", page_lines)]
gsub("<[^>]+>", "", paragraphs)        # remove the tags, keep the text

# WHY: Networks fail, so wrap the call in tryCatch() so that your script
# WHY: reports the problem instead of crashing:
# CHECK: after running, type the object name in the Console. What does R show?
url_lines <- tryCatch(
  readLines(url("https://www.r-project.org"), n = 5, warn = FALSE),
  error   = function(e) { message("Could not reach the URL: ", conditionMessage(e)); NULL },
  warning = function(w) { message("Warning while reading the URL: ", conditionMessage(w)); NULL }
)

if (is.null(url_lines)) {
  cat("No internet connection or site unavailable. Use the textConnection() example above.\n")
} else {
  head(url_lines, 3)
}


# =====================================================================
# SECTION: 4. Working with character data
# =====================================================================

# ---- 4.1 Basic string functions --------------------------------------
# WHY: | paste0() | Join values without a separator | paste0("DTS", 211) |
# WHY: | grep() | Find elements matching a pattern | grep("AI", x) | |
# WHY: grepl() | Retur...
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
raw_names <- c("  adeola", "BOLA ", " Chinedu  ")

clean_names <- trimws(raw_names)
clean_names
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.2 Standardising labels carefully ------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
raw_departments <- c(
  "Computer Science",
  "computer science ",
  " COMPUTER SCIENCE",
  "Mathematics"
)

department_clean <- tolower(trimws(raw_departments))
department_clean

# WHY: A controlled recoding step may be required after inspecting unique
# WHY: values.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
unique(raw_departments)


# ---- 4.3 Extracting and detecting text -------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
codes <- c("DTS211-001", "DTS211-002", "CSC333-014")

substr(codes, 1, 6)
grepl("^DTS", codes)
grep("014", codes, value = TRUE)
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 6. Date objects in R
# =====================================================================

# ---- 6.1 The Date class ----------------------------------------------
# WHY: The format argument tells R how the input is written.
# PREDICT: before you run it, say in one sentence what this block should show.
date_text <- c("2026-11-02", "2026-11-05", "2026-12-01")

dates <- as.Date(date_text, format = "%Y-%m-%d")
dates
class(dates)

# WHY: | %b | Abbreviated month name | Nov | | %B | Full month name |
# WHY: November | Examples:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
as.Date("02/11/2026", format = "%d/%m/%Y")
as.Date("11/02/2026", format = "%m/%d/%Y")
as.Date("02-Nov-2026", format = "%d-%b-%Y")


# ---- 6.2 Inspecting and formatting dates -----------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
class(dates)
str(dates)
format(dates, "%d %B %Y")
format(dates, "%Y")
format(dates, "%m")
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 6.3 Date arithmetic ---------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
start_date <- as.Date("2026-11-02")
start_date + 7
start_date - 3

end_date <- as.Date("2026-11-16")
end_date - start_date

# WHY: Subtracting two Date objects returns a time difference measured in
# WHY: days.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
event_dates <- as.Date(c("2026-11-02", "2026-11-09", "2026-11-16"))
event_dates[2] - event_dates[1]


# ---- 6.4 Current date ------------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
Sys.Date()
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 7. Date-time objects: POSIXct and POSIXlt
# =====================================================================

# ---- 7.1 Understanding the classes -----------------------------------
# WHY: - POSIXlt stores date-time components in a list-like structure,
# WHY: which can be useful when inspecting components.
# PREDICT: before you run it, say in one sentence what this block should show.
time_text <- "2026-11-02 09:30:00"

event_time <- as.POSIXct(
  time_text,
  format = "%Y-%m-%d %H:%M:%S",
  tz = "Africa/Lagos"
)

class(event_time)
event_time


# ---- 7.2 Time format codes -------------------------------------------
# WHY: | %p | AM/PM marker | AM | | %z | Numeric UTC offset | +0100 | | %Z
# WHY: | Time-zone abbreviation/name, where available | system-dependent |
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
as.POSIXct(
  "02/11/2026 9:30 AM",
  format = "%d/%m/%Y %I:%M %p",
  tz = "Africa/Lagos"
)


# ---- 7.3 Inspecting and formatting date-times ------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
Sys.time()

format(event_time, "%d %B %Y")
format(event_time, "%H:%M")
format(event_time, "%A")
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 7.4 Converting to POSIXlt and extracting components -------------
# PREDICT: before you run it, say in one sentence what this block should show.
event_parts <- as.POSIXlt(event_time, tz = "Africa/Lagos")

event_parts$year + 1900
event_parts$mon + 1
event_parts$mday
event_parts$hour
event_parts$min


# =====================================================================
# SECTION: 8. Handling invalid or missing date values
# =====================================================================
# WHY: This is a signal to investigate.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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

# WHY: Keep unresolved values missing and document the issue.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
date_check <- data.frame(
  original = raw_dates,
  parsed = parsed_dates,
  parse_failed = is.na(parsed_dates)
)

date_check
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 9. Worked example: departmental attendance records
# =====================================================================
# WHY: The date strings use the day/month/year convention.
# PREDICT: before you run it, say in one sentence what this block should show.
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


# ---- Step 1: Standardise names and status labels ---------------------
# CHECK: after running, type the object name in the Console. What does R show?
attendance$student_name <- trimws(attendance$student_name)
attendance$status <- tolower(trimws(attendance$status))


# ---- Step 2: Parse the attendance date -------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
attendance$attendance_date <- as.Date(
  attendance$attendance_date_text,
  format = "%d/%m/%Y"
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Step 3: Combine date and arrival time ---------------------------
# CHECK: after running, type the object name in the Console. What does R show?
attendance$arrival_datetime_text <- paste(
  format(attendance$attendance_date, "%Y-%m-%d"),
  attendance$arrival_time_text
)

attendance$arrival_datetime <- as.POSIXct(
  attendance$arrival_datetime_text,
  format = "%Y-%m-%d %H:%M:%S",
  tz = "Africa/Lagos"
)


# ---- Step 4: Validate the conversion ---------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# ---- Step 5: Derive calendar components ------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
attendance$attendance_month <- format(
  attendance$attendance_date,
  "%B"
)

attendance$attendance_day <- format(
  attendance$attendance_date,
  "%A"
)

attendance
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 11. Guided practical (225 minutes)
# =====================================================================

# ---- Part B — Character processing (35 minutes) ----------------------
# WHY: Use the following values:
# CHECK: run the block, then find the new object(s) in the Environment pane.
raw_values <- c(
  "  COMPUTER SCIENCE",
  "computer science ",
  "Mathematics",
  " DATA SCIENCE  ",
  "data science"
)


# ---- Part C — Parse calendar dates (45 minutes) ----------------------
# CHECK: after running, type the object name in the Console. What does R show?
date_values <- c(
  "02/11/2026",
  "09/11/2026",
  "16/11/2026",
  "23/11/2026",
  "30/11/2026"
)


# ---- Part D — Parse date-times (45 minutes) --------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
clock_values <- c(
  "02/11/2026 08:05",
  "02/11/2026 08:17",
  "02/11/2026 09:02",
  "02/11/2026 09:15"
)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Part E — Detect invalid values (35 minutes) ---------------------
# CHECK: after running, type the object name in the Console. What does R show?
dates_to_check <- c(
  "02/11/2026",
  "31/11/2026",
  "15/11/2026",
  "not recorded",
  ""
)


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Title: Text and Time Integrity Audit
# Create a small synthetic dataset of at least 12 records related to one
# of the following contexts: student attendance, agricultural field
# observations, library borrowing, clinic appointment scheduling, or
# campus event registration.
# Your dataset must include:
#   - one identifier field;
#   - one text field containing inconsistent spaces or capitalisation;
#   - one date field stored initially as character text;
#   - one time field or date-time field;
#   - at least one intentionally invalid or missing date value.
# Submit:
# TASK 1: The original data or code that creates it.
# YOUR CODE:


# TASK 2: An R script that reads or creates the data, standardises the
# TASK 2: text, parses the date/time fields, and checks for failed
# TASK 2: conversions.
# YOUR CODE:


# TASK 3: A validation table showing original values and parsed values.
# YOUR CODE:


# TASK 4: A 400–600 word explanation of the decisions made, including the
# TASK 4: date convention, time zone (if applicable), unresolved problems,
# TASK 4: and why no unsupported corrections were made.
# YOUR CODE:


# Important: Do not invent corrected values for invalid records. Preserve
# the original values and document unresolved cases.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer briefly:
# Q1. What is the difference between readLines() and read.csv()?
# A: 

# Q2. Why should a date string be parsed using an explicit format?
# A: 

# Q3. What is the difference between a Date object and a POSIXct object?
# A: 

# Q4. What does NA after date parsing indicate?
# A: 

# Q5. Why must a time zone be documented when working with date-time data?
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_08_DTS211_student.R in your project and commit your notes.
