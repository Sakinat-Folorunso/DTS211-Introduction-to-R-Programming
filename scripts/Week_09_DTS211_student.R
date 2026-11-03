# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 9 of 12 (student script)
# Control Structures and Vectorised Operations
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain how control structures alter the order in which R statements
#  1. are executed.
#  2. Construct logical expressions using comparison and logical
#  2. operators.
#  3. Use if, if...else, and nested conditions to make decisions.
#  4. Use ifelse() and if_else() appropriately for vectorised conditional
#  4. operations.
#  5. Explain the difference between scalar decision-making and element-
#  5. wise vectorised decisions.
#  6. Use for, while, and repeat loops for controlled repetition.
#  7. Apply break and next to manage loop execution.
#  8. Recognise when vectorised operations are clearer and more efficient
#  8. than explicit loops.
#  9. Test control-flow code using small examples and boundary cases.
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
# SECTION: 3. Logical expressions and conditions
# =====================================================================

# ---- 3.1 Comparison operators ----------------------------------------
# WHY: | < | Less than | age < 18 | | >= | Greater than or equal to |
# WHY: score >= 50 | | <= | Less than or equal to | attendance <= 10 |
# PREDICT: before you run it, say in one sentence what this block should show.
score <- 72

score >= 50
score == 72
score != 0


# ---- 3.2 Logical operators -------------------------------------------
# WHY: Because the error stops a faulty script immediately, this is a
# WHY: safety feature.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
x <- c(2, 8, 12, 18)

x > 5 & x < 15
# Evaluated element by element: FALSE  TRUE  TRUE FALSE

# EXPECTED ERROR in R 4.3.0 or later: 'length = 4' in coercion to 'logical(1)'
try(x > 5 && x < 15)


# ---- 3.3 Combining conditions ----------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
age <- 21
has_id <- TRUE

age >= 18 & has_id
age < 18 | !has_id
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Parentheses make complex expressions easier to read:
# PREDICT: before you run it, say in one sentence what this block should show.
score <- 48
attendance <- 80
approved_exception <- FALSE

(score >= 50 & attendance >= 75) | approved_exception


# ---- 3.4 Missing values in logical expressions -----------------------
# WHY: Comparisons involving NA often return NA, because R cannot
# WHY: determine whether the unknown value satisfies the condition.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
marks <- c(45, 67, NA, 82)

marks >= 50
is.na(marks)

# WHY: Do not assume that NA behaves like FALSE in every context.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
!is.na(marks) & marks >= 50
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 4. Selection with if
# =====================================================================

# ---- 4.1 The basic if statement --------------------------------------
# WHY: if executes its body when a single condition is TRUE.
# CHECK: after running, type the object name in the Console. What does R show?
score <- 68

if (score >= 50) {
  print("Pass")
}

# WHY: Incorrect approach:
# CHECK: run the block, then find the new object(s) in the Environment pane.
scores <- c(45, 60, 72)

# Do not use a vector condition directly in if:
# if (scores >= 50) print("Pass")


# ---- 4.2 if...else ---------------------------------------------------
# WHY: Use else to specify an alternative action.
# CHECK: after running, type the object name in the Console. What does R show?
score <- 42

if (score >= 50) {
  print("Pass")
} else {
  print("Not yet passed")
}
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 4.3 Multiple alternatives with else if --------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
score <- 76

if (score >= 70) {
  grade <- "A"
} else if (score >= 60) {
  grade <- "B"
} else if (score >= 50) {
  grade <- "C"
} else {
  grade <- "F"
}

grade


# ---- 4.4 Nested conditions -------------------------------------------
# WHY: An if statement may appear inside another if statement.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- 65
attendance <- 80

if (score >= 50) {
  if (attendance >= 75) {
    result <- "Pass"
  } else {
    result <- "Attendance requirement not met"
  }
} else {
  result <- "Fail"
}

result

# WHY: Where possible, combine related conditions or create a clearly
# WHY: named logical variable.
# CHECK: run the block, then find the new object(s) in the Environment pane.
eligible <- score >= 50 & attendance >= 75

if (eligible) {
  result <- "Pass"
} else {
  result <- "Review required"
}
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 5. Vectorised conditional operations
# =====================================================================

# ---- 5.1 ifelse() ----------------------------------------------------
# WHY: ifelse() evaluates a condition for each element and selects a
# WHY: corresponding value from the yes or no argument.
# PREDICT: before you run it, say in one sentence what this block should show.
scores <- c(42, 55, 71, 38, 90)

results <- ifelse(scores >= 50, "Pass", "Fail")
results

