# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 11 of 12 (student script)
# Coding Standards, Debugging and Profiling R Code
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain why coding standards improve readability, collaboration,
#  1. reproducibility, and maintenance.
#  2. Apply consistent naming, indentation, spacing, commenting, and
#  2. script organisation practices.
#  3. Distinguish syntax errors, runtime errors, warnings, and logical
#  3. errors.
#  4. Use RStudio and base R tools to locate and diagnose errors.
#  5. Interpret common error messages and use them to guide debugging.
#  6. Use traceback(), browser(), debug(), undebug(), stopifnot(), and
#  6. tryCatch() in simple debugging workflows.
#  7. Explain the purpose of profiling and distinguish elapsed time from
#  7. memory use.
#  8. Use system.time() to compare alternative implementations of a task.
#  9. Use Rprof() and summaryRprof() for a basic introduction to profiling
#  9. when supported by the R installation.
#  10. Improve a short R script while preserving the correctness of its
#  10. results.
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
# SECTION: 3. Coding standards: making R code readable
# =====================================================================

# ---- 3.1 Meaningful object and function names ------------------------
# WHY: Use names that communicate purpose.
# CHECK: after running, type the object name in the Console. What does R show?
# Less informative
x <- 24
f <- function(a, b) {
  a + b
}

# More informative
coursework_score <- 24

calculate_total_score <- function(coursework, examination) {
  coursework + examination
}


# ---- 3.2 Naming conventions ------------------------------------------
# WHY: A common R convention is snake_case, where words are separated by
# WHY: underscores.
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_scores <- c(45, 67, 82)
average_score <- mean(student_scores)

calculate_average <- function(values) {
  mean(values)
}


# ---- 3.3 Indentation and spacing -------------------------------------
# WHY: Use indentation to show the structure of functions, loops, and
# WHY: conditions.
# CHECK: after running, type the object name in the Console. What does R show?
calculate_grade <- function(score) {
  if (score >= 70) {
    "A"
  } else if (score >= 60) {
    "B"
  } else if (score >= 50) {
    "C"
  } else {
    "F"
  }
}
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Spaces around operators improve readability:
# CHECK: run the block, then find the new object(s) in the Environment pane.
coursework <- 20
examination <- 60

# Harder to scan
total<-coursework+examination

# Easier to scan
total <- coursework + examination


# ---- 3.4 Comments: explain why, not every obvious action -------------
# WHY: Comments should clarify assumptions, decisions, or non-obvious
# WHY: reasoning.
# CHECK: after running, type the object name in the Console. What does R show?
# Apply the approved 30:70 coursework-to-examination weighting.
final_score <- coursework * 0.30 + examination * 0.70

# WHY: Avoid comments that merely repeat the code:
# CHECK: run the block, then find the new object(s) in the Environment pane.
a <- 5
b <- 7

# Add a and b
total <- a + b
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 3.5 Script organisation -----------------------------------------
# WHY: Example structure:
# PREDICT: before you run it, say in one sentence what this block should show.
# ============================================================
# Project: DTS 211 student score demonstration
# Purpose: Calculate and validate total scores
# ============================================================

# 1. Configuration
coursework_weight <- 0.30
examination_weight <- 0.70

# 2. Example data
coursework <- c(18, 20, 15)
examination <- c(55, 60, 48)

# 3. Calculation
total_score <- coursework * coursework_weight +
  examination * examination_weight

# 4. Inspection
print(total_score)


# ---- 3.6 Avoid hard-coded and machine-specific paths -----------------
# WHY: A script that works only because it refers to one person's desktop
# WHY: is difficult to share.
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Avoid machine-specific paths such as:
# "C:/Users/Name/Desktop/project/data.csv"

# Prefer a project-relative path:
data_file <- "data/student_scores.csv"


# ---- 3.7 Use functions to avoid duplicated code ----------------------
# WHY: When a calculation is repeated, consider placing it in a function.
# CHECK: after running, type the object name in the Console. What does R show?
calculate_total <- function(coursework, examination) {
  coursework + examination
}

student_a_total <- calculate_total(18, 55)
student_b_total <- calculate_total(20, 60)
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 4. Types of programming defects
# =====================================================================

# ---- 4.1 Syntax errors -----------------------------------------------
# WHY: A syntax error occurs when code does not follow the language's
# WHY: grammar.
# PREDICT: before you run it, say in one sentence what this block should show.
# Missing closing parenthesis:
# mean(c(10, 20, 30)

# Correct:
mean(c(10, 20, 30))


# ---- 4.2 Runtime errors ----------------------------------------------
# WHY: A runtime error occurs while R is executing code.
# CHECK: after running, type the object name in the Console. What does R show?
# This attempts to use an object that does not exist:
# total_score + bonus


