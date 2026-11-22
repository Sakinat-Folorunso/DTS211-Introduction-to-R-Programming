# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 3 of 12 (student script)
# Vectors, Matrices and Arrays
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. distinguish vectors, matrices and arrays;
#  2. create numeric, integer, character and logical vectors;
#  3. generate sequences and repeated patterns;
#  4. explain atomic-vector homogeneity and type coercion;
#  5. use positional, negative, logical and named indexing;
#  6. modify and extend vectors;
#  7. explain vectorised computation and recycling;
#  8. construct matrices and arrays and interpret their dimensions;
#  9. select individual elements, rows, columns and array slices;
#  10. distinguish element-wise matrix operations from matrix
#  10. multiplication;
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
# SECTION: 2. From individual values to collections: an academic example
# =====================================================================

# ---- 2.1 The individual-object approach ------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
score_amina <- 60
score_bola  <- 72
score_chidi <- 55
score_dayo  <- 81
score_efe   <- 67


# ---- 2.2 Representing the observations as a vector -------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
scores <- c(60, 72, 55, 81, 67)

# WHY: = \frac{335}{5} = 67 $$ In R:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
mean(scores)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Other useful summaries:
# PREDICT: before you run it, say in one sentence what this block should show.
length(scores)  # number of elements
sum(scores)     # total
min(scores)     # smallest value
max(scores)     # largest value
range(scores)   # minimum and maximum
summary(scores) # descriptive summary


# =====================================================================
# SECTION: 3. Vectors: the fundamental one-dimensional structure
# =====================================================================

# ---- 3.2 Common atomic vector types ----------------------------------
# WHY: | Complex | c(2+3i, 4-1i) | Complex numbers | | Raw |
# WHY: charToRaw("R") | Raw bytes | R commonly displays ordinary numeric
# WHY: literals as doubles:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
a <- 5
b <- 5L

typeof(a)
typeof(b)

class(a)
class(b)


# ---- 3.3 Creating vectors with c() -----------------------------------
# CHECK: run the block, then find the new object(s) in the Environment pane.
marks <- c(60, 72, 55, 81, 67)
names <- c("Amina", "Bola", "Chidi", "Dayo", "Efe")
attendance <- c(TRUE, TRUE, FALSE, TRUE, TRUE)
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: Inspect each object:
# PREDICT: before you run it, say in one sentence what this block should show.
class(marks)
typeof(marks)
str(marks)

class(names)
typeof(names)
str(names)

class(attendance)
typeof(attendance)
str(attendance)


# ---- 3.4 Type coercion -----------------------------------------------
# WHY: \text{double} \rightarrow \text{complex} \rightarrow
# WHY: \text{character} $$ For example:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
v1 <- c(TRUE, FALSE, TRUE)
typeof(v1)

v2 <- c(1L, 2L, 3.5)
typeof(v2)

v3 <- c(10, 20, "thirty")
v3
typeof(v3)


# ---- 3.5 Generating sequences with : ---------------------------------
# WHY: The colon operator creates an integer sequence with a step of one:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
1:5
10:1
# INVESTIGATE: change one value and re-run. What changed, and why?

# WHY: The seq() function offers more control:
# PREDICT: before you run it, say in one sentence what this block should show.
seq(from = 0, to = 20, by = 5)
seq(from = 0, to = 1, length.out = 6)


# ---- 3.6 Repeating values with rep() ---------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
rep(5, times = 4)
rep(c("A", "B"), times = 3)
rep(1:3, each = 2)

# WHY: Compare:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
rep(1:3, times = 2) # 1 2 3 1 2 3
rep(1:3, each = 2)  # 1 1 2 2 3 3
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 3.7 Naming vector elements --------------------------------------
# WHY: Names provide labels for values:
# PREDICT: before you run it, say in one sentence what this block should show.
scores <- c(60, 72, 55, 81, 67)
names(scores) <- c("Amina", "Bola", "Chidi", "Dayo", "Efe")

scores
names(scores)