# WHY: A practical example:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
temperature <- c(24, 31, 29, 36, 27)

heat_status <- ifelse(
  temperature >= 30,
  "High",
  "Moderate"
)

heat_status


# ---- 5.2 Missing values with ifelse() --------------------------------
# WHY: If the condition contains NA, the corresponding result is usually
# WHY: NA.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
scores <- c(42, 55, NA, 71)

ifelse(scores >= 50, "Pass", "Fail")
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: If missing values need a separate label, state that rule
# WHY: explicitly:
# PREDICT: before you run it, say in one sentence what this block should show.
result <- ifelse(
  is.na(scores),
  "Not recorded",
  ifelse(scores >= 50, "Pass", "Fail")
)

result


# ---- 5.3 ifelse() and type conversion --------------------------------
# WHY: This matters when the two branches contain different data types.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
x <- c(1, 2, 3, 4)

ifelse(x %% 2 == 0, "even", 0)

# WHY: For more predictable type behaviour in tidyverse workflows,
# WHY: dplyr::if_else() requires compatible branch types:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# install.packages("dplyr")  # run once if needed
library(dplyr)

if_else(x %% 2 == 0, "even", "odd")
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 6. Iteration with loops
# =====================================================================

# ---- 6.1 The for loop ------------------------------------------------
# WHY: A for loop iterates over the elements of a sequence.
# CHECK: after running, type the object name in the Console. What does R show?
for (i in 1:5) {
  print(i)
}

# WHY: A more meaningful example:
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_names <- c("Ada", "Bola", "Chika")

for (student in student_names) {
  print(paste("Welcome", student))
}

# WHY: A loop can also accumulate results, although pre-allocation is
# WHY: preferable for larger tasks.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
scores <- c(45, 60, 72, 38)
labels <- character(length(scores))

for (i in seq_along(scores)) {
  if (scores[i] >= 50) {
    labels[i] <- "Pass"
  } else {
    labels[i] <- "Fail"
  }
}

labels
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 6.2 The while loop ----------------------------------------------
# WHY: A while loop repeats as long as its condition is TRUE.
# CHECK: run the block, then find the new object(s) in the Environment pane.
counter <- 1

while (counter <= 5) {
  print(counter)
  counter <- counter + 1
}


# ---- 6.3 The repeat loop ---------------------------------------------
# WHY: A repeat loop continues until it encounters an explicit break.
# CHECK: after running, type the object name in the Console. What does R show?
counter <- 1

repeat {
  print(counter)
  counter <- counter + 1

  if (counter > 5) {
    break
  }
}


# ---- 6.4 break and next ----------------------------------------------
# WHY: - next skips the remainder of the current iteration and moves to
# WHY: the next iteration.
# CHECK: run the block, then find the new object(s) in the Environment pane.
for (i in 1:10) {
  if (i == 7) {
    break
  }
  print(i)
}
# INVESTIGATE: explain this block to a classmate in two sentences.

# CHECK: after running, type the object name in the Console. What does R show?
for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  print(i)
}


# =====================================================================
# SECTION: 7. Vectorised operations
# =====================================================================

# ---- 7.1 What does vectorisation mean? -------------------------------
# WHY: A vectorised operation applies an operation to a vector's elements
# WHY: without requiring the programmer to write an explicit loop.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
scores <- c(45, 60, 72, 38)

scores + 5
scores * 1.1
scores >= 50


# ---- 7.2 Arithmetic vectorisation ------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
quiz <- c(12, 15, 18, 10)
exam <- c(55, 62, 70, 48)

total <- quiz + exam
average <- total / 2

total
average
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.3 Recycling ---------------------------------------------------
# WHY: When vectors of unequal lengths are combined, R may recycle the
# WHY: shorter vector.
# PREDICT: before you run it, say in one sentence what this block should show.
scores <- c(40, 50, 60, 70)
bonus <- c(2, 5)

scores + bonus

# WHY: Recycling can be useful, but it can also create silent mistakes if
# WHY: the lengths are not compatible or the pairing is not intended.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# EXPECTED WARNING: read the warning message R prints, then explain its cause.
c(1, 2, 3, 4, 5) + c(10, 20)


# ---- 7.4 Vectorised functions ----------------------------------------
# WHY: Many common R functions work on entire vectors:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
x <- c(4, 8, 2, 10, 6)

sum(x)
mean(x)
min(x)
max(x)
sqrt(x)
round(x / 3, 2)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 7.5 Vectorisation versus loops ----------------------------------
# WHY: The following two approaches calculate the same result.
# PREDICT: before you run it, say in one sentence what this block should show.
scores <- c(45, 60, 72, 38)