# ---- 4.3 Warnings ----------------------------------------------------
# WHY: A warning indicates that R has completed or attempted an operation
# WHY: but detected something that may be problematic.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# Example of a warning caused by non-multiple vector lengths:
# EXPECTED WARNING: read the warning message R prints, then explain its cause.
c(1, 2, 3, 4, 5) + c(10, 20)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.4 Logical errors ----------------------------------------------
# WHY: A logical error occurs when the program runs but produces the wrong
# WHY: result because the algorithm or rule is incorrect.
# CHECK: after running, type the object name in the Console. What does R show?
# Intended: pass mark is 50 or above
score <- 50

# Incorrect rule:
passed <- score > 50

# Correct rule:
passed <- score >= 50


# =====================================================================
# SECTION: 6. Inspecting objects and intermediate results
# =====================================================================
# WHY: Many errors become easier to diagnose when the programmer checks
# WHY: what R actually holds.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
scores <- c(45, 60, 72, 38)

class(scores)
typeof(scores)
length(scores)
str(scores)
summary(scores)

# WHY: For a data frame:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student_data <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003"),
  score = c(55, 72, 48)
)

str(student_data)
names(student_data)
dim(student_data)
head(student_data)
summary(student_data)
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 7. Reading error messages
# =====================================================================
# WHY: An error message is evidence. Read it carefully before editing
# WHY: code. For example:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Example:
# mean_value <- mean(score_values)


# =====================================================================
# SECTION: 8. RStudio debugging features
# =====================================================================

# ---- 8.1 traceback() -------------------------------------------------
# WHY: After an error occurs, traceback() can show the sequence of calls
# WHY: that led to it.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# After an error in the Console:
traceback()


# ---- 8.2 browser() ---------------------------------------------------
# WHY: Insert browser() at a point where you want execution to pause.
# INTERACTIVE: this block opens the debugger or a viewer. In RStudio, remove the
# leading '# ' from the lines below, run them in the Console, and type Q to quit.
# calculate_ratio <- function(numerator, denominator) {
#   browser()
#   result <- numerator / denominator
#   result
# }
#
# calculate_ratio(10, 2)


# ---- 8.3 debug() and undebug() ---------------------------------------
# WHY: debug() marks a function so that the next call enters interactive
# WHY: debugging.
# INTERACTIVE: this block opens the debugger or a viewer. In RStudio, remove the
# leading '# ' from the lines below, run them in the Console, and type Q to quit.
# calculate_mean <- function(values) {
#   total <- sum(values)
#   count <- length(values)
#   total / count
# }
#
# debug(calculate_mean)
# calculate_mean(c(10, 20, 30))
#
# undebug(calculate_mean)


# =====================================================================
# SECTION: 9. Assertions and error handling
# =====================================================================

# ---- 9.1 stopifnot() for assumptions ---------------------------------
# WHY: If it is not, execution stops.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
scores <- c(45, 60, 72, 38)

stopifnot(is.numeric(scores))
stopifnot(length(scores) == 4)
stopifnot(all(scores >= 0 & scores <= 100))


# ---- 9.2 stop() for informative errors -------------------------------
# WHY: A function can stop with a message when its inputs are invalid.
# CHECK: after running, type the object name in the Console. What does R show?
calculate_percentage <- function(score, maximum = 100) {
  if (!is.numeric(score) || !is.numeric(maximum)) {
    stop("Score and maximum must be numeric.")
  }

  if (anyNA(score) || anyNA(maximum)) {
    stop("Score and maximum must not contain missing values.")
  }

  if (any(maximum <= 0)) {
    stop("Maximum must be greater than zero.")
  }

  100 * score / maximum
}
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 9.3 tryCatch() for controlled error handling --------------------
# WHY: tryCatch() allows code to respond to an error rather than allowing
# WHY: the entire script to terminate immediately.
# PREDICT: before you run it, say in one sentence what this block should show.
safe_divide <- function(a, b) {
  if (any(b == 0, na.rm = TRUE)) {
    stop("Denominator must not be zero.")
  }

  a / b
}

result <- tryCatch(
  safe_divide(10, 0),
  error = function(e) {
    message("Calculation failed: ", conditionMessage(e))
    NA_real_
  }
)

result


# =====================================================================
# SECTION: 10. Profiling: measuring program performance
# =====================================================================

# ---- 10.1 Correctness before speed -----------------------------------
# WHY: Before comparing performance, verify that both implementations
# WHY: return equivalent results.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
numbers <- seq_len(10000)

squares_loop <- numeric(length(numbers))

for (i in seq_along(numbers)) {
  squares_loop[i] <- numbers[i] ^ 2
}

squares_vectorised <- numbers ^ 2

all.equal(squares_loop, squares_vectorised)


# ---- 10.2 system.time() ----------------------------------------------
# WHY: system.time() measures how long an expression takes to execute.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
numbers <- seq_len(100000)

