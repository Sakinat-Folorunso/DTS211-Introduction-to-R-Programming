# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 6 of 12 (student script)
# Cleaning and Transforming Data
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. explain the purpose of data cleaning and transformation;
#  2. distinguish raw data, working data and cleaned data;
#  3. identify common data-quality dimensions and problems;
#  4. inspect variable types, dimensions, missing values and duplicates;
#  5. detect inconsistent text values, leading/trailing spaces and case
#  5. differences;
#  6. convert variables to appropriate types where justified;
#  7. identify invalid, implausible and out-of-range values using domain
#  7. rules;
#  8. investigate and handle missing values using an explicitly stated
#  8. decision;
#  9. identify duplicate rows and duplicate identifiers;
#  10. create, recode, rename and derive variables;
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
# SECTION: 3. Start with inspection, not modification
# =====================================================================
# WHY: Run source("00_make_data.R") once so that data/students_raw.csv
# WHY: exists, then import it:
# CHECK: after running, type the object name in the Console. What does R show?
students <- read.csv(
  "data/students_raw.csv",
  na.strings = c("", "NA")
)

# WHY: Begin with:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)


# ---- 3.1 Inspect variable types --------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
sapply(students, class)
sapply(students, typeof)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 3.2 Inspect missing values --------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
is.na(students)
anyNA(students)
colSums(is.na(students))
colMeans(is.na(students)) * 100


# ---- 3.3 Inspect unique values ---------------------------------------
# WHY: For a categorical or text variable:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
unique(students$programme)
table(students$programme, useNA = "ifany")


# ---- 3.4 Inspect numerical ranges ------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
range(students$age, na.rm = TRUE)
range(students$score, na.rm = TRUE)
summary(students$age)
summary(students$score)
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 4. Working safely: preserve the raw data
# =====================================================================
# WHY: A safe workflow creates a separate working object:
# CHECK: after running, type the object name in the Console. What does R show?
students_raw <- read.csv(
  "data/students_raw.csv",
  na.strings = c("", "NA")
)

students_clean <- students_raw


# ---- 4.1 Compare before and after ------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
dim(students_raw)
dim(students_clean)

names(students_raw)
names(students_clean)


# =====================================================================
# SECTION: 5. Cleaning inconsistent text values
# =====================================================================

# ---- 5.1 Leading and trailing spaces ---------------------------------
# WHY: A value may contain spaces before or after the meaningful text:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
programme <- c(
  "Computer Science",
  " Statistics",
  "Mathematics ",
  "Computer Science "
)

programme
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: Use trimws() to remove leading and trailing whitespace:
# PREDICT: before you run it, say in one sentence what this block should show.
programme_clean <- trimws(programme)
programme_clean

# WHY: For a data-frame column:
# CHECK: after running, type the object name in the Console. What does R show?
students_clean$programme <- trimws(students_clean$programme)


# ---- 5.2 Inconsistent letter case ------------------------------------
# WHY: Character comparisons are case-sensitive:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
"Statistics" == "statistics"
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Functions such as tolower() and toupper() can standardise letter
# WHY: case:
# PREDICT: before you run it, say in one sentence what this block should show.
tolower(c("Computer Science", "STATISTICS", "Mathematics"))
toupper(c("Computer Science", "statistics", "Mathematics"))

# WHY: For a category column:
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean$programme <- tolower(
  trimws(students_clean$programme)
)


# ---- 5.3 Recode known variants ---------------------------------------
# WHY: Base R replacement:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_clean$programme[
  students_clean$programme == "Comp. Science"
] <- "Computer Science"
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: In dplyr 1.1.0 and later recode() is superseded by case_match(); it
# WHY: still works and is common in existing code, so students should
# WHY: recognise both:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# install.packages("dplyr")  # Run once if needed
library(dplyr)

students_clean <- students_clean |>
  mutate(
    programme = recode(
      programme,
      "Comp. Science" = "Computer Science",
      "computer science" = "Computer Science"
    )
  )


# ---- 5.4 Standardise text with a sequence of operations --------------
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_clean |>
  mutate(
    programme = trimws(programme),
    programme = tolower(programme)
  )

# WHY: Then inspect again:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
unique(students_clean$programme)
table(students_clean$programme, useNA = "ifany")
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 6. Correcting variable types
# =====================================================================

