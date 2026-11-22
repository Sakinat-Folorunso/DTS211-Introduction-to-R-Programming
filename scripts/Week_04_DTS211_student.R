# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 4 of 12 (student script)
# Lists, Factors, Missing Values and Data Frames
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. explain why lists are useful for heterogeneous data;
#  2. create, inspect, name and subset lists;
#  3. distinguish [, [[ and $ when extracting list components;
#  4. explain categorical variables and factor levels;
#  5. create and inspect factors, including ordered factors;
#  6. distinguish a missing value (NA) from NULL, NaN and an ordinary
#  6. value;
#  7. detect and count missing observations using is.na(), anyNA() and
#  7. related functions;
#  8. explain how missing values affect common calculations;
#  9. create and inspect data frames;
#  10. select rows and columns using indexing, $ and common helper
#  10. functions;
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
set.seed(42)                                   # makes random results repeatable
getwd()                                        # confirm the project folder


# =====================================================================
# SECTION: 2. From a collection of values to a realistic record
# =====================================================================
# WHY: A student's information may include a name, age, programme,
# WHY: enrolment status and scores.
# CHECK: after running, type the object name in the Console. What does R show?
student_name <- "Amina"
student_age <- 21
programme <- "Computer Science"
is_registered <- TRUE
scores <- c(68, 74, 81)


# ---- 2.1 Why not use one ordinary vector? ----------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_record <- c(
  student_name,
  student_age,
  programme,
  is_registered
)

student_record
typeof(student_record)


# =====================================================================
# SECTION: 3. Lists: grouping heterogeneous objects
# =====================================================================

# ---- 3.2 Creating a list ---------------------------------------------
# WHY: Use list():
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student <- list(
  name = "Amina",
  age = 21,
  programme = "Computer Science",
  registered = TRUE,
  scores = c(68, 74, 81)
)

student
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 3.3 Inspecting a list -------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
class(student)
typeof(student)
length(student)
names(student)
str(student)


# ---- 3.4 Accessing list components: [, [[ and $ ----------------------
# WHY: These three operators are related but behave differently.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student[1]
student[[1]]
student$name
student[["scores"]]


# ---- 3.5 Modifying a list --------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student$age <- 22
student$department <- "Computer Science"
student$scores[1] <- 70

student
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: To remove a component, assign NULL to it:
# PREDICT: before you run it, say in one sentence what this block should show.
student$department <- NULL
student


# ---- 3.6 Nested lists ------------------------------------------------
# WHY: A list can contain another list.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# =====================================================================
# SECTION: 4. Categorical data and factors
# =====================================================================

# ---- 4.2 Why not treat every category as ordinary text? --------------
# WHY: Character values can store category labels. However, statistical
# WHY: analysis often needs to know that a variable represents a defined
# WHY: set of categorie...
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
programme <- factor(
  c("Computer Science", "Statistics", "Computer Science",
    "Mathematics", "Statistics")
)

programme
levels(programme)
class(programme)
typeof(programme)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 4.3 Understanding levels ----------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
status <- factor(
  c("Registered", "Not registered", "Registered",
    "Registered", "Not registered")
)

levels(status)
table(status)

# WHY: 100p_k $$ In R:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
counts <- table(status)
proportions(counts)
100 * proportions(counts)


# ---- 4.4 Defining factor levels explicitly ---------------------------
# WHY: In a teaching or research dataset, it is often better to define the
# WHY: expected categories explicitly.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
grade <- factor(
  c("B", "A", "C", "B", "A"),
  levels = c("A", "B", "C", "D", "F")
)

levels(grade)
table(grade)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.5 Ordered factors ---------------------------------------------
# WHY: Some categories have a meaningful order.
# PREDICT: before you run it, say in one sentence what this block should show.
satisfaction <- factor(
  c("High", "Low", "Moderate", "High", "Moderate"),
  levels = c("Low", "Moderate", "High"),
  ordered = TRUE
)

satisfaction
is.ordered(satisfaction)


# ---- 4.6 Changing factor levels safely -------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
grade <- factor(
  c("A", "B", "C", "B"),
  levels = c("A", "B", "C")
)

levels(grade) <- c("Excellent", "Good", "Pass")
grade


# ---- 4.7 What is stored inside a factor? -----------------------------
# WHY: Its observations are represented internally by integer codes, and
# WHY: those codes are interpreted through the factor's levels.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
grade <- factor(
  c("B", "A", "C", "B"),
  levels = c("A", "B", "C", "D", "F")
)