loop_result <- system.time({
  output <- numeric(length(numbers))

  for (i in seq_along(numbers)) {
    output[i] <- numbers[i] ^ 2
  }
})

vector_result <- system.time({
  output_vector <- numbers ^ 2
})

loop_result
vector_result
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 10.3 Repeat measurements carefully ------------------------------
# WHY: For short operations, repeat the measurement and avoid drawing
# WHY: conclusions from one run.
# PREDICT: before you run it, say in one sentence what this block should show.
numbers <- seq_len(100000)

time_vectorised <- replicate(
  5,
  system.time(numbers ^ 2)[["elapsed"]]
)

time_vectorised
median(time_vectorised)


# ---- 10.4 Rprof() and summaryRprof() ---------------------------------
# WHY: summaryRprof() summarises the profiling output.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# Basic example
Rprof("week11_profile.out")

# Run the computation to be profiled
numbers <- seq_len(1000000)
result <- sqrt(numbers)
result <- log1p(result)

Rprof(NULL)

profile_summary <- summaryRprof("week11_profile.out")
profile_summary

# WHY: After inspection, the profiling file can be removed if it is no
# WHY: longer needed:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
file.remove("week11_profile.out")
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 11. A worked example: debugging and improving an assessment script
# =====================================================================

# ---- 11.1 The flawed script ------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
coursework <- c(18, 20, 15, 22)
examination <- c(55, 60, 48, 63)

# Deliberate logical defect: uses the wrong weighting and threshold.
total <- coursework + examination
passed <- total > 50

# Deliberate naming and output issue: result is not clearly labelled.
print(passed)


# ---- 11.2 A clearer version ------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# ============================================================
# Project: DTS 211 assessment demonstration
# Purpose: Calculate totals and identify threshold attainment
# Assumption: Pass threshold for this exercise is 50 inclusive
# ============================================================

coursework_scores <- c(18, 20, 15, 22)
examination_scores <- c(32, 30, 35, 28)

stopifnot(length(coursework_scores) == length(examination_scores))
stopifnot(all(coursework_scores >= 0 & coursework_scores <= 100))
stopifnot(all(examination_scores >= 0 & examination_scores <= 100))

total_scores <- coursework_scores + examination_scores
meets_threshold <- total_scores >= 50

assessment_results <- data.frame(
  coursework = coursework_scores,
  examination = examination_scores,
  total = total_scores,
  meets_threshold = meets_threshold
)

print(assessment_results)


# =====================================================================
# SECTION: 12. Guided practical (225 minutes)
# =====================================================================

# ---- Part B — Diagnose common defects (40 minutes) -------------------
# WHY: Create and diagnose these examples one at a time:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# Syntax problem
# mean(c(2, 4, 6)

# Missing object
# average_score <- total_score / number_of_students

# Logical problem
score <- 50
passed <- score > 50

# Type problem
marks <- c(40, 55, "absent")
# EXPECTED WARNING: read the warning message R prints, then explain its cause.
mean(marks)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Title: Code Quality, Debugging and Performance Audit
# Select one of your earlier practical scripts from Weeks 5–10. Improve it
# as a small, reproducible programming project.
# Your submission must include:
# TASK 1: A clear script header and logical sections.
# YOUR CODE:


# TASK 2: Consistent object and function naming.
# YOUR CODE:


# TASK 3: Appropriate indentation, spacing, and explanatory comments.
# YOUR CODE:


# TASK 4: At least one user-defined function with input validation.
# YOUR CODE:


# TASK 5: At least three deliberate defects introduced and diagnosed:
# TASK 5: include at least one logical defect and one execution or syntax
# TASK 5: defect.
# YOUR CODE:


# TASK 6: A short debugging log recording the symptom, diagnosis,
# TASK 6: correction, and verification.
# YOUR CODE:


# TASK 7: A performance comparison between two equivalent approaches to
# TASK 7: one computational task.
# YOUR CODE:


# TASK 8: A statement explaining the limits of the timing experiment.
# YOUR CODE:


# Submit:
#   - the revised .R script;
#   - the debugging log;
#   - the timing results;
#   - a 600–800 word report explaining the improvements and evidence.
# Do not claim that one implementation is universally faster based on one
# small timing experiment. Explain the conditions under which your
# measurement was obtained.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Q1. What is the difference between a warning and an error?
# A: 

# Q2. Why can a logical error be harder to detect than a syntax error?
# A: 

# Q3. What information can traceback() provide?
# A: 

# Q4. Why should a programmer use stopifnot() or other assertions?
# A: 

# Q5. What does system.time() measure?
# A: 

# Q6. Why should code be checked for correctness before performance
# Q6. optimisation?
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_11_DTS211_student.R in your project and commit your notes.