# ---- 6.1 Character to numeric ----------------------------------------
# WHY: A numeric variable may have been imported as character because of
# WHY: spaces or non-numeric text.
# CHECK: after running, type the object name in the Console. What does R show?
students_clean$score <- as.numeric(
  trimws(students_clean$score)
)

# WHY: Inspect before and after:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
str(students_clean$score)
unique(students_clean$score)


# ---- 6.2 Character to factor -----------------------------------------
# WHY: For a categorical variable:
# CHECK: after running, type the object name in the Console. What does R show?
students_clean$programme <- factor(
  students_clean$programme
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: If the intended categories and order are known, specify them:
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean$study_mode <- factor(
  students_clean$study_mode,
  levels = c("Full-time", "Part-time")
)

# WHY: Check the result:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
table(students_clean$study_mode, useNA = "ifany")


# ---- 6.3 Numeric-looking identifiers ---------------------------------
# WHY: An identifier is not necessarily a measurement.
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_id <- c("001", "002", "003")
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 6.4 Logical variables -------------------------------------------
# WHY: A variable representing yes/no or true/false may be stored as text:
# CHECK: after running, type the object name in the Console. What does R show?
registered <- c("Yes", "No", "Yes", "No")

# WHY: A documented conversion can be applied:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
registered_logical <- registered == "Yes"
registered_logical


# =====================================================================
# SECTION: 7. Detecting and handling missing values
# =====================================================================

# ---- 7.1 Count missing values ----------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
sum(is.na(students_clean))
colSums(is.na(students_clean))
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.2 Identify incomplete rows ------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
incomplete_rows <- students_clean[
  !complete.cases(students_clean),
]

incomplete_rows


# ---- 7.3 Select complete observations --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_complete <- students_clean[
  complete.cases(students_clean),
]


# ---- 7.4 Remove missing values for a specific variable ---------------
# WHY: If a particular task requires a score, select rows with observed
# WHY: scores:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_with_scores <- students_clean[
  !is.na(students_clean$score),
]
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 7.5 Do not replace missing values with zero automatically -------
# WHY: This is generally unsafe:
# PREDICT: before you run it, say in one sentence what this block should show.
# Do not do this without a defensible reason:
students_clean$score[is.na(students_clean$score)] <- 0


# =====================================================================
# SECTION: 8. Detecting duplicate records
# =====================================================================

# ---- 8.1 Find fully duplicated rows ----------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
duplicated(students_clean)
sum(duplicated(students_clean))


# ---- 8.2 View duplicated rows ----------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_clean[
  duplicated(students_clean),
]
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 8.3 Remove exact duplicate rows ---------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students_unique <- students_clean[
  !duplicated(students_clean),
]


# ---- 8.4 Check duplicated identifiers --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
duplicated(students_clean$student_id)
sum(duplicated(students_clean$student_id))

# WHY: To inspect records with repeated IDs:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_clean[
  duplicated(students_clean$student_id) |
    duplicated(students_clean$student_id, fromLast = TRUE),
]
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 8.5 Keep the first or last record only when justified -----------
# WHY: The following keeps the first occurrence of each ID:
# PREDICT: before you run it, say in one sentence what this block should show.
students_one_per_id <- students_clean[
  !duplicated(students_clean$student_id),
]


# =====================================================================
# SECTION: 9. Identifying invalid and implausible values
# =====================================================================

# ---- 9.1 Apply domain rules ------------------------------------------
# WHY: Suppose the score scale is documented as 0 to 100:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_clean$score < 0 |
  students_clean$score > 100

# WHY: Identify records violating the rule:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
invalid_scores <- students_clean[
  !is.na(students_clean$score) &
    (students_clean$score < 0 | students_clean$score > 100),
]

invalid_scores
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 9.2 Check plausible age ranges ----------------------------------
# WHY: This is an illustrative rule, not a universal rule for every study.
# PREDICT: before you run it, say in one sentence what this block should show.
invalid_ages <- students_clean[
  !is.na(students_clean$age) &
    (students_clean$age < 15 | students_clean$age > 100),
]


# ---- 9.3 Flag first; do not silently delete --------------------------
# WHY: A useful approach is to create a logical flag:
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_clean |>
  mutate(
    score_out_of_range = !is.na(score) &
      (score < 0 | score > 100)
  )