as.integer(grade)
as.character(grade)
levels(grade)
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: If a genuinely new category is required, define it before assigning
# WHY: it:
# PREDICT: before you run it, say in one sentence what this block should show.
levels(grade) <- c(levels(grade), "Outstanding")
grade[1] <- "Outstanding"

grade
levels(grade)

# WHY: A common mistake is assigning a new category that is not among the
# WHY: factor's levels:
# CHECK: after running, type the object name in the Console. What does R show?
grade[1] <- "Outstanding"


# =====================================================================
# SECTION: 5. Missing values in R
# =====================================================================

# ---- 5.1 What does missing mean? -------------------------------------
# WHY: R uses NA to represent a missing or unavailable value.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
test_scores <- c(68, 74, NA, 81, 59)
test_scores
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 5.2 Detecting missing values ------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
is.na(test_scores)
anyNA(test_scores)
sum(is.na(test_scores))


# ---- 5.3 Missing values and arithmetic -------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
test_scores + 5
mean(test_scores)
sum(test_scores)

# WHY: For functions that support it, na.rm = TRUE removes missing
# WHY: observations from that calculation:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
mean(test_scores, na.rm = TRUE)
sum(test_scores, na.rm = TRUE)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 5.4 Calculating a mean with missing observations ----------------
# WHY: = 70.5 $$ R:
# PREDICT: before you run it, say in one sentence what this block should show.
mean(test_scores, na.rm = TRUE)


# ---- 5.6 Missing values in comparisons -------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
test_scores > 70

# WHY: To select observed scores above 70:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
test_scores[!is.na(test_scores) & test_scores > 70]
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 5.7 Distinguishing NA, NaN and NULL -----------------------------
# WHY: | NaN | Not a Number; undefined numerical result | 0 / 0 | | NULL |
# WHY: Null object / absence of a component | x <- NULL | Explore:
# PREDICT: before you run it, say in one sentence what this block should show.
is.na(NA)
is.nan(NaN)
is.null(NULL)

is.na(NaN)
is.nan(NA)


# ---- 5.8 Missing values in categorical variables ---------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
responses <- factor(
  c("Yes", "No", NA, "Yes", "No", NA),
  levels = c("Yes", "No")
)

is.na(responses)
table(responses)
table(responses, useNA = "ifany")


# =====================================================================
# SECTION: 6. Data frames: the central tabular structure
# =====================================================================

# ---- 6.2 Creating a data frame ---------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
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
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: If categorical analysis is required, create the factor explicitly.
# CHECK: run the block, then find the new object(s) in the Environment pane.
students$programme <- factor(students$programme)


# ---- 6.3 Inspecting a data frame -------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
class(students)
typeof(students)
dim(students)
nrow(students)
ncol(students)
names(students)
str(students)
summary(students)


# ---- 6.4 Selecting columns -------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students$student
students[["score"]]
students["score"]
students[, "score"]
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: To preserve a data frame when selecting one column:
# PREDICT: before you run it, say in one sentence what this block should show.
students[, "score", drop = FALSE]


# ---- 6.5.1 A closer look at data-frame indexing ----------------------
# WHY: The same data frame can return different object types depending on
# WHY: the indexing expression.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students[1, ]                 # first row: a data frame
students[, 1]                 # first column: usually a vector
students[, 1, drop = FALSE]   # first column: a data frame
students["score"]             # named column: a data frame
students[["score"]]           # named column: a vector
students$score                # named column: a vector


# ---- 6.5 Selecting rows and columns ----------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students[1, ]
students[2:4, ]
students[, c("student", "score")]
students[1:3, c("student", "programme", "score")]
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 6.6 Filtering rows using conditions -----------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
students[students$age >= 21, ]
students[students$programme == "Statistics", ]
students[!is.na(students$score), ]


# ---- 6.7 Adding and modifying columns --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students$passed <- students$score >= 50
students$age_next_year <- students$age + 1

students


# ---- 6.8 Removing a column -------------------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
students$age_next_year <- NULL
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 6.9 Adding a row ------------------------------------------------
# WHY: In Section 6.7 we added a derived column called passed, so a new
# WHY: row must supply passed too.
# PREDICT: before you run it, say in one sentence what this block should show.
new_student <- data.frame(
  student = "Fola",
  age = 22,
  programme = "Mathematics",
  registered = TRUE,
  score = 77,
  passed = TRUE        # 77 >= 50; students already has a 'passed' column
)

students <- rbind(students, new_student)
students

# WHY: What happens if a new row has one column fewer?
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
incomplete_student <- data.frame(
  student = "Gift",
  age = 20,
  programme = "Statistics",
  registered = TRUE,
  score = 60
)