# WHY: A named vector can also be created directly:
# CHECK: run the block, then find the new object(s) in the Environment pane.
scores <- c(
  Amina = 60,
  Bola = 72,
  Chidi = 55,
  Dayo = 81,
  Efe = 67
)


# =====================================================================
# SECTION: 4. Indexing and subsetting vectors
# =====================================================================

# ---- 4.1 What is indexing? -------------------------------------------
# WHY: Indexing is the process of retrieving one or more elements from a
# WHY: data structure. R uses one-based indexing: the first element is at
# WHY: position 1. For:
# CHECK: after running, type the object name in the Console. What does R show?
x <- c(60, 72, 55, 81, 67)
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: |---|---:|---:|---:|---:|---:| | Value | 60 | 72 | 55 | 81 | 67 |
# WHY: The general form is:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Pattern only (not a command): replace 'index' with real positions
# x[index]


# ---- 4.2 Positive indexing -------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
x[1]       # first element
x[3]       # third element
x[1:3]     # first three elements
x[c(1, 3, 5)] # selected positions


# ---- 4.3 Negative indexing -------------------------------------------
# WHY: Negative positions exclude elements:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
x[-1]        # all except first
x[-c(2, 4)]  # all except second and fourth
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 4.4 Logical indexing --------------------------------------------
# WHY: A logical condition can be used to select values:
# PREDICT: before you run it, say in one sentence what this block should show.
x >= 70
x[x >= 70]
x[x < 60]

# WHY: - & for element-wise AND; - | for element-wise OR; - ! for NOT.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
x[x >= 60 & x <= 75]
x[x < 60 | x > 80]


# ---- 4.5 Named indexing ----------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
scores <- c(Amina = 60, Bola = 72, Chidi = 55, Dayo = 81, Efe = 67)

scores["Dayo"]
scores[c("Amina", "Efe")]
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 4.6 Modifying and extending vectors -----------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
x <- c(60, 72, 55, 81, 67)

x[3] <- 65
x[c(1, 5)] <- c(70, 75)
x[6] <- 88

x


# =====================================================================
# SECTION: 5. Vectorised computation
# =====================================================================

# ---- 5.1 Meaning of vectorisation ------------------------------------
# WHY: =(x_1+c,x_2+c,\ldots,x_n+c) $$ In R:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
scores <- c(60, 72, 55, 81, 67)
scores + 5


# ---- 5.2 Arithmetic operations ---------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
scores + 5
scores - 5
scores * 2
scores / 2
scores^2
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 5.3 Element-wise operations between vectors ---------------------
# WHY: =(a_1+b_1,a_2+b_2,\ldots,a_n+b_n) $$ Example:
# PREDICT: before you run it, say in one sentence what this block should show.
test1 <- c(60, 70, 80, 90)
test2 <- c(65, 75, 78, 85)

test1 + test2
(test1 + test2) / 2


# ---- 5.4 Recycling rule ----------------------------------------------
# WHY: When vectors have different lengths, R may recycle elements of the
# WHY: shorter vector.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
c(10, 20, 30, 40) + c(1, 2)

# WHY: (11,22,31,42) $$ If the longer vector's length is not a multiple of
# WHY: the shorter vector's length, R may issue a warning:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# EXPECTED WARNING: read the warning message R prints, then explain its cause.
c(10, 20, 30, 40, 50) + c(1, 2)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 5.5 Comparisons and logical results -----------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
scores >= 70
scores == 60
scores != 55


# ---- 5.6 Summary functions -------------------------------------------
# WHY: For numerical data:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
length(scores)
sum(scores)
mean(scores)
median(scores)
min(scores)
max(scores)
range(scores)
var(scores)
sd(scores)
summary(scores)

# WHY: s=\sqrt{s^2} $$ In R:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
mean(scores)
var(scores)
sd(scores)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 6. Missing values: an introductory connection
# =====================================================================
# WHY: R represents a missing observation with NA.
# PREDICT: before you run it, say in one sentence what this block should show.
scores <- c(60, 72, NA, 81, 67)
is.na(scores)

# WHY: Many summary functions propagate missingness unless instructed
# WHY: otherwise:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
mean(scores)
sum(scores)

