# DTS 211 — Week 9 R Code Collection
# Extracted from: DTS211_Week9_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
score <- 72

score >= 50
score == 72
score != 0


# ====================================================================
# Code example 2
# ====================================================================
x <- c(2, 8, 12, 18)

x > 5 & x < 15
# TRUE, TRUE, TRUE? Evaluate element by element:
# FALSE, TRUE, TRUE, FALSE

x > 5 && x < 15
# Uses only the first element of each logical vector.


# ====================================================================
# Code example 3
# ====================================================================
age <- 21
has_id <- TRUE

age >= 18 & has_id
age < 18 | !has_id


# ====================================================================
# Code example 4
# ====================================================================
(score >= 50 & attendance >= 75) | approved_exception


# ====================================================================
# Code example 5
# ====================================================================
marks <- c(45, 67, NA, 82)

marks >= 50
is.na(marks)


# ====================================================================
# Code example 6
# ====================================================================
!is.na(marks) & marks >= 50


# ====================================================================
# Code example 7
# ====================================================================
score <- 68

if (score >= 50) {
  print("Pass")
}


# ====================================================================
# Code example 8
# ====================================================================
scores <- c(45, 60, 72)

# Do not use a vector condition directly in if:
# if (scores >= 50) print("Pass")


# ====================================================================
# Code example 9
# ====================================================================
score <- 42

if (score >= 50) {
  print("Pass")
} else {
  print("Not yet passed")
}


# ====================================================================
# Code example 10
# ====================================================================
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


# ====================================================================
# Code example 11
# ====================================================================
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


# ====================================================================
# Code example 12
# ====================================================================
eligible <- score >= 50 & attendance >= 75

if (eligible) {
  result <- "Pass"
} else {
  result <- "Review required"
}


# ====================================================================
# Code example 13
# ====================================================================
scores <- c(42, 55, 71, 38, 90)

results <- ifelse(scores >= 50, "Pass", "Fail")
results


# ====================================================================
# Code example 14
# ====================================================================
temperature <- c(24, 31, 29, 36, 27)

heat_status <- ifelse(
  temperature >= 30,
  "High",
  "Moderate"
)

heat_status


# ====================================================================
# Code example 15
# ====================================================================
scores <- c(42, 55, NA, 71)

ifelse(scores >= 50, "Pass", "Fail")


# ====================================================================
# Code example 16
# ====================================================================
result <- ifelse(
  is.na(scores),
  "Not recorded",
  ifelse(scores >= 50, "Pass", "Fail")
)

result


# ====================================================================
# Code example 17
# ====================================================================
x <- c(1, 2, 3, 4)

ifelse(x %% 2 == 0, "even", 0)


# ====================================================================
# Code example 18
# ====================================================================
# install.packages("dplyr")  # run once if needed
library(dplyr)

if_else(x %% 2 == 0, "even", "odd")


# ====================================================================
# Code example 19
# ====================================================================
for (i in 1:5) {
  print(i)
}


# ====================================================================
# Code example 20
# ====================================================================
student_names <- c("Ada", "Bola", "Chika")

for (student in student_names) {
  print(paste("Welcome", student))
}


# ====================================================================
# Code example 21
# ====================================================================
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


# ====================================================================
# Code example 22
# ====================================================================
counter <- 1

while (counter <= 5) {
  print(counter)
  counter <- counter + 1
}


# ====================================================================
# Code example 23
# ====================================================================
counter <- 1

repeat {
  print(counter)
  counter <- counter + 1

  if (counter > 5) {
    break
  }
}


# ====================================================================
# Code example 24
# ====================================================================
for (i in 1:10) {
  if (i == 7) {
    break
  }
  print(i)
}


# ====================================================================
# Code example 25
# ====================================================================
for (i in 1:10) {
  if (i %% 2 == 0) {
    next
  }
  print(i)
}


# ====================================================================
# Code example 26
# ====================================================================
scores <- c(45, 60, 72, 38)

scores + 5
scores * 1.1
scores >= 50


# ====================================================================
# Code example 27
# ====================================================================
quiz <- c(12, 15, 18, 10)
exam <- c(55, 62, 70, 48)

total <- quiz + exam
average <- total / 2

total
average


# ====================================================================
# Code example 28
# ====================================================================
scores <- c(40, 50, 60, 70)
bonus <- c(2, 5)

scores + bonus


# ====================================================================
# Code example 29
# ====================================================================
c(1, 2, 3, 4, 5) + c(10, 20)


# ====================================================================
# Code example 30
# ====================================================================
x <- c(4, 8, 2, 10, 6)

sum(x)
mean(x)
min(x)
max(x)
sqrt(x)
round(x / 3, 2)


# ====================================================================
# Code example 31
# ====================================================================
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


# ====================================================================
# Code example 32
# ====================================================================
students <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005", "DTS006"),
  coursework = c(18, 15, 12, 20, 9, 17),
  examination = c(55, 48, 61, 42, 35, 63),
  attendance = c(85, 90, 72, 78, 60, 95)
)

students$total <- students$coursework + students$examination
students


# ====================================================================
# Code example 33
# ====================================================================
students$total <- students$coursework + students$examination


# ====================================================================
# Code example 34
# ====================================================================
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


# ====================================================================
# Code example 35
# ====================================================================
students$eligible <- students$total >= 50 & students$attendance >= 75

students[, c("student_id", "total", "attendance", "eligible")]


# ====================================================================
# Code example 36
# ====================================================================
students$attendance[3] <- NA

students$attendance_status <- ifelse(
  is.na(students$attendance),
  "Attendance not recorded",
  ifelse(students$attendance >= 75, "Meets threshold", "Below threshold")
)

students[, c("student_id", "attendance", "attendance_status")]


# ====================================================================
# Code example 37
# ====================================================================
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


# ====================================================================
# Code example 38
# ====================================================================
test_scores <- c(49, 50, 51)

ifelse(test_scores >= 50, "Pass", "Fail")


# ====================================================================
# Code example 39
# ====================================================================
scores <- c(35, 49, 50, 67, 82, NA)


# ====================================================================
# Code example 40
# ====================================================================
continuous_assessment <- c(14, 18, 12, 20, 16)
examination <- c(51, 62, 49, 58, 67)
