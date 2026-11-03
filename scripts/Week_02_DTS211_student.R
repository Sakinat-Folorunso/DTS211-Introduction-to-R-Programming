# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 2 of 12 (student script)
# Evaluation in R and R Objects
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain evaluation in R.
#  2. Distinguish an expression, its evaluation and its resulting value.
#  3. Explain and use the assignment operator <-.
#  4. Define an R object at an introductory level.
#  5. Create, name and reassign objects.
#  6. Apply naming conventions and recognise case sensitivity.
#  7. Create numeric, character and logical objects.
#  8. Distinguish values that look similar but have different types.
#  9. Explain the difference between class and underlying storage type.
#  10. Inspect objects using class(), typeof() and str().
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
# SECTION: 2. Opening problem: storing student assessment results
# =====================================================================
# WHY: The first step is to represent the information in R:
# CHECK: after running, type the object name in the Console. What does R show?
test1 <- 68
test2 <- 74
assignment <- 82

# WHY: We can ask R to display each value:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
test1
test2
assignment

# WHY: We can also use the stored values in a calculation:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
total <- test1 + test2 + assignment
average <- total / 3

total
average
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 3. Evaluation in R
# =====================================================================

# ---- 3.1 What is an expression? --------------------------------------
# WHY: An expression is a valid piece of R code that can be evaluated to
# WHY: produce a result. Examples:
# PREDICT: before you run it, say in one sentence what this block should show.
5 + 3
10 * 4
20 / 5
2^3


# ---- 3.2 Expression, evaluation and result ---------------------------
# WHY: Consider:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
5 + 3


# ---- 3.3 Predicting results ------------------------------------------
# WHY: Predict before running:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
12 + 8
15 - 6
7 * 3
18 / 2
3^2
(4 + 2) * 3
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 3.4 Arithmetic operators ----------------------------------------
# WHY: | %% | Remainder | 7 %% 3 | 1 | | %/% | Integer division | 7 %/% 3
# WHY: | 2 | R can calculate the remainder and integer quotient:
# PREDICT: before you run it, say in one sentence what this block should show.
7 %% 3
7 %/% 3


# ---- 3.5 Order of operations -----------------------------------------
# WHY: Multiplication and division are evaluated before addition and
# WHY: subtraction unless parentheses specify another order.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
2 + 3 * 4
(2 + 3) * 4


# ---- 3.6 Expressions using existing values ---------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
test1 <- 68
test2 <- 74

test1 + test2
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 4. Assignment and R objects
# =====================================================================

# ---- 4.1 What is assignment? -----------------------------------------
# WHY: In this course, the standard assignment operator is <-.
# CHECK: run the block, then find the new object(s) in the Environment pane.
score <- 75

# WHY: “Assign the value 75 to the object named score.” The arrow points
# WHY: towards the name receiving the value.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score


# ---- 4.2 What is an R object? ----------------------------------------
# WHY: At this introductory level, an R object is an entity that stores or
# WHY: represents information which R can inspect, evaluate, use in
# WHY: computations or mo...
# CHECK: run the block, then find the new object(s) in the Environment pane.
age <- 21
student_name <- "Amina"
registered <- TRUE
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.3 Assignment versus displaying a calculation ------------------
# WHY: Run:
# PREDICT: before you run it, say in one sentence what this block should show.
score <- 75
score + 5
score

# WHY: To update the object:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- score + 5
score


# ---- 4.4 Reassignment ------------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
score <- 75
score <- 82
score
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 5. Naming objects
# =====================================================================

# ---- 5.1 Why names matter --------------------------------------------
# WHY: A name such as average_score communicates more than a name such as
# WHY: x.
# CHECK: run the block, then find the new object(s) in the Environment pane.
average_score <- 74.67
student_name <- "Amina"
registration_status <- TRUE


# ---- 5.3 Case sensitivity --------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_score <- 75
Student_score <- 80

student_score
Student_score


# =====================================================================
# SECTION: 6. Numeric objects and numbers in R
# =====================================================================

# ---- 6.1 Numeric values ----------------------------------------------
# WHY: Ordinary numeric literals such as 25 are commonly stored as double-
# WHY: precision values.
# CHECK: run the block, then find the new object(s) in the Environment pane.
score <- 75
height <- 1.72
temperature <- 28.5
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 6.2 Integer and double values -----------------------------------
# WHY: R distinguishes integer and double storage.
# PREDICT: before you run it, say in one sentence what this block should show.
whole_number <- 25L
decimal_number <- 25.0

typeof(whole_number)
typeof(decimal_number)


# ---- 6.3 Basic computations with stored values -----------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
test1 <- 68
test2 <- 74
assignment <- 82

total <- test1 + test2 + assignment
average <- total / 3

total
average