# WHY: The argument na.rm = TRUE removes missing values for that
# WHY: calculation:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
mean(scores, na.rm = TRUE)
sum(scores, na.rm = TRUE)
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 7. Matrices: two-dimensional data organisation
# =====================================================================

# ---- 7.2 Creating a matrix -------------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
M <- matrix(
  data = 1:12,
  nrow = 3,
  ncol = 4
)

M


# ---- 7.3 Column-wise and row-wise filling ----------------------------
# WHY: By default, R fills matrices column by column:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
matrix(1:12, nrow = 3, ncol = 4)

# WHY: To fill by rows:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
matrix(1:12, nrow = 3, ncol = 4, byrow = TRUE)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.4 Dimensions and matrix attributes ----------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
dim(M)
nrow(M)
ncol(M)
length(M)
class(M)
typeof(M)
str(M)


# ---- 7.5 Naming rows and columns -------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_scores <- matrix(
  c(60, 70, 80,
    65, 75, 85,
    55, 68, 78),
  nrow = 3,
  byrow = TRUE
)

rownames(student_scores) <- c("Amina", "Bola", "Chidi")
colnames(student_scores) <- c("Test 1", "Test 2", "Assignment")

student_scores

# WHY: Names can also be supplied through dimnames:
# CHECK: after running, type the object name in the Console. What does R show?
student_scores <- matrix(
  c(60, 70, 80, 65, 75, 85, 55, 68, 78),
  nrow = 3,
  byrow = TRUE,
  dimnames = list(
    c("Amina", "Bola", "Chidi"),
    c("Test 1", "Test 2", "Assignment")
  )
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 8. Matrix indexing and subsetting
# =====================================================================

# ---- 8.1 Two-dimensional indexing ------------------------------------
# WHY: The general form is:
# CHECK: run the block, then find the new object(s) in the Environment pane.
# Pattern only (not a command): replace 'row' and 'column' with real positions
# M[row, column]

# WHY: The first position refers to the row; the second refers to the
# WHY: column.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
M[2, 3]   # element in row 2, column 3
M[1, ]    # all columns in row 1
M[, 2]    # all rows in column 2
M[1:2, 2:3]


# ---- 8.2 Selecting with names ----------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student_scores["Amina", "Test 1"]
student_scores["Bola", ]
student_scores[, "Assignment"]
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 8.3 Preserving dimensions with drop = FALSE ---------------------
# WHY: A single row or column may be simplified to a vector:
# PREDICT: before you run it, say in one sentence what this block should show.
student_scores[, 2]

# WHY: To preserve a two-dimensional matrix result:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_scores[, 2, drop = FALSE]


# ---- 8.4 Updating matrix values --------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student_scores[1, 1] <- 68
student_scores["Bola", "Assignment"] <- 88
student_scores
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 9. Matrix computations and mathematical interpretation
# =====================================================================

# ---- 9.1 Element-wise arithmetic -------------------------------------
# WHY: When matrices have compatible dimensions, arithmetic operators
# WHY: generally act on corresponding positions:
# PREDICT: before you run it, say in one sentence what this block should show.
A <- matrix(1:6, nrow = 2)
B <- matrix(6:1, nrow = 2)

A + B
A - B
A * B
A / B


# ---- 9.2 Scalar operations -------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
A + 10
A * 2


# ---- 9.3 Matrix multiplication ---------------------------------------
# WHY: (AB)_{ij}=\sum_{k=1}^{n}A_{ik}B_{kj} $$ In R, use %*%:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
A <- matrix(c(1, 2, 3, 4), nrow = 2)
B <- matrix(c(5, 6, 7, 8), nrow = 2)

A * B   # element-wise multiplication
A %*% B # matrix multiplication
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 9.4 Row and column summaries ------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
rowSums(student_scores)
colSums(student_scores)

rowMeans(student_scores)
colMeans(student_scores)


# =====================================================================
# SECTION: 10. Arrays: representing more than two dimensions
# =====================================================================

# ---- 10.2 Creating a three-dimensional array -------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score_array <- array(
  data = 1:12,
  dim = c(3, 2, 2)
)

