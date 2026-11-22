# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 10 of 12 (student script)
# Functions, Scoping Rules and Looping
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain why functions are important for reusable and maintainable R
#  1. programs.
#  2. Identify the components of a function: name, arguments, body, and
#  2. returned value.
#  3. Define and call user-created functions using function().
#  4. Use positional and named arguments, default values, and argument
#  4. checking.
#  5. Explain the difference between local and global environments in
#  5. basic R programming.
#  6. Describe lexical scoping and understand how R finds an object
#  6. referenced inside a function.
#  7. Explain the difference between returning a value and printing a
#  7. value.
#  8. Apply loops within functions and functions within repeated
#  8. workflows.
#  9. Choose between vectorised operations, loops, and user-defined
#  9. functions for a task.
#  10. Test functions with ordinary, boundary, and invalid inputs.
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
# SECTION: 2. Why functions matter
# =====================================================================
# WHY: For example, if a course repeatedly calculates a student's total
# WHY: score, the calculation can be defined once and reused for different
# WHY: students.
# PREDICT: before you run it, say in one sentence what this block should show.
calculate_total <- function(coursework, examination) {
  coursework + examination
}

calculate_total(18, 55)
calculate_total(14, 63)


# =====================================================================
# SECTION: 3. Anatomy of an R function
# =====================================================================
# WHY: The general form is:
# CHECK: run the block, then find the new object(s) in the Environment pane.
function_name <- function(argument1, argument2) {
  # statements that perform the task
  result <- argument1 + argument2
  return(result)
}


# ---- 3.1 Defining and calling a simple function ----------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
greet_student <- function(name) {
  message <- paste("Welcome to DTS 211,", name)
  return(message)
}

greet_student("Ada")
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 3.2 Functions with more than one argument -----------------------
# PREDICT: before you run it, say in one sentence what this block should show.
rectangle_area <- function(length, width) {
  area <- length * width
  return(area)
}

rectangle_area(8, 5)

# WHY: The values are matched to arguments by position unless names are
# WHY: supplied.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
rectangle_area(width = 5, length = 8)


# ---- 3.3 Positional and named argument matching ----------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
power_value <- function(number, exponent) {
  number ^ exponent
}

power_value(2, 3)                       # positional matching
power_value(number = 2, exponent = 3)   # named matching
power_value(exponent = 3, number = 2)   # named order may vary
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 4. Return values and printing
# =====================================================================
# WHY: - If return() is omitted, R returns the value of the last evaluated
# WHY: expression.
# PREDICT: before you run it, say in one sentence what this block should show.
add_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

answer <- add_numbers(10, 5)
answer

# WHY: Compare with:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
display_sum <- function(a, b) {
  result <- a + b
  print(result)
}

stored_result <- display_sum(10, 5)
stored_result

# WHY: A function can also return a logical value:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
is_pass <- function(score) {
  score >= 50
}

is_pass(68)
is_pass(42)
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 5. Default arguments
# =====================================================================
# WHY: The default is used when the caller does not supply that argument.
# PREDICT: before you run it, say in one sentence what this block should show.
calculate_discount <- function(price, rate = 0.10) {
  price * rate
}

calculate_discount(5000)
calculate_discount(5000, rate = 0.15)


# ---- 5.1 A function with a default and a named argument --------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
calculate_final_score <- function(
  coursework,
  examination,
  coursework_weight = 0.30,
  examination_weight = 0.70
) {
  coursework * coursework_weight +
    examination * examination_weight
}

calculate_final_score(24, 68)
calculate_final_score(
  coursework = 24,
  examination = 68,
  coursework_weight = 0.40,
  examination_weight = 0.60
)


# =====================================================================
# SECTION: 6. Input validation and defensive programming
# =====================================================================
# WHY: For example, a score may be expected to be a single numeric value
# WHY: between 0 and 100.
# CHECK: run the block, then find the new object(s) in the Environment pane.
validate_score <- function(score) {
  if (!is.numeric(score)) {
    stop("Score must be numeric.")
  }

  if (length(score) != 1) {
    stop("Score must contain exactly one value.")
  }

  if (is.na(score)) {
    stop("Score must not be missing.")
  }

  if (score < 0 || score > 100) {
    stop("Score must be between 0 and 100.")
  }

  TRUE
}
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: This function uses stop() to halt execution when an input violates
# WHY: the stated rule.
# PREDICT: before you run it, say in one sentence what this block should show.
validate_score(75)
# validate_score(120)  # test separately; it should report an error


