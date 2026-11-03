# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 7 of 12 (student script)
# Displaying and Plotting Data
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# BY THE END OF THIS SCRIPT YOU SHOULD BE ABLE TO:
#  1. explain the role of visualisation in exploratory data analysis and
#  1. communication;
#  2. distinguish categorical and numerical variables for plotting
#  2. purposes;
#  3. select a suitable chart for a stated analytical question;
#  4. create and interpret bar charts, histograms, boxplots, scatterplots
#  4. and line plots;
#  5. construct plots using base R graphics;
#  6. construct layered plots using ggplot2;
#  7. map variables to visual aesthetics such as position, colour, shape
#  7. and size;
#  8. add titles, axis labels, legends and themes;
#  9. identify misleading visual choices and explain why they are
#  9. problematic;
#  10. interpret visual patterns without claiming more than the plot
#  10. supports;
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
if (!dir.exists("data")) source("00_make_data.R")   # creates data/ and output/ once
if (!dir.exists("output")) dir.create("output")
set.seed(42)                                   # makes random results repeatable
getwd()                                        # confirm the project folder


# =====================================================================
# SECTION: 3. Understanding variables before plotting
# =====================================================================

# ---- 3.3 Identify variable types in R --------------------------------
# WHY: Create it now (it is the same data frame that Section 5 uses):
# CHECK: after running, type the object name in the Console. What does R show?
students <- data.frame(
  student = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola",
              "Ganiyu", "Hauwa", "Ife", "Jide"),
  programme = c(
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science"
  ),
  score = c(68, 74, 55, 81, 63, 77, 69, 88, 72, 59),
  study_hours = c(5, 7, 3, 8, 4, 6, 5, 9, 6, 4)
)

# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
str(students)
sapply(students, class)


# =====================================================================
# SECTION: 5. First plots with base R graphics
# =====================================================================
# WHY: We begin with a small dataset:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
students <- data.frame(
  student = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola",
              "Ganiyu", "Hauwa", "Ife", "Jide"),
  programme = c(
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science", "Statistics", "Mathematics",
    "Computer Science"
  ),
  score = c(68, 74, 55, 81, 63, 77, 69, 88, 72, 59),
  study_hours = c(5, 7, 3, 8, 4, 6, 5, 9, 6, 4)
)

str(students)
summary(students)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 5.1 Bar chart: comparing categories -----------------------------
# WHY: First calculate category counts:
# PREDICT: before you run it, say in one sentence what this block should show.
programme_counts <- table(students$programme)
programme_counts

# WHY: Create the bar chart:
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
barplot(
  programme_counts,
  main = "Students by Programme",
  xlab = "Programme",
  ylab = "Number of Students",
  col = "skyblue",
  border = "white"
)


# ---- 5.2 Horizontal bar chart ----------------------------------------
# WHY: When category labels are long, a horizontal display may be easier
# WHY: to read:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
barplot(
  programme_counts,
  horiz = TRUE,
  main = "Students by Programme",
  xlab = "Number of Students",
  col = "lightgreen"
)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 5.3 Histogram: examining a numerical distribution ---------------
# WHY: A histogram groups numerical values into intervals, called bins,
# WHY: and displays the frequency in each interval.
# PREDICT: before you run it, say in one sentence what this block should show.
hist(
  students$score,
  main = "Distribution of Examination Scores",
  xlab = "Examination Score",
  ylab = "Frequency",
  col = "lightblue",
  border = "white"
)


# ---- 5.4 Boxplot: summarising and comparing distributions ------------
# WHY: A boxplot gives a compact summary of a numerical distribution.
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
boxplot(
  students$score,
  main = "Examination Score Summary",
  ylab = "Score",
  col = "lightyellow"
)


# ---- 5.5 Compare groups with a boxplot -------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
boxplot(
  score ~ programme,
  data = students,
  main = "Examination Scores by Programme",
  xlab = "Programme",
  ylab = "Score",
  col = c("lightblue", "lightgreen", "lightpink")
)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 5.6 Scatterplot: exploring two numerical variables --------------
# WHY: A scatterplot displays paired values for two numerical variables.
# PREDICT: before you run it, say in one sentence what this block should show.
plot(
  students$study_hours,
  students$score,
  main = "Study Hours and Examination Score",
  xlab = "Weekly Study Hours",
  ylab = "Examination Score",
  pch = 19,
  col = "darkblue"
)