# Vectorised approach
pass_vectorised <- scores >= 50

# Loop approach
pass_loop <- logical(length(scores))

for (i in seq_along(scores)) {
  pass_loop[i] <- scores[i] >= 50
}

pass_vectorised
pass_loop
identical(pass_vectorised, pass_loop)


# =====================================================================
# SECTION: 8. A worked example: student assessment decisions
# =====================================================================
# WHY: The following synthetic dataset contains scores and attendance
# WHY: percentages for six students.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005", "DTS006"),
  coursework = c(18, 15, 12, 20, 9, 17),
  examination = c(55, 48, 61, 42, 35, 63),
  attendance = c(85, 90, 72, 78, 60, 95)
)

students$total <- students$coursework + students$examination
students


# ---- Step 1: Calculate total scores using vectorisation --------------
# CHECK: after running, type the object name in the Console. What does R show?
students$total <- students$coursework + students$examination
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- Step 2: Classify scores -----------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students$grade <- ifelse(
  students$total >= 70, "A",
  ifelse(
    students$total >= 60, "B",
    ifelse(
      students$total >= 50, "C",
      "F"
    )
  )
)

students[, c("student_id", "total", "grade")]


# ---- Step 3: Determine eligibility using a combined condition --------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students$eligible <- students$total >= 50 & students$attendance >= 75

students[, c("student_id", "total", "attendance", "eligible")]


# ---- Step 4: Handle missing values explicitly ------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students$attendance[3] <- NA

students$attendance_status <- ifelse(
  is.na(students$attendance),
  "Attendance not recorded",
  ifelse(students$attendance >= 75, "Meets threshold", "Below threshold")
)

students[, c("student_id", "attendance", "attendance_status")]
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Step 5: Repeat a calculation using a loop -----------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students$decision_loop <- character(nrow(students))

for (i in seq_len(nrow(students))) {
  if (is.na(students$attendance[i])) {
    students$decision_loop[i] <- "Review"
  } else if (students$total[i] >= 50 && students$attendance[i] >= 75) {
    students$decision_loop[i] <- "Eligible"
  } else {
    students$decision_loop[i] <- "Not eligible"
  }
}

students[, c("student_id", "total", "attendance", "decision_loop")]


# =====================================================================
# SECTION: 9. Testing and boundary cases
# =====================================================================
# WHY: Test values just below, exactly at, and just above a threshold.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
test_scores <- c(49, 50, 51)

ifelse(test_scores >= 50, "Pass", "Fail")


# =====================================================================
# SECTION: 11. Guided practical (225 minutes)
# =====================================================================

# ---- Part A — Logical expressions (30 minutes) -----------------------
# CHECK: after running, type the object name in the Console. What does R show?
scores <- c(35, 49, 50, 67, 82, NA)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Part E — Vectorisation and comparison (45 minutes) --------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
continuous_assessment <- c(14, 18, 12, 20, 16)
examination <- c(51, 62, 49, 58, 67)


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Title: Decision Rules and Repeated Computation
# Create a synthetic dataset of at least 15 records related to student
# assessment, agricultural yield classification, library fines, or campus
# service eligibility.
# Your script must:
# TASK 1: Create or read the dataset.
# YOUR CODE:


# TASK 2: Define at least two logical conditions.
# YOUR CODE:


# TASK 3: Use if...else if...else for one individual decision.
# YOUR CODE:


# TASK 4: Use ifelse() to classify a vector.
# YOUR CODE:


# TASK 5: Use a for loop to calculate or process a result.
# YOUR CODE:


# TASK 6: Include a missing-value case and handle it explicitly.
# YOUR CODE:


# TASK 7: Compare a loop-based result with a vectorised result for at
# TASK 7: least one equivalent operation.
# YOUR CODE:


# TASK 8: Test at least three boundary cases.
# YOUR CODE:


# TASK 9: Include comments explaining the logic.
# YOUR CODE:


# Submit the .R script and a 500–700 word explanation of the decision
# rules, tests, and choice of vectorised operations or loops.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Q1. Why must the condition in a basic if statement resolve to one
# Q1. logical value?
# A: 

# Q2. When should ifelse() be used instead of if?
# A: 

# Q3. What is the difference between & and &&?
# A: 

# Q4. What can cause a while loop to continue indefinitely?
# A: 

# Q5. Give one example where a vectorised expression is clearer than a
# Q5. loop.
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_09_DTS211_student.R in your project and commit your notes.