# =====================================================================
# SECTION: 10. Transforming variables
# =====================================================================

# ---- 10.1 Create a derived variable ----------------------------------
# WHY: Suppose the score scale is 0–100 and the exercise defines 50 as the
# WHY: pass threshold:
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean <- students_clean |>
  mutate(
    pass_status = case_when(
      is.na(score) ~ NA_character_,
      score >= 50 ~ "Pass",
      score < 50 ~ "Not yet passed"
    )
  )
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 10.2 Create a grouped age variable ------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_clean |>
  mutate(
    age_group = case_when(
      age < 20 ~ "Under 20",
      age >= 20 & age < 25 ~ "20–24",
      age >= 25 ~ "25 and above",
      TRUE ~ NA_character_
    )
  )


# ---- 10.3 Recode a variable ------------------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean <- students_clean |>
  mutate(
    study_mode = recode(
      study_mode,
      "FT" = "Full-time",
      "PT" = "Part-time"
    )
  )


# ---- 10.4 Rename variables -------------------------------------------
# WHY: Base R:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
names(students_clean)
names(students_clean)[names(students_clean) == "Student Name"] <- "student_name"
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: Here the result is stored in a separate object so that
# WHY: students_clean keeps its original column names for the sections
# WHY: that follow:
# PREDICT: before you run it, say in one sentence what this block should show.
students_renamed <- students_clean |>
  rename(
    student_name = name,
    assessment_score = score
  )

names(students_renamed)


# ---- 10.5 Select columns ---------------------------------------------
# WHY: Base R:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_selected <- students_clean[
  ,
  c("student_id", "programme", "score")
]

# WHY: With dplyr:
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_selected <- students_clean |>
  select(student_id, programme, score)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 10.6 Filter rows ------------------------------------------------
# WHY: Base R:
# PREDICT: before you run it, say in one sentence what this block should show.
students_passed <- students_clean[
  !is.na(students_clean$score) &
    students_clean$score >= 50,
]

# WHY: With dplyr:
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_passed <- students_clean |>
  filter(!is.na(score), score >= 50)


# ---- 10.7 Arrange observations ---------------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
students_sorted <- students_clean |>
  arrange(score)

students_sorted_desc <- students_clean |>
  arrange(desc(score))
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 10.8 Create summary variables by group --------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
programme_summary <- students_clean |>
  group_by(programme) |>
  summarise(
    number_of_students = n(),
    mean_score = mean(score, na.rm = TRUE),
    observed_scores = sum(!is.na(score)),
    .groups = "drop"
  )


# ---- 10.9 Reshape data: a first look ---------------------------------
# WHY: A simple tidyr::pivot_longer() example:
# CHECK: after running, type the object name in the Console. What does R show?
# install.packages("tidyr")  # Run once if needed
library(tidyr)

# A small wide-format table: one row per student, one column per test
scores_wide <- data.frame(
  student_id = c("DTS001", "DTS002"),
  test1 = c(68, 74),
  test2 = c(72, 78),
  test3 = c(75, 80)
)

scores_long <- scores_wide |>
  pivot_longer(
    cols = starts_with("test"),
    names_to = "test",
    values_to = "score"
  )


# =====================================================================
# SECTION: 11. A practical introduction to dplyr and tidyr
# =====================================================================
# WHY: Install packages once:
# CHECK: run the block, then find the new object(s) in the Environment pane.
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")
if (!requireNamespace("tidyr", quietly = TRUE)) install.packages("tidyr")
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: Load them in an R session:
# CHECK: after running, type the object name in the Console. What does R show?
library(dplyr)
library(tidyr)


# ---- 11.1 The pipe operator ------------------------------------------
# WHY: The pipe |> passes the result on its left as the first argument to
# WHY: the function on its right.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students_clean |>
  filter(!is.na(score)) |>
  select(student_id, programme, score) |>
  arrange(desc(score))


# ---- 11.3 A compact transformation pipeline --------------------------
# CHECK: after running, type the object name in the Console. What does R show?
analysis_data <- students_clean |>
  mutate(
    programme = trimws(programme)
  ) |>
  filter(!is.na(student_id)) |>
  select(student_id, programme, study_mode, score) |>
  arrange(student_id)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 12. Worked example: diagnose and clean a departmental dataset