# ---- 6.4 Numerical precision -----------------------------------------
# WHY: Computers represent many decimal numbers using finite binary
# WHY: precision. As a result, some decimal calculations may display small
# WHY: floating-point dif...
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
0.1 + 0.2
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Short precision investigation -----------------------------------
# WHY: Run:
# PREDICT: before you run it, say in one sentence what this block should show.
result <- 0.1 + 0.2
result
result == 0.3

# WHY: In later computational work, approximate comparisons can be made
# WHY: using a tolerance, for example:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
abs((0.1 + 0.2) - 0.3) < 1e-10


# =====================================================================
# SECTION: 7. Character objects
# =====================================================================

# ---- 7.1 What is character data? -------------------------------------
# WHY: Character objects store text, such as names, course codes,
# WHY: locations and labels.
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_name <- "Amina"
course_code <- "DTS 211"
department <- "Computer Science"
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 7.2 Why quotation marks matter ----------------------------------
# WHY: Compare:
# CHECK: after running, type the object name in the Console. What does R show?
student_name <- "Amina"

# WHY: with:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# EXPECTED ERROR: read the message R prints, then explain its cause.
try(student_name <- Amina)


# ---- 7.3 A number stored as text -------------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
number_a <- 25
number_b <- "25"
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: This matters because arithmetic operations require suitable
# WHY: numerical values.
# PREDICT: before you run it, say in one sentence what this block should show.
number_a + 5


# =====================================================================
# SECTION: 8. Logical objects and comparison expressions
# =====================================================================

# ---- 8.1 Logical values ----------------------------------------------
# WHY: - TRUE - FALSE
# CHECK: after running, type the object name in the Console. What does R show?
registered <- TRUE
submitted_assignment <- FALSE


# ---- 8.2 Comparison operators ----------------------------------------
# WHY: | == | Equal to | score == 50 | | != | Not equal to | score != 50 |
# WHY: Example:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
score <- 72
score >= 50
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: We can assign the logical result:
# PREDICT: before you run it, say in one sentence what this block should show.
passed <- score >= 50
passed


# ---- 8.3 Updating the condition --------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- 42
passed <- score >= 50
passed


# =====================================================================
# SECTION: 9. Inspecting objects: class(), typeof() and str()
# =====================================================================

# ---- 9.1 class(): how R classifies an object -------------------------
# WHY: The function class() reports the object's class.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
score <- 75
student_name <- "Amina"
registered <- TRUE

class(score)
class(student_name)
class(registered)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 9.2 typeof(): underlying storage type ---------------------------
# WHY: The function typeof() reports the underlying storage type used by
# WHY: R.
# PREDICT: before you run it, say in one sentence what this block should show.
typeof(score)
typeof(student_name)
typeof(registered)


# ---- 9.3 str(): compact structure inspection -------------------------
# WHY: The function str() displays a compact description of an object's
# WHY: structure.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
str(score)
str(student_name)
str(registered)


# ---- 9.4A A direct comparison of class and storage type --------------
# WHY: Run the following commands and complete the table from the output:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
class(25)
typeof(25)

class(25L)
typeof(25L)

class("25")
typeof("25")

class(TRUE)
typeof(TRUE)

class(25.0)
typeof(25.0)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 9.5 Worked inspection example -----------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
a <- 25
b <- "25"
c <- TRUE
d <- 25L
e <- 25.0

class(a); typeof(a); str(a)
class(b); typeof(b); str(b)
class(c); typeof(c); str(c)
class(d); typeof(d); str(d)
class(e); typeof(e); str(e)


# =====================================================================
# SECTION: 10. Attributes: metadata attached to objects
# =====================================================================

# ---- 10.2 Inspecting attributes --------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- 75
attributes(score)


# ---- 10.3 Adding a descriptive attribute -----------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
attr(score, "description") <- "A student's assessment score"

attributes(score)
attr(score, "description")
str(score)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 10.4 attributes() and attr() ------------------------------------
# WHY: - attributes(x) inspects the collection of attributes attached to
# WHY: an object. - attr(x, "name") retrieves or assigns a particular
# WHY: attribute. Example:
# PREDICT: before you run it, say in one sentence what this block should show.
attr(score, "source") <- "Programming test"
attr(score, "description")
attr(score, "source")
attributes(score)


# =====================================================================
# SECTION: 11. Basic object structures: preparing for later weeks
# =====================================================================
# WHY: R objects differ in both their values and their structures. In Week
# WHY: 2, students work with simple individual objects. The next weeks
# WHY: extend this und...
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- 75
student_name <- "Amina"
registered <- TRUE

str(score)
str(student_name)
str(registered)


# =====================================================================
# SECTION: 12. Guided practical: constructing and investigating a student
# SECTION: record
# =====================================================================

# ---- Step 1 — Create the objects -------------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_name <- "Amina"
age <- 21
test1 <- 68
test2 <- 74
assignment <- 82
registered <- TRUE
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- Step 2 — Inspect the values -------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
student_name
age
test1
test2
assignment
registered