# ---- 6.1 A validated grading function --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
grade_score <- function(score) {
  validate_score(score)

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

grade_score(76)
grade_score(49)


# =====================================================================
# SECTION: 7. Local and global environments
# =====================================================================
# WHY: Function arguments and objects created inside the function are
# WHY: normally local to that call.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
course_name <- "DTS 211"  # global object

show_course <- function() {
  topic <- "Functions"
  paste(course_name, topic)
}

show_course()
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: The object topic is created inside the function and is not
# WHY: automatically available in the global environment.
# CHECK: run the block, then find the new object(s) in the Environment pane.
# topic
# This would normally produce an object-not-found error


# ---- 7.1 Local variables ---------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
calculate_mean <- function(values) {
  total <- sum(values)
  count <- length(values)
  mean_value <- total / count
  mean_value
}

calculate_mean(c(10, 20, 30))


# ---- 7.2 Local names can hide global names ---------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
threshold <- 50

check_result <- function(score) {
  threshold <- 60
  score >= threshold
}

check_result(55)
threshold
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 8. Lexical scoping: how R finds names
# =====================================================================
# WHY: In simple terms, when a function needs a name that is not defined
# WHY: locally, R searches the environment in which the function was
# WHY: created, then conti...
# PREDICT: before you run it, say in one sentence what this block should show.
minimum_score <- 50

passes <- function(score) {
  score >= minimum_score
}

passes(67)


# ---- 8.1 Demonstrating the enclosing environment ---------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
make_multiplier <- function(factor) {
  function(number) {
    number * factor
  }
}

double_value <- make_multiplier(2)
triple_value <- make_multiplier(3)

double_value(10)
triple_value(10)


# ---- 8.2 Avoid unnecessary global assignment -------------------------
# WHY: The <<- operator can assign to a name in an enclosing environment
# WHY: rather than creating a normal local binding.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
counter <- 0

increment_counter <- function() {
  counter <<- counter + 1
}

increment_counter()
counter
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Prefer returning a new value and assigning it explicitly:
# CHECK: run the block, then find the new object(s) in the Environment pane.
increment <- function(value) {
  value + 1
}

counter <- increment(counter)


# =====================================================================
# SECTION: 9. Functions and loops together
# =====================================================================

# ---- 9.1 A function that uses a loop ---------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
sum_with_loop <- function(values) {
  total <- 0

  for (value in values) {
    total <- total + value
  }

  total
}

sum_with_loop(c(4, 8, 2, 6))


# ---- 9.2 A function called repeatedly in a loop ----------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
square_number <- function(number) {
  number ^ 2
}

numbers <- 1:5
squares <- numeric(length(numbers))

for (i in seq_along(numbers)) {
  squares[i] <- square_number(numbers[i])
}

squares
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 9.3 Prefer vectorisation when it is clearer ---------------------
# WHY: The previous example can be written more simply:
# PREDICT: before you run it, say in one sentence what this block should show.
numbers <- 1:5
squares_vectorised <- numbers ^ 2
squares_vectorised


# =====================================================================
# SECTION: 10. A worked example: reusable student assessment functions
# =====================================================================
# WHY: The following dataset and grading boundaries are synthetic teaching
# WHY: examples, not an official institutional grading policy.
# CHECK: run the block, then find the new object(s) in the Environment pane.
students <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005"),
  coursework = c(22, 18, 15, 25, 12),
  examination = c(58, 62, 49, 61, 40)
)


# ---- Step 1: Define a reusable total-score function ------------------
# CHECK: after running, type the object name in the Console. What does R show?
calculate_total <- function(coursework, examination) {
  if (!is.numeric(coursework) || !is.numeric(examination)) {
    stop("Both inputs must be numeric.")
  }

  coursework + examination
}
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Step 2: Define a grade function ---------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
grade_total <- function(total) {
  if (length(total) != 1 || is.na(total)) {
    stop("Supply one non-missing total score.")
  }

  if (total >= 70) {
    "A"
  } else if (total >= 60) {
    "B"
  } else if (total >= 50) {
    "C"
  } else {
    "F"
  }
}


# ---- Step 3: Apply the functions to each student ---------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students$total <- calculate_total(
  students$coursework,
  students$examination
)

students$grade <- character(nrow(students))

for (i in seq_len(nrow(students))) {
  students$grade[i] <- grade_total(students$total[i])
}

students


# ---- Step 4: Compare with a vectorised grade solution ----------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
grade_vectorised <- ifelse(
  students$total >= 70, "A",
  ifelse(
    students$total >= 60, "B",
    ifelse(students$total >= 50, "C", "F")
  )
)

identical(students$grade, grade_vectorised)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 11. Testing functions
# =====================================================================
# WHY: - a missing value where relevant; - an input of the wrong type; - a
# WHY: vector input if the function is intended to accept vectors.
# PREDICT: before you run it, say in one sentence what this block should show.
grade_total(70)
grade_total(69)
grade_total(50)
grade_total(49)

# WHY: For invalid cases, test one at a time so that the error is easy to
# WHY: identify:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# grade_total(NA)
# grade_total(c(50, 60))
# grade_total("seventy")


# ---- 11.1 Simple consistency checks ----------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
stopifnot(grade_total(70) == "A")
stopifnot(grade_total(60) == "B")
stopifnot(grade_total(50) == "C")
stopifnot(grade_total(49) == "F")
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Title: Build a Reusable Data-Processing Toolkit
# Choose one context: student assessment, agricultural measurements,
# library transactions, or campus service records. Create a synthetic
# dataset with at least 15 observations.
# Write an R script containing at least four user-defined functions:
# TASK 1: A function to validate one input or a vector of inputs.
# YOUR CODE:


# TASK 2: A function to calculate a derived value.
# YOUR CODE:


# TASK 3: A function to classify or categorise an observation.
# YOUR CODE:


# TASK 4: A function that summarises or reports a result.
# YOUR CODE:


# Your script must also:
#   - use arguments and at least one default argument;
#   - demonstrate local variables and explain one example of lexical
#   - scoping;
#   - use a loop to apply at least one function repeatedly;
#   - include a vectorised alternative for one operation where
#   - appropriate;
#   - test ordinary, boundary, and invalid inputs;
#   - avoid unnecessary global assignment and avoid <<- unless justified.
# Submission:
#   - One executable .R script.
#   - A sample output.
#   - A 600–800 word explanation of function design, inputs, outputs,
#   - scope, testing, and the choice between loops and vectorisation.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Q1. What are the four main components of a user-defined function?
# A: 

# Q2. What is the difference between an argument and a returned value?
# A: 

# Q3. Why is a function's local environment useful?
# A: 

# Q4. What does lexical scoping mean in practical terms?
# A: 

# Q5. Why should a function be tested with boundary and invalid inputs?
# A: 

# Q6. When might a loop be clearer than a vectorised expression?
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_10_DTS211_student.R in your project and commit your notes.
