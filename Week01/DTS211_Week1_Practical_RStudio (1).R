# ============================================================
# DTS 211: INTRODUCTION TO R PROGRAMMING
# WEEK 1 PRACTICAL
# GETTING STARTED WITH R AND RSTUDIO
# ============================================================
#
# Department of Computer Science
# Olabisi Onabanjo University
#
# Student Name: ______________________________
# Matric Number: _____________________________
# Date: ______________________________________
#
# WEEK 1 QUESTION:
# What is R, why do data scientists use it,
# and how do I work in RStudio?
#
# HOW TO USE THIS SCRIPT
# 1. Read the instructions in the comments.
# 2. Run each example using Ctrl + Enter.
# 3. Complete the DO IT YOURSELF sections yourself.
# 4. Save your work regularly.
# ============================================================


# ============================================================
# 1. YOUR FIRST R COMMAND
# ============================================================
#
# The Console is where R executes commands.
# Run the command below.

2 + 3

# Expected result: 5


# ============================================================
# 2. EXPLORE R AS A CALCULATOR
# ============================================================
#
# R can perform arithmetic.
#
# +  addition
# -  subtraction
# *  multiplication
# /  division
# ^  power

10 + 5
20 - 7
6 * 4
20 / 5
2^3


# ------------------------------------------------------------
# DO IT YOURSELF 1 — CALCULATOR CHALLENGE
# ------------------------------------------------------------
#
# Write R commands to calculate:
#
# 1. 25 + 17
# 2. 100 - 37
# 3. 12 x 8
# 4. 144 / 12
# 5. 5^3
#
# Then calculate:
#
# ((25 + 17) * 2) / 7
#
# Write your answers below.

# 1.


# 2.


# 3.


# 4.


# 5.


# Challenge:



# ============================================================
# 3. COMMENTS IN R
# ============================================================
#
# A comment begins with #.
# R does not execute comments.
#
# Comments help us explain our code.

# Calculate the average of five scores
(60 + 72 + 55 + 81 + 67) / 5


# ------------------------------------------------------------
# DO IT YOURSELF 2
# ------------------------------------------------------------
#
# Write two calculations and explain each one with a comment.

# Calculation 1:


# Calculation 2:



# ============================================================
# 4. OUR FIRST DATA PROBLEM
# ============================================================
#
# Five students obtained the following scores:
#
# Student A = 60
# Student B = 72
# Student C = 55
# Student D = 81
# Student E = 67
#
# We want to find:
# - the average score
# - the total
# - the number of scores
# - the highest score
# - the lowest score
#
# We will create a collection of scores.

scores <- c(60, 72, 55, 81, 67)

# Display the scores.

scores


# ============================================================
# 5. EXPLORE THE ENVIRONMENT
# ============================================================
#
# Look at the Environment pane in RStudio.
#
# You should see an object called:
#
# scores
#
# This is your first encounter with an R object.
#
# We will study objects and vectors in more detail later.
#
# For now, observe what happens when you create an object.


# ============================================================
# 6. CALCULATE THE MEAN
# ============================================================
#
# mean() calculates the average.

mean(scores)

# Expected result: 67


# ============================================================
# 7. EXPLORE THE SCORES
# ============================================================

# Total
sum(scores)

# Number of scores
length(scores)

# Highest score
max(scores)

# Lowest score
min(scores)


# ------------------------------------------------------------
# DO IT YOURSELF 3 — INVESTIGATE THE SCORES
# ------------------------------------------------------------
#
# Complete the following questions using R.
#
# Question 1:
# What is the total?
#
# Question 2:
# How many scores are there?
#
# Question 3:
# What is the average?
#
# Question 4:
# What is the highest score?
#
# Question 5:
# What is the lowest score?
#
# Write the commands below.

# Question 1:


# Question 2:


# Question 3:


# Question 4:


# Question 5:



# ============================================================
# 8. WORKING WITH A CONDITION
# ============================================================
#
# Suppose we want to know which students scored at least 50.
#
# Try:

scores >= 50

# TRUE means the condition is satisfied.
# FALSE means the condition is not satisfied.


# Count the students who scored at least 50.

sum(scores >= 50)


# Calculate the percentage.

sum(scores >= 50) / length(scores) * 100


# ------------------------------------------------------------
# DO IT YOURSELF 4
# ------------------------------------------------------------
#
# Create a new set of scores:

new_scores <- c(45, 52, 68, 39, 77)

# Find:
#
# 1. The mean
# 2. Number scoring at least 50
# 3. Percentage scoring at least 50


# 1. Mean:


# 2. Number scoring at least 50:


# 3. Percentage scoring at least 50:



# ============================================================
# 9. COMPARE TWO GROUPS
# ============================================================

group_A <- c(60, 72, 55, 81, 67)
group_B <- c(45, 52, 68, 39, 77)

# Calculate the average of Group A.

mean(group_A)

# Calculate the average of Group B.

mean(group_B)


# ------------------------------------------------------------
# THINK AND DISCUSS
# ------------------------------------------------------------
#
# With a partner:
#
# 1. What is the average of Group A?
# 2. What is the average of Group B?
# 3. What evidence does R provide?
# 4. Is the average enough to describe the groups completely?
#
# Write your observations in the comments below.


# Observation:



# ============================================================
# 10. CREATE YOUR FIRST PLOT
# ============================================================
#
# A data scientist should be able to calculate AND visualise.
#
# The command below creates a bar chart.

barplot(
  scores,
  names.arg = c("A", "B", "C", "D", "E"),
  main = "Student Examination Scores",
  xlab = "Student",
  ylab = "Score"
)


# Look at the Plots pane in RStudio.


# ------------------------------------------------------------
# DISCUSS
# ------------------------------------------------------------
#
# 1. Which student has the highest score?
# 2. Which student has the lowest score?
# 3. How many students scored above 70?
# 4. What does the graph show more clearly than the table?


# ============================================================
# 11. DO IT YOURSELF 5 — CREATE YOUR OWN PLOT
# ============================================================
#
# Create your own scores.

my_scores <- c(55, 63, 48, 91, 74)

# First create a simple bar plot.

barplot(my_scores)

# Now improve the plot.
#
# Your plot should contain:
# - a title
# - an x-axis label
# - a y-axis label
# - labels S1, S2, S3, S4 and S5
#
# Write your improved plot below.

barplot(
  my_scores,
  names.arg = c("S1", "S2", "S3", "S4", "S5"),
  main = "My Student Scores",
  xlab = "Student",
  ylab = "Score"
)


# ============================================================
# 12. RSTUDIO FILES PANE
# ============================================================
#
# Look at the Files pane.
#
# Your Week 1 folder could eventually contain:
#
# DTS211/
#   Week1/
#      week1_practical.R
#      data/
#      plots/
#
# For now, make sure this script is saved.
#
# SAVE YOUR WORK:
# File -> Save
#
# Suggested filename:
#
# DTS211_Week1_Practical.R


# ============================================================
# 13. RSTUDIO PACKAGES PANE
# ============================================================
#
# Open the Packages pane.
#
# Packages extend the capabilities of R.
#
# Examples that we will encounter later:
#
# ggplot2
# dplyr
# tidyr
# readr
#
# For Week 1, your task is simply to locate the Packages pane
# and understand that packages provide additional tools.


# ============================================================
# 14. DEBUGGING — ERRORS ARE INFORMATION
# ============================================================
#
# Programming involves mistakes.
# Learning to read errors is part of programming.
#
# Run the following command deliberately:

Mean(scores)

# What happened?
#
# R is case-sensitive.
#
# Correct command:

mean(scores)


# Now try:

mean(score)

# Why does this fail?
#
# We created "scores", not "score".
#
# Correct it:

mean(scores)


# ============================================================
# 15. DO IT YOURSELF 6 — DEBUG THE CODE
# ============================================================
#
# Correct the following examples.
#
# A:
# Mean(scores)
#
# B:
# mean(score)
#
# C:
# mean scores
#
# D:
# scores <- c(60, 72, 55, 81, 67
#
# For each:
# 1. Run it.
# 2. Read the error.
# 3. Identify the problem.
# 4. Correct it.
# 5. Run the corrected version.


# A — corrected version:


# B — corrected version:


# C — corrected version:


# D — corrected version:



# ============================================================
# 16. PAIR PROGRAMMING CHALLENGE
# ============================================================
#
# Work in pairs.
#
# STUDENT A = DRIVER
# Controls the keyboard.
#
# STUDENT B = NAVIGATOR
# Reads the question, predicts what should happen,
# and watches for errors.
#
# Switch roles after five minutes.