# ---- 5.7 Add a fitted trend line -------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
plot(
  students$study_hours,
  students$score,
  main = "Study Hours and Examination Score",
  xlab = "Weekly Study Hours",
  ylab = "Examination Score",
  pch = 19
)

abline(
  lm(score ~ study_hours, data = students),
  col = "red",
  lwd = 2
)


# ---- 5.8 Line plot: showing change over an ordered sequence ----------
# WHY: A line plot is often useful for measurements collected over time or
# WHY: another meaningful order.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
semester_data <- data.frame(
  semester = 1:6,
  enrolment = c(120, 135, 142, 150, 168, 180)
)

plot(
  semester_data$semester,
  semester_data$enrolment,
  type = "o",
  main = "Student Enrolment Across Semesters",
  xlab = "Semester",
  ylab = "Number of Students",
  pch = 19,
  lwd = 2
)
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# SECTION: 6. Visual summaries and mathematical interpretation
# =====================================================================

# ---- 6.1 Frequency and proportion ------------------------------------
# WHY: 100p_k $$ In R:
# PREDICT: before you run it, say in one sentence what this block should show.
counts <- table(students$programme)
proportions(counts)
100 * proportions(counts)


# ---- 6.2 Mean and median ---------------------------------------------
# WHY: \bar{x} = \frac{1}{n}\sum_{i=1}^{n}x_i $$ The median is the middle
# WHY: observation after sorting the values (or the average of the two
# WHY: middle observati...
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
mean(students$score)
median(students$score)


# ---- 6.3 Quartiles and the interquartile range -----------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
quantile(students$score)
IQR(students$score)
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 6.4 Correlation as a numerical supplement to a scatterplot ------
# PREDICT: before you run it, say in one sentence what this block should show.
cor(students$study_hours, students$score)


# =====================================================================
# SECTION: 7. Introducing ggplot2
# =====================================================================
# WHY: Install once:
# CHECK: after running, type the object name in the Console. What does R show?
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")

# WHY: Load in an R session:
# CHECK: run the block, then find the new object(s) in the Environment pane.
library(ggplot2)
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.1 The grammar of graphics -------------------------------------
# WHY: A simple plot:
# PREDICT: before you run it, say in one sentence what this block should show.
ggplot(
  data = students,
  mapping = aes(x = study_hours, y = score)
) +
  geom_point()


# ---- 7.2 Map variables using aes() -----------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
ggplot(
  students,
  aes(x = study_hours, y = score, colour = programme)
) +
  geom_point()

# WHY: - programme maps to colour. A variable mapped inside aes() is
# WHY: represented according to its values. A fixed visual choice supplied
# WHY: outside aes() app...
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# Colour mapped to a variable
ggplot(students, aes(study_hours, score, colour = programme)) +
  geom_point()

# One fixed colour for all points
ggplot(students, aes(study_hours, score)) +
  geom_point(colour = "steelblue")
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# ---- 7.3 Bar chart with ggplot2 --------------------------------------
# WHY: For categorical counts:
# PREDICT: before you run it, say in one sentence what this block should show.
ggplot(students, aes(x = programme)) +
  geom_bar() +
  labs(
    title = "Students by Programme",
    x = "Programme",
    y = "Number of Students"
  )

# WHY: If the data already contain counts, use geom_col():
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
programme_summary <- as.data.frame(table(students$programme))
names(programme_summary) <- c("programme", "count")

ggplot(programme_summary, aes(x = programme, y = count)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Student Count by Programme",
    x = "Programme",
    y = "Number of Students"
  )


# ---- 7.4 Histogram with ggplot2 --------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
ggplot(students, aes(x = score)) +
  geom_histogram(
    bins = 6,
    fill = "skyblue",
    colour = "white"
  ) +
  labs(
    title = "Distribution of Examination Scores",
    x = "Examination Score",
    y = "Frequency"
  )
