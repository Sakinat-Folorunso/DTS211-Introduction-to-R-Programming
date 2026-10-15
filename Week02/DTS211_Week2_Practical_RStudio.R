# ============================================================
# DTS 211: INTRODUCTION TO R PROGRAMMING
# WEEK 2 PRACTICAL: EVALUATION IN R AND R OBJECTS
# Environment: RStudio Desktop or Posit Cloud
# ============================================================

# Learning goals:
# 1. Evaluate expressions.
# 2. Assign and reassign values to objects.
# 3. Create numeric, character and logical objects.
# 4. Perform computations using stored values.
# 5. Inspect objects with class(), typeof(), str(), attributes().
#
# TIP: Predict -> Run -> Inspect -> Explain.
# Run this script section by section.

# ------------------------------------------------------------
# SECTION 1: EVALUATING EXPRESSIONS
# ------------------------------------------------------------

5 + 3
10 * 4
20 / 5
2^3

# Compare order of operations.
2 + 3 * 4
(2 + 3) * 4

# Remainder and integer division.
7 %% 3
7 %/% 3


# ------------------------------------------------------------
# SECTION 2: ASSIGNMENT AND OBJECTS
# ------------------------------------------------------------

test1 <- 68
test2 <- 74
assignment <- 82

test1
test2
assignment

total <- test1 + test2 + assignment
average <- total / 3

total
average


# ------------------------------------------------------------
# SECTION 3: CALCULATION VERSUS REASSIGNMENT
# ------------------------------------------------------------

score <- 75

# This displays a calculation but does not change score.
score + 5
score

# This assigns the calculated result back to score.
score <- score + 5
score


# ------------------------------------------------------------
# SECTION 4: REASSIGNMENT AND CASE-SENSITIVE NAMES
# ------------------------------------------------------------

score <- 75
score <- 82
score

student_score <- 75
Student_score <- 80

student_score
Student_score

# R is case-sensitive: student_score and Student_score
# are two different object names.


# ------------------------------------------------------------
# SECTION 5: NUMERIC, CHARACTER AND LOGICAL OBJECTS
# ------------------------------------------------------------

student_name <- "Amina"
age <- 21
registered <- TRUE

student_name
age
registered


# ------------------------------------------------------------
# SECTION 6: INSPECT OBJECTS
# ------------------------------------------------------------

# Character object
class(student_name)
typeof(student_name)
str(student_name)

# Numeric object
class(age)
typeof(age)
str(age)

# Logical object
class(registered)
typeof(registered)
str(registered)


# ------------------------------------------------------------
# SECTION 7: COMPARE VALUES THAT LOOK SIMILAR
# ------------------------------------------------------------

a <- 25
b <- "25"
c <- 25L
d <- 25.0

class(a)
typeof(a)
str(a)

class(b)
typeof(b)
str(b)

class(c)
typeof(c)
str(c)

class(d)
typeof(d)
str(d)

# Investigate: Why is b different from a?
# What does the L suffix indicate in c?


# ------------------------------------------------------------
# SECTION 8: LOGICAL EVALUATION
# ------------------------------------------------------------

score <- 72
passed <- score >= 50

passed
class(passed)
typeof(passed)
str(passed)

# Change the score and evaluate again.
score <- 42
passed <- score >= 50
passed


# ------------------------------------------------------------
# SECTION 9: ATTRIBUTES
# ------------------------------------------------------------

score <- 75

# Inspect existing attributes.
attributes(score)

# Attach a descriptive attribute.
attr(score, "description") <- "A student's assessment score"

# Inspect the attribute and the object.
attributes(score)
attr(score, "description")
str(score)

# The attribute adds descriptive information; it does not
# change the numeric value stored in score.


# ------------------------------------------------------------
# SECTION 10: STUDENT RECORD MINI-PROBLEM
# ------------------------------------------------------------

student_name <- "Amina"
age <- 21
test1 <- 68
test2 <- 74
assignment <- 82
registered <- TRUE

total <- test1 + test2 + assignment
average <- total / 3
passed <- average >= 50

student_name
age
registered
total
average
passed

# Inspect selected objects.
class(student_name)
typeof(student_name)
str(student_name)

class(average)
typeof(average)
str(average)

class(registered)
typeof(registered)
str(registered)

class(passed)
typeof(passed)
str(passed)


# ------------------------------------------------------------
# SECTION 11: CHANGE AN INPUT AND RECALCULATE
# ------------------------------------------------------------

test2 <- 90

total <- test1 + test2 + assignment
average <- total / 3
passed <- average >= 50

total
average
passed

# Discussion:
# Which results changed?
# Why do we recalculate total, average and passed after
# changing test2?


# ------------------------------------------------------------
# SECTION 12: INDEPENDENT CHALLENGE
# ------------------------------------------------------------

# Complete this challenge in your own script.
#
# 1. Create a character object for a student's name.
# 2. Create a numeric object for age.
# 3. Create three numeric assessment scores.
# 4. Create a logical registration-status object.
# 5. Calculate the total and average.
# 6. Create a logical pass result (average >= 50).
# 7. Inspect selected objects with class(), typeof(), str().
# 8. Change one score and update the calculations.
# 9. Attach a descriptive attribute to the average object.
# 10. Add comments explaining your work.


# ------------------------------------------------------------
# EXIT TICKET
# ------------------------------------------------------------

score <- 70
new_score <- score + 10

new_score
score

# Explain why new_score and score display different values.
