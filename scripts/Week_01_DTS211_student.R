# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 1 of 12 (student script)
# Understanding R and the RStudio/Posit Environment
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. Explain what R is and outline its historical development.
#  2. Discuss the importance of R in statistical computing and data
#  2. science.
#  3. Identify areas in which R is applied, with relevant examples.
#  4. Distinguish R, RStudio and Posit Cloud.
#  5. Install or access an R environment through an appropriate route.
#  6. Create and organise an RStudio Project.
#  7. Identify the Console, Script Editor/Source, Environment, Files,
#  7. Plots and Packages panes.
#  8. Explain how the interface components interact in a typical workflow.
#  9. Create, save, reopen and execute a simple R script.
#  10. Locate documentation and use the R Help system to investigate
#  10. functions.
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
# SECTION: 9. Understanding the RStudio interface
# =====================================================================

# ---- 9.6 Packages ----------------------------------------------------
# WHY: A first orientation to package installation and loading:
# CHECK: after running, type the object name in the Console. What does R show?
# Install only if the package is missing, then load it
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)


# ---- 9.7 Help --------------------------------------------------------
# WHY: Students can use the Help pane or enter a question-mark command in
# WHY: the Console.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
?mean
help("mean")


# =====================================================================
# SECTION: 10. From script to execution: first orientation
# =====================================================================
# WHY: Type a simple expression:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
2 + 2
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: 4. Run the current line using the Run control. 5. Observe where the
# WHY: result appears. Try:
# PREDICT: before you run it, say in one sentence what this block should show.
10 * 5
100 / 4


# ---- 10.1 Comments ---------------------------------------------------
# WHY: In R, comments begin with #.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
# My first DTS 211 script
# This line asks R to calculate 2 plus 2
2 + 2


# ---- 10.2 Your first commands: predict, run, explain -----------------
# WHY: For each line below, write your prediction as a comment, run the
# WHY: line, and note whether you were right.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
getwd()                  # Which folder is R working in?
sqrt(16)                 # Predict the result
round(3.14159, 2)        # Predict the result
sum(1:10)                # What does 1:10 mean?
print("Hello, DTS 211")   # Text goes inside quotation marks
R.version.string         # Which version of R are you using?
# INVESTIGATE: explain this block to a classmate in two sentences.

# WHY: Now practise the help system and the package workflow:
# PREDICT: before you run it, say in one sentence what this block should show.
?sum                    # Open the help page for sum()
help("round")            # Same idea, different style
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(ggplot2)         # Load the package for this session
sessionInfo()            # Record your R version and loaded packages


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Prepare a short digital portfolio with three parts.
# Part A — Why R for Data Science?
# Write approximately one page explaining:
#   - the historical significance of R;
#   - at least four areas in which R is used;
#   - why a programming environment is useful when working with large
#   - datasets.
# Part B — Annotated environment
# Provide a screenshot of RStudio Desktop or Posit Cloud. Clearly label:
#   - Console;
#   - Script Editor/Source;
#   - Environment;
#   - Files;
#   - Plots;
#   - Packages.
# Explain the purpose of each component in complete sentences.
# Part C — Mathematical reasoning
# Using scores 60, 72, 55, 81 and 67, calculate the arithmetic mean by
# hand:
# $$
# \bar{x}=\frac{\sum_{i=1}^{n}x_i}{n}
# $$
# Show every step. Explain why a data scientist would want a computer to
# perform this calculation when the dataset contains thousands or millions
# of observations.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Q1. What did you believe R was before this class?
# A: 

# Q2. How would you now distinguish R, RStudio and Posit Cloud?
# A: 

# Q3. Which interface component is clearest to you?
# A: 

# Q4. Which component still needs practice?
# A: 

# Q5. What did you discover by exploring before receiving the lecturer's
# Q5. explanation?
# A: 

# Q6. What challenge did you encounter during installation or access?
# A: 

# Q7. How could an organised project improve your coursework?
# A: 

# Q8. What would you like to be able to do with R by the end of the
# Q8. course?
# A: 

# Q1. Complete: R is __________________.
# A: 

# Q2. Complete: RStudio is __________________.
# A: 

# Q3. Complete: Posit Cloud is __________________.
# A: 

# Q4. Name the six interface components studied.
# A: 

# Q5. Where would you write reusable R code?
# A: 

# Q6. Where would you see a graph?
# A: 

# Q7. Calculate the mean of 10, 20, 30 and 40.
# A: 

# Q8. State one question you still have about R.
# A: 


# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_01_DTS211_student.R in your project and commit your notes.
