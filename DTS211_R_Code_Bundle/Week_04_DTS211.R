# DTS 211 — Week 4 R Code Collection
# Extracted from: DTS211_Week4_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
student_name <- "Amina"
student_age <- 21
programme <- "Computer Science"
is_registered <- TRUE
scores <- c(68, 74, 81)


# ====================================================================
# Code example 2
# ====================================================================
student_record <- c(
  student_name,
  student_age,
  programme,
  is_registered
)

student_record
typeof(student_record)


# ====================================================================
# Code example 3
# ====================================================================
student <- list(
  name = "Amina",
  age = 21,
  programme = "Computer Science",
  registered = TRUE,
  scores = c(68, 74, 81)
)

student


# ====================================================================
# Code example 4
# ====================================================================
class(student)
typeof(student)
length(student)
names(student)
str(student)


# ====================================================================
# Code example 5
# ====================================================================
student[1]
student[[1]]
student$name
student[["scores"]]


# ====================================================================
# Code example 6
# ====================================================================
student$age <- 22
student$department <- "Computer Science"
student$scores[1] <- 70

student


# ====================================================================
# Code example 7
# ====================================================================
student$department <- NULL
student


# ====================================================================
# Code example 8
# ====================================================================
student_extended <- list(
  personal = list(
    name = "Amina",
    age = 21
  ),
  academic = list(
    programme = "Computer Science",
    scores = c(68, 74, 81)
  )
)

student_extended$personal$name
student_extended$academic$scores


# ====================================================================
# Code example 9
# ====================================================================
programme <- factor(
  c("Computer Science", "Statistics", "Computer Science",
    "Mathematics", "Statistics")
)

programme
levels(programme)
class(programme)
typeof(programme)


# ====================================================================
# Code example 10
# ====================================================================
status <- factor(
  c("Registered", "Not registered", "Registered",
    "Registered", "Not registered")
)

levels(status)
table(status)


# ====================================================================
# Code example 11
# ====================================================================
counts <- table(status)
proportions(counts)
100 * proportions(counts)


# ====================================================================
# Code example 12
# ====================================================================
grade <- factor(
  c("B", "A", "C", "B", "A"),
  levels = c("A", "B", "C", "D", "F")
)

levels(grade)
table(grade)


# ====================================================================
# Code example 13
# ====================================================================
satisfaction <- factor(
  c("High", "Low", "Moderate", "High", "Moderate"),
  levels = c("Low", "Moderate", "High"),
  ordered = TRUE
)

satisfaction
is.ordered(satisfaction)


# ====================================================================
# Code example 14
# ====================================================================
grade <- factor(
  c("A", "B", "C", "B"),
  levels = c("A", "B", "C")
)

levels(grade) <- c("Excellent", "Good", "Pass")
grade


# ====================================================================
# Code example 15
# ====================================================================
grade <- factor(
  c("B", "A", "C", "B"),
  levels = c("A", "B", "C", "D", "F")
)

as.integer(grade)
as.character(grade)
levels(grade)


# ====================================================================
# Code example 16
# ====================================================================
levels(grade) <- c(levels(grade), "Outstanding")
grade[1] <- "Outstanding"

grade
levels(grade)


# ====================================================================
# Code example 17
# ====================================================================
grade[1] <- "Outstanding"


# ====================================================================
# Code example 18
# ====================================================================
test_scores <- c(68, 74, NA, 81, 59)
test_scores


# ====================================================================
# Code example 19
# ====================================================================
is.na(test_scores)
anyNA(test_scores)
sum(is.na(test_scores))


# ====================================================================
# Code example 20
# ====================================================================
test_scores + 5
mean(test_scores)
sum(test_scores)


# ====================================================================
# Code example 21
# ====================================================================
mean(test_scores, na.rm = TRUE)
sum(test_scores, na.rm = TRUE)


# ====================================================================
# Code example 22
# ====================================================================
mean(test_scores, na.rm = TRUE)


# ====================================================================
# Code example 23
# ====================================================================
test_scores > 70


# ====================================================================
# Code example 24
# ====================================================================
test_scores[!is.na(test_scores) & test_scores > 70]


# ====================================================================
# Code example 25
# ====================================================================
is.na(NA)
is.nan(NaN)
is.null(NULL)

is.na(NaN)
is.nan(NA)


# ====================================================================
# Code example 26
# ====================================================================
responses <- factor(
  c("Yes", "No", NA, "Yes", "No", NA),
  levels = c("Yes", "No")
)

is.na(responses)
table(responses)
table(responses, useNA = "ifany")


# ====================================================================
# Code example 27
# ====================================================================
students <- data.frame(
  student = c("Amina", "Bola", "Chidi", "Dayo", "Efe"),
  age = c(21, 22, 20, 23, 21),
  programme = c(
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics"
  ),
  registered = c(TRUE, TRUE, FALSE, TRUE, TRUE),
  score = c(68, 74, 55, 81, NA)
)