# EXPECTED ERROR: numbers of columns of arguments do not match
try(rbind(students, incomplete_student))

# WHY: Convert the column explicitly first, then give the new row the same
# WHY: levels:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students$programme <- factor(students$programme)

another_student <- data.frame(
  student = "Gift",
  age = 20,
  programme = "Statistics",
  registered = TRUE,
  score = 60,
  passed = TRUE
)
another_student$programme <- factor(
  another_student$programme,
  levels = levels(students$programme)
)

students <- rbind(students, another_student)
students
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 6.10 Useful data-frame summary operations -----------------------
# PREDICT: before you run it, say in one sentence what this block should show.
mean(students$score, na.rm = TRUE)
table(students$programme)
table(students$registered)


# =====================================================================
# SECTION: 8. Worked investigation: a small departmental dataset
# =====================================================================
# WHY: We will construct and inspect a small dataset, identify categorical
# WHY: variables and investigate missing scores.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# ---- Questions for interpretation ------------------------------------
# WHY: How many students are full-time and part-time?
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
dim(department_data)
sum(is.na(department_data$score))
mean(department_data$score, na.rm = TRUE)
table(department_data$programme)
table(department_data$study_mode)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 8.1 A transparent missing-value report --------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
missing_by_column <- colSums(is.na(department_data))
missing_by_column

missing_percentage <- 100 * colMeans(is.na(department_data))
missing_percentage


# =====================================================================
# SECTION: 10. Guided practical: build a student information dataset
# =====================================================================

# ---- Task A: Create the data frame -----------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# ---- Task B: Convert categorical columns -----------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students$programme <- factor(students$programme)
students$study_mode <- factor(
  students$study_mode,
  levels = c("Full-time", "Part-time")
)

str(students)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Task C: Investigate missingness ---------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
is.na(students)
sum(is.na(students$score))
anyNA(students)
mean(students$score, na.rm = TRUE)


# ---- Task D: Select and filter ---------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students[, c("name", "programme", "score")]
students[students$age >= 22, ]
students[!is.na(students$score), ]


# ---- Task E: Create a list for one student ---------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
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
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Task F: Produce categorical summaries ---------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
table(students$programme)
table(students$study_mode)


# =====================================================================
# SECTION: 14. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the output before running:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
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


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# A department surveys eight students about study mode, programme and
# satisfaction. Some responses are missing.
# Create a data frame with at least these columns:
#   - student_id
#   - programme
#   - study_mode
#   - satisfaction
#   - weekly_study_hours
# Your dataset must include:
#   - at least three programmes;
#   - both full-time and part-time students;
#   - satisfaction categories ordered as Low, Moderate and High;
#   - at least two missing observations, in different columns;
#   - at least eight rows.
# Complete the following:
# TASK 1: Create the data frame.
# YOUR CODE:


# TASK 2: Convert programme and study mode to factors.
# YOUR CODE:


# TASK 3: Convert satisfaction to an ordered factor.
# YOUR CODE:


# TASK 4: Inspect the dataset with str() and summary().
# YOUR CODE:


# TASK 5: Count missing values by column.
# YOUR CODE:


# TASK 6: Calculate the mean weekly study hours using an explicit missing-
# TASK 6: value decision.
# YOUR CODE:


# TASK 7: Count students by programme and study mode.
# YOUR CODE:


# TASK 8: Select students whose satisfaction is High.
# YOUR CODE:


# TASK 9: Create a list for one selected student's profile.
# YOUR CODE:


# TASK 10: Write a short report explaining the structure, findings and
# TASK 10: limitations.
# YOUR CODE:


# Do not copy a classmate's dataset. Your variable values and
# interpretation should be your own.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer in your own words:
# Q1. Why is a list called a heterogeneous structure?
# A: 

# Q2. What is the difference between x[1] and x[[1]] for a list?
# A: 

# Q3. What is a factor level?
# A: 

# Q4. When should a factor be ordered?
# A: 

# Q5. Why is NA not the same as zero?
# A: 

# Q6. What is the difference between NA and NULL?
# A: 

# Q7. Why can mean(x) return NA?
# A: 

# Q8. What does na.rm = TRUE do?
# A: 

# Q9. What does each row and column represent in a data frame?
# A: 

# Q10. What is the difference between students["score"] and
# Q10. students[["score"]]?
# A: 

# Q11. Why should missing values be investigated before they are removed?
# A: 

# Q12. Which structure would you choose for a dataset containing student
# Q12. names, ages, programmes and scores? Explain.
# A: 

# Predict the output before running:
# Explain the structure and meaning of each result.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_04_DTS211_student.R in your project and commit your notes.