attendance <- c(80, 75, 92, 68, 88, 95, 71)

# Find:
# 1. Number of students
# 2. Average attendance
# 3. Highest attendance
# 4. Lowest attendance
# 5. Number with attendance >= 75
# 6. Percentage with attendance >= 75
#
# Then create a bar chart.


# 1. Number of students:


# 2. Average attendance:


# 3. Highest attendance:


# 4. Lowest attendance:


# 5. Number with attendance >= 75:


# 6. Percentage with attendance >= 75:


# Bar chart:



# ============================================================
# 17. INDEPENDENT CHALLENGE
# ============================================================
#
# Work independently.
#
# Create the following data:

marks <- c(45, 67, 72, 38, 81, 59, 90, 64)

# Find:
#
# 1. Number of marks
# 2. Total
# 3. Average
# 4. Highest mark
# 5. Lowest mark
# 6. Number scoring at least 50
# 7. Percentage scoring at least 50
# 8. Create a bar plot
# 9. Give your plot a meaningful title
# 10. Write a short interpretation
#
# IMPORTANT:
#
# Try to solve the problems before looking at earlier examples.


# 1. Number of marks:


# 2. Total:


# 3. Average:


# 4. Highest:


# 5. Lowest:


# 6. Number scoring at least 50:


# 7. Percentage scoring at least 50:


# 8–9. Plot:


# 10. Interpretation:
# Write your interpretation as comments.
# Example:
# The average score was ...


# ============================================================
# 18. MINI DATA INVESTIGATION
# ============================================================
#
# Imagine your lecturer asks:
#
# "Give me a quick summary of the students' performance."
#
# Use:
#
# scores <- c(60, 72, 55, 81, 67)
#
# Your workflow should be:
#
# QUESTION
#     ↓
# DATA
#     ↓
# CALCULATE
#     ↓
# VISUALISE
#     ↓
# INTERPRET
#
# Complete the investigation below.


scores <- c(60, 72, 55, 81, 67)

# Mean:


# Highest:


# Lowest:


# Number scoring >= 60:


# Percentage scoring >= 60:


# Plot:


# Interpretation:
#
# Write two sentences explaining what the results mean.



# ============================================================
# 19. WEEK 1 ASSIGNMENT — MY FIRST R ANALYSIS
# ============================================================
#
# Create your own dataset containing at least 8 numerical values.
#
# Examples:
# - daily study hours
# - quiz scores
# - weekly expenses
# - attendance percentages
# - exercise hours
#
# Use your own data.
#
# Then:
#
# 1. Find the number of observations.
# 2. Find the total.
# 3. Find the mean.
# 4. Find the maximum.
# 5. Find the minimum.
# 6. Define a meaningful condition.
# 7. Count how many observations meet the condition.
# 8. Calculate the percentage.
# 9. Create a bar plot.
# 10. Interpret your results.
#
# START BELOW.


# My dataset:


# Number of observations:


# Total:


# Mean:


# Maximum:


# Minimum:


# My condition:


# Number meeting the condition:


# Percentage:


# My bar plot:


# My interpretation:
#
# 1.
#
# 2.


# ============================================================
# 20. WEEK 1 REFLECTION
# ============================================================
#
# Complete these statements using comments.
#
# Before this practical, I thought R was:


# Now I understand that R is:


# RStudio is:


# The Console is used for:


# The Script Editor is used for:


# The Environment shows:


# The Plots pane is used for:


# One thing I can now do independently is:


# One thing I still need to practise is:



# ============================================================
# 21. WEEK 1 EXIT CHECKLIST
# ============================================================
#
# Put TRUE or FALSE after each statement.
#
# I can open RStudio:


# I can find the Console:


# I can find the Script Editor:


# I can create an R script:


# I can save an R script:


# I can run code:


# I can create a collection of scores:


# I can calculate a mean:


# I can calculate a percentage:


# I can create a bar plot:


# I can find an object in the Environment:


# I can find a graph in Plots:


# I can explain R vs RStudio:


# I can identify and fix a simple error:


# ============================================================
# END OF WEEK 1 PRACTICAL
# ============================================================
#
# Remember:
#
# THINK → CODE → RUN → OBSERVE → CORRECT → EXPLAIN
#
# You are not learning R by memorising commands.
# You are learning R by using code to answer questions.
# ============================================================