# =====================================================================
# WHY: The following deliberately imperfect dataset contains common
# WHY: problems for teaching purposes.
# PREDICT: before you run it, say in one sentence what this block should show.
students_raw <- data.frame(
  student_id = c(
    "DTS001", "DTS002", "DTS003", "DTS004",
    "DTS005", "DTS006", "DTS006", "DTS008"
  ),
  name = c(
    " Amina", "Bola ", "Chidi", "Dayo",
    "Efe", "Fola", "Fola", "Ganiyu"
  ),
  programme = c(
    "Computer Science", "statistics", "Mathematics ",
    "Comp. Science", "Statistics", "Mathematics",
    "Mathematics", "Computer Science"
  ),
  age = c(21, 22, -3, 23, 21, 22, 22, NA),
  score = c(68, 74, 55, 105, NA, 77, 77, 69),
  study_mode = c(
    "Full-time", "FT", "Part-time", "Full-time",
    "PT", "Full-time", "Full-time", "Part-time"
  ),
  stringsAsFactors = FALSE
)

students_raw
str(students_raw)


# ---- 12.1 Preserve the source and create a working copy --------------
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_raw


# ---- 12.2 Inspect the original problems ------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
dim(students_raw)
colSums(is.na(students_raw))
unique(students_raw$programme)
unique(students_raw$study_mode)
duplicated(students_raw$student_id)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 12.3 Standardise text -------------------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_clean |>
  mutate(
    name = trimws(name),
    programme = trimws(programme),
    study_mode = trimws(study_mode)
  )


# ---- 12.4 Recode documented variants ---------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean <- students_clean |>
  mutate(
    programme = recode(
      programme,
      "statistics" = "Statistics",
      "Comp. Science" = "Computer Science"
    ),
    study_mode = recode(
      study_mode,
      "FT" = "Full-time",
      "PT" = "Part-time"
    )
  )


# ---- 12.5 Flag values outside the stated rules -----------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_clean <- students_clean |>
  mutate(
    age_invalid = !is.na(age) & age < 15,
    score_invalid = !is.na(score) & (score < 0 | score > 100)
  )

students_clean[
  students_clean$age_invalid | students_clean$score_invalid,
]
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 12.6 Investigate duplicate identifiers --------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students_clean[
  duplicated(student_id) |
    duplicated(student_id, fromLast = TRUE),
]

# WHY: If the data dictionary confirms that student ID must be unique and
# WHY: repeated rows are accidental duplicates, exact duplicate rows can
# WHY: be removed:
# CHECK: after running, type the object name in the Console. What does R show?
students_clean <- students_clean |>
  distinct()


# ---- 12.7 Apply a documented decision to invalid values --------------
# WHY: For this teaching example, suppose the original source cannot be
# WHY: checked and the agreed rule is to mark impossible values as missing
# WHY: while preservi...
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean <- students_clean |>
  mutate(
    age = ifelse(age_invalid, NA, age),
    score = ifelse(score_invalid, NA, score)
  )
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 12.8 Reinspect the result ---------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
str(students_clean)
summary(students_clean)
unique(students_clean$programme)
unique(students_clean$study_mode)
colSums(is.na(students_clean))


# ---- 12.9 Create categorical variables and a derived status ----------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students_clean <- students_clean |>
  mutate(
    programme = factor(programme),
    study_mode = factor(
      study_mode,
      levels = c("Full-time", "Part-time")
    ),
    pass_status = case_when(
      is.na(score) ~ NA_character_,
      score >= 50 ~ "Pass",
      score < 50 ~ "Not yet passed"
    )
  )


# ---- 12.10 Summarise observed data -----------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students_clean |>
  group_by(programme) |>
  summarise(
    records = n(),
    observed_scores = sum(!is.na(score)),
    mean_score = mean(score, na.rm = TRUE),
    .groups = "drop"
  )
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 13. Validation: how do we know the cleaning worked?
# =====================================================================

# ---- 13.1 Check dimensions -------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
dim(students_raw)
dim(students_clean)


# ---- 13.2 Check identifiers ------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
anyDuplicated(students_clean$student_id)