students


# ====================================================================
# Code example 28
# ====================================================================
students$programme <- factor(students$programme)


# ====================================================================
# Code example 29
# ====================================================================
class(students)
typeof(students)
dim(students)
nrow(students)
ncol(students)
names(students)
str(students)
summary(students)


# ====================================================================
# Code example 30
# ====================================================================
students$student
students[["score"]]
students["score"]
students[, "score"]


# ====================================================================
# Code example 31
# ====================================================================
students[, "score", drop = FALSE]


# ====================================================================
# Code example 32
# ====================================================================
students[1, ]                 # first row: a data frame
students[, 1]                 # first column: usually a vector
students[, 1, drop = FALSE]   # first column: a data frame
students["score"]             # named column: a data frame
students[["score"]]           # named column: a vector
students$score                # named column: a vector


# ====================================================================
# Code example 33
# ====================================================================
students[1, ]
students[2:4, ]
students[, c("student", "score")]
students[1:3, c("student", "programme", "score")]


# ====================================================================
# Code example 34
# ====================================================================
students[students$age >= 21, ]
students[students$programme == "Statistics", ]
students[!is.na(students$score), ]


# ====================================================================
# Code example 35
# ====================================================================
students$passed <- students$score >= 50
students$age_next_year <- students$age + 1

students


# ====================================================================
# Code example 36
# ====================================================================
students$age_next_year <- NULL


# ====================================================================
# Code example 37
# ====================================================================
new_student <- data.frame(
  student = "Fola",
  age = 22,
  programme = "Mathematics",
  registered = TRUE,
  score = 77
)

students <- rbind(students, new_student)
students


# ====================================================================
# Code example 38
# ====================================================================
# Suppose students$programme is already a factor.
new_student$programme <- factor(
  new_student$programme,
  levels = levels(students$programme)
)

students <- rbind(students, new_student)


# ====================================================================
# Code example 39
# ====================================================================
mean(students$score, na.rm = TRUE)
table(students$programme)
table(students$registered)


# ====================================================================
# Code example 40
# ====================================================================
department_data <- data.frame(
  student = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola"),
  age = c(21, 22, 20, 23, 21, 22),
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

department_data$programme <- factor(department_data$programme)
department_data$study_mode <- factor(
  department_data$study_mode,
  levels = c("Full-time", "Part-time")
)

str(department_data)
summary(department_data)


# ====================================================================
# Code example 41
# ====================================================================
dim(department_data)
sum(is.na(department_data$score))
mean(department_data$score, na.rm = TRUE)
table(department_data$programme)
table(department_data$study_mode)


# ====================================================================
# Code example 42
# ====================================================================
missing_by_column <- colSums(is.na(department_data))
missing_by_column

missing_percentage <- 100 * colMeans(is.na(department_data))
missing_percentage


# ====================================================================
# Code example 43
# ====================================================================
students <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005", "DTS006"),
  name = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola"),
  age = c(21, 22, 20, 23, 21, 22),
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

students


# ====================================================================
# Code example 44
# ====================================================================
students$programme <- factor(students$programme)
students$study_mode <- factor(
  students$study_mode,
  levels = c("Full-time", "Part-time")
)

str(students)


# ====================================================================
# Code example 45
# ====================================================================
is.na(students)
sum(is.na(students$score))
anyNA(students)
mean(students$score, na.rm = TRUE)


# ====================================================================
# Code example 46
# ====================================================================
students[, c("name", "programme", "score")]
students[students$age >= 22, ]
students[!is.na(students$score), ]


# ====================================================================
# Code example 47
# ====================================================================
student_profile <- list(
  identity = list(
    id = "DTS001",
    name = "Amina"
  ),
  academic = list(
    programme = "Computer Science",
    scores = c(68, 74, 81)
  ),
  status = list(
    registered = TRUE,
    study_mode = "Full-time"
  )
)

str(student_profile)
student_profile$academic$scores


# ====================================================================
# Code example 48
# ====================================================================
table(students$programme)
table(students$study_mode)


# ====================================================================
# Code example 49
# ====================================================================
x <- list(name = "Amina", age = 21, scores = c(68, 74, 81))

x[1]
x[[1]]
x$name
length(x)

g <- factor(
  c("Low", "High", "Moderate", "Low"),
  levels = c("Low", "Moderate", "High"),
  ordered = TRUE
)

levels(g)
table(g)

scores <- c(60, 70, NA, 90)
is.na(scores)
mean(scores)
mean(scores, na.rm = TRUE)

df <- data.frame(
  name = c("Amina", "Bola", "Chidi"),
  score = c(68, NA, 81)
)

df["score"]
df[["score"]]
df[!is.na(df$score), ]
