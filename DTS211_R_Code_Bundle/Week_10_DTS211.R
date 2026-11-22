# DTS 211 — Week 10 R Code Collection
# Extracted from: DTS211_Week10_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
calculate_total <- function(coursework, examination) {
  coursework + examination
}

calculate_total(18, 55)
calculate_total(14, 63)


# ====================================================================
# Code example 2
# ====================================================================
function_name <- function(argument1, argument2) {
  # statements that perform the task
  result <- argument1 + argument2
  return(result)
}


# ====================================================================
# Code example 3
# ====================================================================
greet_student <- function(name) {
  message <- paste("Welcome to DTS 211,", name)
  return(message)
}

greet_student("Ada")


# ====================================================================
# Code example 4
# ====================================================================
rectangle_area <- function(length, width) {
  area <- length * width
  return(area)
}

rectangle_area(8, 5)


# ====================================================================
# Code example 5
# ====================================================================
rectangle_area(width = 5, length = 8)


# ====================================================================
# Code example 6
# ====================================================================
power_value <- function(number, exponent) {
  number ^ exponent
}

power_value(2, 3)                       # positional matching
power_value(number = 2, exponent = 3)   # named matching
power_value(exponent = 3, number = 2)   # named order may vary


# ====================================================================
# Code example 7
# ====================================================================
add_numbers <- function(a, b) {
  result <- a + b
  return(result)
}

answer <- add_numbers(10, 5)
answer


# ====================================================================
# Code example 8
# ====================================================================
display_sum <- function(a, b) {
  result <- a + b
  print(result)
}

stored_result <- display_sum(10, 5)
stored_result


# ====================================================================
# Code example 9
# ====================================================================
is_pass <- function(score) {
  score >= 50
}

is_pass(68)
is_pass(42)


# ====================================================================
# Code example 10
# ====================================================================
calculate_discount <- function(price, rate = 0.10) {
  price * rate
}

calculate_discount(5000)
calculate_discount(5000, rate = 0.15)


# ====================================================================
# Code example 11
# ====================================================================
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


# ====================================================================
# Code example 12
# ====================================================================
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


# ====================================================================
# Code example 13
# ====================================================================
validate_score(75)
# validate_score(120)  # test separately; it should report an error


# ====================================================================
# Code example 14
# ====================================================================
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


# ====================================================================
# Code example 15
# ====================================================================
course_name <- "DTS 211"  # global object

show_course <- function() {
  topic <- "Functions"
  paste(course_name, topic)
}

show_course()


# ====================================================================
# Code example 16
# ====================================================================
# topic
# This would normally produce an object-not-found error


# ====================================================================
# Code example 17
# ====================================================================
calculate_mean <- function(values) {
  total <- sum(values)
  count <- length(values)
  mean_value <- total / count
  mean_value
}

calculate_mean(c(10, 20, 30))


# ====================================================================
# Code example 18
# ====================================================================
threshold <- 50

check_result <- function(score) {
  threshold <- 60
  score >= threshold
}

check_result(55)
threshold


# ====================================================================
# Code example 19
# ====================================================================
minimum_score <- 50

passes <- function(score) {
  score >= minimum_score
}

passes(67)


# ====================================================================
# Code example 20
# ====================================================================
make_multiplier <- function(factor) {
  function(number) {
    number * factor
  }
}

double_value <- make_multiplier(2)
triple_value <- make_multiplier(3)

double_value(10)
triple_value(10)


# ====================================================================
# Code example 21
# ====================================================================
counter <- 0

increment_counter <- function() {
  counter <<- counter + 1
}

increment_counter()
counter


# ====================================================================
# Code example 22
# ====================================================================
increment <- function(value) {
  value + 1
}

counter <- increment(counter)


# ====================================================================
# Code example 23
# ====================================================================
sum_with_loop <- function(values) {
  total <- 0

  for (value in values) {
    total <- total + value
  }

  total
}

sum_with_loop(c(4, 8, 2, 6))


# ====================================================================
# Code example 24
# ====================================================================
square_number <- function(number) {
  number ^ 2
}

numbers <- 1:5
squares <- numeric(length(numbers))

for (i in seq_along(numbers)) {
  squares[i] <- square_number(numbers[i])
}

squares


# ====================================================================
# Code example 25
# ====================================================================
numbers <- 1:5
squares_vectorised <- numbers ^ 2
squares_vectorised


# ====================================================================
# Code example 26
# ====================================================================
students <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005"),
  coursework = c(22, 18, 15, 25, 12),
  examination = c(58, 62, 49, 61, 40)
)


# ====================================================================
# Code example 27
# ====================================================================
calculate_total <- function(coursework, examination) {
  if (!is.numeric(coursework) || !is.numeric(examination)) {
    stop("Both inputs must be numeric.")
  }

  coursework + examination
}


# ====================================================================
# Code example 28
# ====================================================================
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


# ====================================================================
# Code example 29
# ====================================================================
students$total <- calculate_total(
  students$coursework,
  students$examination
)

students$grade <- character(nrow(students))

for (i in seq_len(nrow(students))) {
  students$grade[i] <- grade_total(students$total[i])
}

students


# ====================================================================
# Code example 30
# ====================================================================
grade_vectorised <- ifelse(
  students$total >= 70, "A",
  ifelse(
    students$total >= 60, "B",
    ifelse(students$total >= 50, "C", "F")
  )
)

identical(students$grade, grade_vectorised)


# ====================================================================
# Code example 31
# ====================================================================
grade_total(70)
grade_total(69)
grade_total(50)
grade_total(49)


# ====================================================================
# Code example 32
# ====================================================================
# grade_total(NA)
# grade_total(c(50, 60))
# grade_total("seventy")


# ====================================================================
# Code example 33
# ====================================================================
stopifnot(grade_total(70) == "A")
stopifnot(grade_total(60) == "B")
stopifnot(grade_total(50) == "C")
stopifnot(grade_total(49) == "F")