# ---- 13.3 Check category values --------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
table(students_clean$programme, useNA = "ifany")
table(students_clean$study_mode, useNA = "ifany")
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 13.4 Check numerical ranges -------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
range(students_clean$score, na.rm = TRUE)
range(students_clean$age, na.rm = TRUE)


# ---- 13.5 Check missingness after cleaning ---------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
colSums(is.na(students_clean))


# ---- 13.6 Compare raw and cleaned records ----------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
head(students_raw)
head(students_clean)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 14. Cleaning log and reproducibility
# =====================================================================

# ---- 14.1 Save the cleaned dataset -----------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
write.csv(
  students_clean,
  "output/students_clean.csv",
  row.names = FALSE,
  na = "NA"
)

saveRDS(
  students_clean,
  "output/students_clean.rds"
)


# =====================================================================
# SECTION: 16. Guided practical: clean a student survey dataset
# =====================================================================

# ---- Task B: Import and preserve the raw data ------------------------
# CHECK: after running, type the object name in the Console. What does R show?
survey_raw <- read.csv(
  "data/student_survey_raw.csv",
  na.strings = c("", "NA")
)

survey_clean <- survey_raw


# =====================================================================
# SECTION: 21. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the purpose of each expression before running it:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
x <- c(" Computer Science", "statistics ", "Mathematics")

trimws(x)
tolower(trimws(x))

values <- c(10, NA, 20, 30)
sum(is.na(values))
mean(values, na.rm = TRUE)

df <- data.frame(
  id = c("A01", "A02", "A02"),
  score = c(70, 80, 80)
)

duplicated(df)
duplicated(df$id)

# Using dplyr
df |>
  mutate(pass = score >= 50) |>
  arrange(desc(score))
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Use a dataset of at least 20 observations and six variables. It may be a
# teaching dataset, synthetic dataset or a dataset you are authorised to
# use.
# Your work must:
# TASK 1: Import and preserve the raw dataset.
# YOUR CODE:


# TASK 2: Describe the unit of observation.
# YOUR CODE:


# TASK 3: Inspect dimensions, names, types and summaries.
# YOUR CODE:


# TASK 4: Quantify missing values by variable.
# YOUR CODE:


# TASK 5: Identify at least one text inconsistency.
# YOUR CODE:


# TASK 6: Check for duplicate rows and duplicate identifiers where an
# TASK 6: identifier exists.
# YOUR CODE:


# TASK 7: Apply at least two documented validity checks.
# YOUR CODE:


# TASK 8: Correct or flag issues using justified rules.
# YOUR CODE:


# TASK 9: Create at least two derived variables.
# YOUR CODE:


# TASK 10: Select and arrange observations for one stated question.
# YOUR CODE:


# TASK 11: Produce a grouped summary.
# YOUR CODE:


# TASK 12: Validate the final dataset.
# YOUR CODE:


# TASK 13: Export the cleaned dataset to CSV and RDS.
# YOUR CODE:


# TASK 14: Submit a cleaning log and a short interpretation.
# YOUR CODE:


# Do not remove observations merely to make the dataset look complete.
# Explain the effect of every exclusion or recoding decision.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer in your own words:
# Q1. What is data cleaning?
# A: 

# Q2. Why should raw data be preserved?
# A: 

# Q3. What is the difference between completeness and validity?
# A: 

# Q4. How can leading and trailing spaces affect category counts?
# A: 

# Q5. Why is trimws() useful?
# A: 

# Q6. Why should identifiers not automatically be converted to numeric?
# A: 

# Q7. What does complete.cases() identify?
# A: 

# Q8. Why is replacing NA with zero potentially misleading?
# A: 

# Q9. What is the difference between a duplicate row and a repeated
# Q9. identifier?
# A: 

# Q10. Why should unusual values be flagged before deletion?
# A: 

# Q11. What does mutate() do?
# A: 

# Q12. What is the purpose of filter()?
# A: 

# Q13. What does group_by() do before summarise()?
# A: 

# Q14. Why should a cleaned dataset be validated?
# A: 

# Q15. What information belongs in a cleaning log?
# A: 

# Predict the purpose of each expression before running it:
# Explain what each operation does and identify any decision that would
# require knowledge of the dataset.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_06_DTS211_student.R in your project and commit your notes.