score_array


# ---- 10.3 Array indexing ---------------------------------------------
# WHY: For a three-dimensional array:
# CHECK: after running, type the object name in the Console. What does R show?
# Pattern only (not a command): replace i, j and k with real positions
# A[i, j, k]
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: where each index selects a position in one dimension.
# PREDICT: before you run it, say in one sentence what this block should show.
score_array[1, 1, 1]
score_array[2, 1, 2]
score_array[, , 1] # first layer
score_array[, , 2] # second layer


# ---- 10.4 Naming array dimensions ------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score_array <- array(
  data = 1:12,
  dim = c(3, 2, 2),
  dimnames = list(
    Student = c("Amina", "Bola", "Chidi"),
    Assessment = c("Test", "Assignment"),
    Semester = c("First", "Second")
  )
)

score_array


# ---- 10.5 Inspecting arrays ------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
dim(score_array)
length(score_array)
class(score_array)
typeof(score_array)
str(score_array)
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 12. Extended guided practical: student assessment analysis
# =====================================================================

# ---- Step 1 — Create the data ----------------------------------------
# CHECK: after running, type the object name in the Console. What does R show?
students <- c("Amina", "Bola", "Chidi", "Dayo", "Efe")

test1 <- c(60, 72, 55, 81, 67)
test2 <- c(65, 70, 60, 85, 75)
assignment <- c(70, 75, 65, 90, 80)


# ---- Step 2 — Check consistency --------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
length(students)
length(test1)
length(test2)
length(assignment)


# ---- Step 3 — Calculate average scores -------------------------------
# WHY: \text{Average}_i =
# WHY: \frac{\text{Test1}_i+\text{Test2}_i+\text{Assignment}_i}{3} $$
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
average <- (test1 + test2 + assignment) / 3
average
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- Step 4 — Classify pass status -----------------------------------
# WHY: For this exercise, use 50 as the illustrative pass threshold:
# PREDICT: before you run it, say in one sentence what this block should show.
passed <- average >= 50
passed


# ---- Step 5 — Identify students with averages of at least 70 ---------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
students[average >= 70]
average[average >= 70]


# ---- Step 6 — Create the matrix --------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
student_scores <- cbind(
  Test1 = test1,
  Test2 = test2,
  Assignment = assignment
)

rownames(student_scores) <- students
student_scores
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- Step 7 — Calculate row and column summaries ---------------------
# PREDICT: before you run it, say in one sentence what this block should show.
rowMeans(student_scores)
colMeans(student_scores)

rowSums(student_scores)
colSums(student_scores)


# ---- Step 8 — Select and update values -------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
student_scores["Amina", "Test1"]

student_scores["Amina", "Test1"] <- 68

student_scores


# ---- Step 9 — Inspect the matrix -------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
dim(student_scores)
nrow(student_scores)
ncol(student_scores)
length(student_scores)
str(student_scores)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- Step 10 — Create a semester array -------------------------------
# WHY: Suppose a second semester's scores are also available:
# PREDICT: before you run it, say in one sentence what this block should show.
semester2 <- student_scores + 3

score_array <- array(
  data = c(as.vector(student_scores), as.vector(semester2)),
  dim = c(5, 3, 2),
  dimnames = list(
    Student = students,
    Assessment = c("Test1", "Test2", "Assignment"),
    Semester = c("Semester1", "Semester2")
  )
)

score_array
dim(score_array)

# WHY: Select the Assignment scores for Semester 2:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
score_array[, "Assignment", "Semester2"]


# =====================================================================
# SECTION: 13. Practical activity: Data Structure Detective
# =====================================================================
# WHY: Run:
# CHECK: run the block, then find the new object(s) in the Environment pane.
v <- c(10, 20, 30, 40)
m <- matrix(1:12, nrow = 3, ncol = 4)
a <- array(1:24, dim = c(3, 4, 2))
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: For each object, investigate:
# PREDICT: before you run it, say in one sentence what this block should show.
class(v); typeof(v); length(v); dim(v); str(v)
class(m); typeof(m); length(m); dim(m); str(m)
class(a); typeof(a); length(a); dim(a); str(a)