# INVESTIGATE: explain this block to a classmate in two sentences.


# ---- 7.5 Boxplot by programme ----------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
ggplot(students, aes(x = programme, y = score, fill = programme)) +
  geom_boxplot() +
  labs(
    title = "Examination Scores by Programme",
    x = "Programme",
    y = "Score"
  ) +
  guides(fill = "none")


# ---- 7.6 Scatterplot with group colour -------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
ggplot(
  students,
  aes(x = study_hours, y = score, colour = programme)
) +
  geom_point(size = 3) +
  labs(
    title = "Study Hours and Examination Scores",
    x = "Weekly Study Hours",
    y = "Examination Score",
    colour = "Programme"
  )


# ---- 7.7 Add a trend line --------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
ggplot(students, aes(x = study_hours, y = score)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relationship Between Study Hours and Scores",
    x = "Weekly Study Hours",
    y = "Examination Score"
  )
# INVESTIGATE: change one value and re-run. What changed, and why?


# ---- 7.8 Line plot with ggplot2 --------------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
ggplot(semester_data, aes(x = semester, y = enrolment)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(
    title = "Student Enrolment Across Semesters",
    x = "Semester",
    y = "Number of Students"
  )


# =====================================================================
# SECTION: 8. Customising plots for communication
# =====================================================================

# ---- 8.1 Titles and labels -------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  labs(
    title = "Study Time and Examination Performance",
    subtitle = "Illustrative departmental student dataset",
    x = "Weekly study hours",
    y = "Examination score (out of 100)",
    caption = "Source: DTS 211 teaching dataset"
  )


# ---- 8.2 Themes ------------------------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  theme_minimal()
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.

# WHY: Other available themes include:
# PREDICT: before you run it, say in one sentence what this block should show.
theme_classic()
theme_bw()
theme_light()


# ---- 8.3 Rotate or adjust axis labels --------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
ggplot(students, aes(x = programme)) +
  geom_bar() +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1)
  )


# ---- 8.4 Faceting ----------------------------------------------------
# WHY: Faceting creates separate panels for subsets of the data.
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  facet_wrap(~ programme) +
  labs(
    title = "Study Hours and Scores by Programme",
    x = "Weekly Study Hours",
    y = "Score"
  )
# INVESTIGATE: explain this block to a classmate in two sentences.


# =====================================================================
# SECTION: 9. Saving plots
# =====================================================================

# ---- 9.1 Save the most recent ggplot2 plot ---------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
score_plot <- ggplot(students, aes(study_hours, score)) +
  geom_point() +
  labs(
    title = "Study Hours and Scores",
    x = "Weekly Study Hours",
    y = "Score"
  )

ggsave(
  filename = "output/study_hours_scores.png",
  plot = score_plot,
  width = 8,
  height = 5,
  units = "in",
  dpi = 300
)


# ---- 9.2 Save a base R plot ------------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
png(
  filename = "output/score_histogram.png",
  width = 1600,
  height = 1000,
  res = 200
)

hist(
  students$score,
  main = "Distribution of Examination Scores",
  xlab = "Score",
  col = "lightblue"
)

dev.off()


# =====================================================================
# SECTION: 11. Worked investigation: departmental performance
# =====================================================================

# ---- 11.2 Construct the displays -------------------------------------
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
# Category counts
ggplot(students, aes(programme)) +
  geom_bar() +
  labs(
    title = "Student Count by Programme",
    x = "Programme",
    y = "Count"
  )

# Score distribution
ggplot(students, aes(score)) +
  geom_histogram(bins = 6, fill = "skyblue", colour = "white") +
  labs(
    title = "Distribution of Examination Scores",
    x = "Score",
    y = "Frequency"
  )

# Score comparison
ggplot(students, aes(programme, score, fill = programme)) +
  geom_boxplot() +
  labs(
    title = "Score Distribution by Programme",
    x = "Programme",
    y = "Score"
  ) +
  guides(fill = "none")

# Study hours and scores
ggplot(students, aes(study_hours, score, colour = programme)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Study Hours and Examination Scores",
    x = "Weekly Study Hours",
    y = "Score",
    colour = "Programme"
  )