# ---- Step 3 — Calculate the total and average ------------------------
# WHY: $$ \bar{x}=\frac{x_1+x_2+x_3}{3} $$
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
total <- test1 + test2 + assignment
average <- total / 3

total
average


# ---- Step 4 — Evaluate the pass condition ----------------------------
# WHY: For this exercise, use 50 as the illustrative threshold.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
passed <- average >= 50
passed
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Step 5 — Inspect selected objects -------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
class(student_name)
typeof(student_name)
str(student_name)

class(age)
typeof(age)
str(age)

class(average)
typeof(average)
str(average)

class(registered)
typeof(registered)
str(registered)

class(passed)
typeof(passed)
str(passed)


# ---- Step 6 — Reassign one score -------------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
test2 <- 90

# WHY: Recalculate the dependent results:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
total <- test1 + test2 + assignment
average <- total / 3
passed <- average >= 50

total
average
passed
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 13. Activity: Object Detective
# =====================================================================
# WHY: Run:
# CHECK: after running, type the object name in the Console. What does R show?
a <- 25
b <- "25"
c <- TRUE
d <- 25L
e <- 25.0


# =====================================================================
# SECTION: 14. Common errors and debugging
# =====================================================================

# ---- Error 1 — Object not found --------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_score


# ---- Error 2 — Text without quotation marks --------------------------
# CHECK: after running, type the object name in the Console. What does R show?
# EXPECTED ERROR: read the message R prints, then explain its cause.
try(student_name <- Amina)
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: R interprets Amina as an object name, not as text. Correction:
# CHECK: run the block, then find the new object(s) in the Environment pane.
student_name <- "Amina"


# ---- Error 3 — Calculation does not update the object ----------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score <- 75
score + 5
score

# WHY: Correction when updating is intended:
# CHECK: run the block, then find the new object(s) in the Environment pane.
score <- score + 5
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Error 4 — Inconsistent capitalisation ---------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
student_score <- 75
Student_score


# ---- Error 5 — Confusing character and numeric values ----------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
number <- "25"
# EXPECTED ERROR: read the message R prints, then explain its cause.
try(number + 5)


# =====================================================================
# SECTION: 17. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the output before running:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
score <- 70
new_score <- score + 10

new_score
score

score <- 40
new_score
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Create a script that:
# TASK 1: Stores a student's name as character data.
# YOUR CODE:


# TASK 2: Stores age as a numeric value.
# YOUR CODE:


# TASK 3: Stores three assessment scores as numeric values.
# YOUR CODE:


# TASK 4: Stores registration status as a logical value.
# YOUR CODE:


# TASK 5: Calculates total and average score.
# YOUR CODE:


# TASK 6: Creates a logical object indicating whether the average is at
# TASK 6: least 50.
# YOUR CODE:


# TASK 7: Inspects the name, age, average, registration status and pass
# TASK 7: result using class(), typeof() and str().
# YOUR CODE:


# TASK 8: Changes one assessment score and updates the calculations.
# YOUR CODE:


# TASK 9: Attaches a descriptive attribute to the average object.
# YOUR CODE:


# TASK 10: Writes three sentences explaining evaluation, assignment and
# TASK 10: object inspection.
# YOUR CODE:


# Use meaningful object names and comments to explain your code.
# Title: Creating and Investigating R Objects
# Create an R script named My_Week2_Assignment.R.
# Your script must:
#   - create at least one numeric, one character and one logical object;
#   - demonstrate assignment and reassignment;
#   - evaluate at least five arithmetic expressions;
#   - use stored objects in at least three computations;
#   - inspect selected objects with class(), typeof() and str();
#   - use attributes() to inspect an object;
#   - attach at least one descriptive attribute;
#   - include comments explaining each major section;
#   - finish with short written answers to:
# TASK 1: What is evaluation in R?
# YOUR CODE:


# TASK 2: What is an R object?
# YOUR CODE:


# TASK 3: How are class(), typeof() and str() different?
# YOUR CODE:


# TASK 4: Why is assignment different from displaying a calculation?
# YOUR CODE:


# The lecturer should assess both the executable script and the student's
# ability to explain the output. A script that runs without the student
# understanding what it does should not receive full credit.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer without looking at the examples:
# Q1. What does it mean for R to evaluate an expression?
# A: 

# Q2. What does <- do?
# A: 

# Q3. What is the difference between calculating a result and assigning
# Q3. it?
# A: 

# Q4. Why are meaningful object names useful?
# A: 

# Q5. What is the difference between class() and typeof()?
# A: 

# Q6. What does str() help you inspect?
# A: 

# Q7. What is an attribute?
# A: 

# Q8. How can you investigate an object whose type you do not know?
# A: 

# Q9. Why does changing an input object not automatically update a
# Q9. previously assigned result?
# A: 

# Predict the output before running:
# Explain why new_score does not change automatically when score is
# reassigned.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_02_DTS211_student.R in your project and commit your notes.