# =====================================================================
# SECTION: 14. Common errors, interpretation and debugging
# =====================================================================

# ---- 14.1 Using zero as the first index ------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
x <- c(10, 20, 30)
x[0]


# ---- 14.2 Selecting beyond the vector length -------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
x <- c(10, 20, 30)
x[5]
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 14.3 Confusing row and column order -----------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
M[2, 1]


# ---- 14.4 Assuming matrices fill by row ------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
matrix(1:6, nrow = 2, ncol = 3)


# =====================================================================
# SECTION: 17. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the result before running:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
x <- c(10, 20, 30, 40, 50)

x[2]
x[c(1, 3, 5)]
x[x > 25]
x + 5

M <- matrix(1:6, nrow = 2, ncol = 3)
M
M[2, 3]
M[, 2]
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Create an R script that completes all tasks below.
# TASK 1: Create a character vector of at least six student names.
# YOUR CODE:


# TASK 2: Create numeric vectors for Test 1, Test 2 and Assignment.
# YOUR CODE:


# TASK 3: Check that the vectors have matching lengths.
# YOUR CODE:


# TASK 4: Calculate each student's average using vectorised operations.
# YOUR CODE:


# TASK 5: Create a logical vector for pass status using a threshold of 50.
# YOUR CODE:


# TASK 6: Select students with averages of at least 70 using logical
# TASK 6: indexing.
# YOUR CODE:


# TASK 7: Select the second and fifth students' scores.
# YOUR CODE:


# TASK 8: Create a matrix containing the three assessment variables.
# YOUR CODE:


# TASK 9: Add meaningful row names and column names.
# YOUR CODE:


# TASK 10: Calculate student means with rowMeans().
# YOUR CODE:


# TASK 11: Calculate assessment means with colMeans().
# YOUR CODE:


# TASK 12: Update one score and display the revised matrix.
# YOUR CODE:


# TASK 13: Create a three-dimensional array representing at least two
# TASK 13: semesters.
# YOUR CODE:


# TASK 14: Inspect the objects using class(), typeof(), length(), dim()
# TASK 14: and str().
# YOUR CODE:


# TASK 15: Add comments and a short interpretation of the results.
# YOUR CODE:


# Use meaningful object names. Ensure the values at corresponding
# positions refer to the same student.
# Title: Working with Vectors, Matrices and Arrays in R
# Prepare a script named My_Week3_Assignment.R.
# Your submission must demonstrate:
#   - numeric, character and logical vectors;
#   - sequence generation using : or seq();
#   - repetition using rep();
#   - positive, negative, logical and named indexing;
#   - modification of vector elements;
#   - vectorised arithmetic and comparisons;
#   - at least three summary functions;
#   - matrix creation and meaningful dimension names;
#   - selection of individual elements, rows and columns;
#   - row or column summaries;
#   - creation of a three-dimensional array;
#   - inspection of data types, lengths, structures and dimensions;
#   - comments explaining the major steps;
#   - a short interpretation of the output.
# Submission: Save the script in your DTS 211 course project and submit it
# using the lecturer's specified channel.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer in your own words:
# Q1. What is a vector?
# A: 

# Q2. Why does R use c() to combine values?
# A: 

# Q3. What is the difference between seq() and rep()?
# A: 

# Q4. Why does indexing begin at 1?
# A: 

# Q5. What is logical indexing?
# A: 

# Q6. What is vectorisation?
# A: 

# Q7. Explain the recycling rule and one risk of relying on it.
# A: 

# Q8. What distinguishes a matrix from a vector?
# A: 

# Q9. What does byrow = TRUE change?
# A: 

# Q10. Explain the difference between  and %%.
# A: 

# Q11. What is an array?
# A: 

# Q12. How would you interpret dim(cube) if it returned c(4, 3, 2)?
# A: 

# Predict the result before running:
# Explain each result and identify the positions selected.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_03_DTS211_student.R in your project and commit your notes.
