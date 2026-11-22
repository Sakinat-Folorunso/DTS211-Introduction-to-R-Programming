# DTS 211 — Week 11 R Code Collection
# Extracted from: DTS211_Week11_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
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


# ====================================================================
# Code example 2
# ====================================================================
student_scores <- c(45, 67, 82)
average_score <- mean(student_scores)

calculate_average <- function(values) {
  mean(values)
}


# ====================================================================
# Code example 3
# ====================================================================
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


# ====================================================================
# Code example 4
# ====================================================================
# Harder to scan
total<-coursework+examination

# Easier to scan
total <- coursework + examination


# ====================================================================
# Code example 5
# ====================================================================
# Apply the approved 30:70 coursework-to-examination weighting.
final_score <- coursework * 0.30 + examination * 0.70


# ====================================================================
# Code example 6
# ====================================================================
# Add a and b
total <- a + b


# ====================================================================
# Code example 7
# ====================================================================
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


# ====================================================================
# Code example 8
# ====================================================================
# Avoid machine-specific paths such as:
# "C:/Users/Name/Desktop/project/data.csv"

# Prefer a project-relative path:
data_file <- "data/student_scores.csv"


# ====================================================================
# Code example 9
# ====================================================================
calculate_total <- function(coursework, examination) {
  coursework + examination
}

student_a_total <- calculate_total(18, 55)
student_b_total <- calculate_total(20, 60)


# ====================================================================
# Code example 10
# ====================================================================
# Missing closing parenthesis:
# mean(c(10, 20, 30)

# Correct:
mean(c(10, 20, 30))


# ====================================================================
# Code example 11
# ====================================================================
# This attempts to use an object that does not exist:
# total_score + bonus


# ====================================================================
# Code example 12
# ====================================================================
# Example of a warning caused by non-multiple vector lengths:
c(1, 2, 3, 4, 5) + c(10, 20)


# ====================================================================
# Code example 13
# ====================================================================
# Intended: pass mark is 50 or above
score <- 50

# Incorrect rule:
passed <- score > 50

# Correct rule:
passed <- score >= 50


# ====================================================================
# Code example 14
# ====================================================================
scores <- c(45, 60, 72, 38)

class(scores)
typeof(scores)
length(scores)
str(scores)
summary(scores)


# ====================================================================
# Code example 15
# ====================================================================
student_data <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003"),
  score = c(55, 72, 48)
)

str(student_data)
names(student_data)
dim(student_data)
head(student_data)
summary(student_data)


# ====================================================================
# Code example 16
# ====================================================================
# Example:
# mean_value <- mean(score_values)


# ====================================================================
# Code example 17
# ====================================================================
# After an error in the Console:
traceback()


# ====================================================================
# Code example 18
# ====================================================================
calculate_ratio <- function(numerator, denominator) {
  browser()
  result <- numerator / denominator
  result
}

calculate_ratio(10, 2)


# ====================================================================
# Code example 19
# ====================================================================
calculate_mean <- function(values) {
  total <- sum(values)
  count <- length(values)
  total / count
}

debug(calculate_mean)
calculate_mean(c(10, 20, 30))

undebug(calculate_mean)


# ====================================================================
# Code example 20
# ====================================================================
scores <- c(45, 60, 72, 38)

stopifnot(is.numeric(scores))
stopifnot(length(scores) == 4)
stopifnot(all(scores >= 0 & scores <= 100))


# ====================================================================
# Code example 21
# ====================================================================
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


# ====================================================================
# Code example 22
# ====================================================================
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


# ====================================================================
# Code example 23
# ====================================================================
numbers <- seq_len(10000)

squares_loop <- numeric(length(numbers))

for (i in seq_along(numbers)) {
  squares_loop[i] <- numbers[i] ^ 2
}

squares_vectorised <- numbers ^ 2

all.equal(squares_loop, squares_vectorised)


# ====================================================================
# Code example 24
# ====================================================================
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


# ====================================================================
# Code example 25
# ====================================================================
numbers <- seq_len(100000)

time_vectorised <- replicate(
  5,
  system.time(numbers ^ 2)[["elapsed"]]
)

time_vectorised
median(time_vectorised)


# ====================================================================
# Code example 26
# ====================================================================
# Basic example
Rprof("week11_profile.out")

# Run the computation to be profiled
numbers <- seq_len(1000000)
result <- sqrt(numbers)
result <- log1p(result)

Rprof(NULL)

profile_summary <- summaryRprof("week11_profile.out")
profile_summary


# ====================================================================
# Code example 27
# ====================================================================
file.remove("week11_profile.out")


# ====================================================================
# Code example 28
# ====================================================================
coursework <- c(18, 20, 15, 22)
examination <- c(55, 60, 48, 63)

# Deliberate logical defect: uses the wrong weighting and threshold.
total <- coursework + examination
passed <- total > 50

# Deliberate naming and output issue: result is not clearly labelled.
print(passed)


# ====================================================================
# Code example 29
# ====================================================================
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


# ====================================================================
# Code example 30
# ====================================================================
# Syntax problem
# mean(c(2, 4, 6)

# Missing object
# average_score <- total_score / number_of_students

# Logical problem
score <- 50
passed <- score > 50

# Type problem
marks <- c(40, 55, "absent")
mean(marks)