# INVESTIGATE: change one value and re-run. What changed, and why?


# =====================================================================
# SECTION: 12. Common errors and troubleshooting
# =====================================================================

# ---- 12.1 A plotting diagnostic routine ------------------------------
# PREDICT: before you run it, say in one sentence what this block should show.
str(students)
summary(students)
sum(is.na(students$score))
range(students$score, na.rm = TRUE)


# =====================================================================
# SECTION: 13. Guided practical: visualise a departmental dataset
# =====================================================================

# ---- Task B: Inspect the data ----------------------------------------
# PREDICT: will the result be a single value, a vector or a table? Guess, then run.
head(students)
str(students)
summary(students)


# =====================================================================
# SECTION: 18. Reflection and exit ticket
# =====================================================================

# ---- Exit-ticket code ------------------------------------------------
# WHY: Predict the purpose of each expression before running it:
# PREDICT: what will R print? Write your guess here: ____________ , then run the block.
counts <- table(students$programme)

barplot(
  counts,
  main = "Students by Programme",
  ylab = "Count"
)

hist(students$score)

boxplot(score ~ programme, data = students)

plot(students$study_hours, students$score)

library(ggplot2)

ggplot(students, aes(study_hours, score)) +
  geom_point() +
  labs(
    title = "Study Hours and Scores",
    x = "Weekly Study Hours",
    y = "Examination Score"
  )
# INVESTIGATE: break it on purpose (a typo, a missing bracket). Read the error message aloud.


# =====================================================================
# YOUR TURN: apply what you practised
# =====================================================================
# Write your own code under each task. Use meaningful names and comments.
#
# Select an approved dataset with at least 30 observations and three
# variables. It may relate to education, agriculture, health, environment,
# business or another permitted domain.
# Prepare a small visual story containing:
# TASK 1: One categorical comparison.
# YOUR CODE:


# TASK 2: One numerical distribution.
# YOUR CODE:


# TASK 3: One relationship between two numerical variables, if the dataset
# TASK 3: supports it.
# YOUR CODE:


# TASK 4: One grouped comparison or time trend, if appropriate.
# YOUR CODE:


# TASK 5: A short title for the overall visual story.
# YOUR CODE:


# TASK 6: Three evidence-based findings.
# YOUR CODE:


# TASK 7: One limitation or caveat.
# YOUR CODE:


# Your report must explain why each plot was selected. Do not force a plot
# type when the dataset does not contain suitable variables. If a
# relationship or time trend cannot be examined, explain why.
# Submit the R script, dataset source description, saved plots and a
# 300–400 word interpretation.

# =====================================================================
# CHECK YOUR UNDERSTANDING (exit ticket): answer in comments
# =====================================================================
# Answer in your own words:
# Q1. Why do analysts use visualisations?
# A: 

# Q2. What is the difference between exploratory and explanatory
# Q2. visualisation?
# A: 

# Q3. Which plot is suitable for comparing category counts?
# A: 

# Q4. What does a histogram show?
# A: 

# Q5. What information does a boxplot summarise?
# A: 

# Q6. What does each point in a scatterplot represent?
# A: 

# Q7. When is a line plot appropriate?
# A: 

# Q8. What does aes() do in ggplot2?
# A: 

# Q9. What is the difference between geom_bar() and geom_col()?
# A: 

# Q10. Why should bar charts generally begin at zero?
# A: 

# Q11. Why does correlation not establish causation?
# A: 

# Q12. What is the purpose of labs()?
# A: 

# Q13. What does ggsave() do?
# A: 

# Q14. Why should a plot include clear axis labels?
# A: 

# Q15. How can a plot be visually attractive but misleading?
# A: 

# Predict the purpose of each expression before running it:
# Explain the question each plot can help answer and one limitation of its
# interpretation.

# =====================================================================
# FINISH
# =====================================================================
# 1. Run the whole script from the top: Source (Ctrl+Shift+S). It should finish with no unexpected errors.
# 2. Record your setup for reproducibility:
R.version.string
# 3. Save this file as scripts/Week_07_DTS211_student.R in your project and commit your notes.
