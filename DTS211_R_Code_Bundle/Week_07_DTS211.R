# DTS 211 — Week 7 R Code Collection
# Extracted from: DTS211_Week7_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
str(students)
sapply(students, class)


# ====================================================================
# Code example 2
# ====================================================================
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


# ====================================================================
# Code example 3
# ====================================================================
programme_counts <- table(students$programme)
programme_counts


# ====================================================================
# Code example 4
# ====================================================================
barplot(
  programme_counts,
  main = "Students by Programme",
  xlab = "Programme",
  ylab = "Number of Students",
  col = "skyblue",
  border = "white"
)


# ====================================================================
# Code example 5
# ====================================================================
barplot(
  programme_counts,
  horiz = TRUE,
  main = "Students by Programme",
  xlab = "Number of Students",
  col = "lightgreen"
)


# ====================================================================
# Code example 6
# ====================================================================
hist(
  students$score,
  main = "Distribution of Examination Scores",
  xlab = "Examination Score",
  ylab = "Frequency",
  col = "lightblue",
  border = "white"
)


# ====================================================================
# Code example 7
# ====================================================================
boxplot(
  students$score,
  main = "Examination Score Summary",
  ylab = "Score",
  col = "lightyellow"
)


# ====================================================================
# Code example 8
# ====================================================================
boxplot(
  score ~ programme,
  data = students,
  main = "Examination Scores by Programme",
  xlab = "Programme",
  ylab = "Score",
  col = c("lightblue", "lightgreen", "lightpink")
)


# ====================================================================
# Code example 9
# ====================================================================
plot(
  students$study_hours,
  students$score,
  main = "Study Hours and Examination Score",
  xlab = "Weekly Study Hours",
  ylab = "Examination Score",
  pch = 19,
  col = "darkblue"
)


# ====================================================================
# Code example 10
# ====================================================================
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


# ====================================================================
# Code example 11
# ====================================================================
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


# ====================================================================
# Code example 12
# ====================================================================
counts <- table(students$programme)
proportions(counts)
100 * proportions(counts)


# ====================================================================
# Code example 13
# ====================================================================
mean(students$score)
median(students$score)


# ====================================================================
# Code example 14
# ====================================================================
quantile(students$score)
IQR(students$score)


# ====================================================================
# Code example 15
# ====================================================================
cor(students$study_hours, students$score)


# ====================================================================
# Code example 16
# ====================================================================
install.packages("ggplot2")


# ====================================================================
# Code example 17
# ====================================================================
library(ggplot2)


# ====================================================================
# Code example 18
# ====================================================================
ggplot(
  data = students,
  mapping = aes(x = study_hours, y = score)
) +
  geom_point()


# ====================================================================
# Code example 19
# ====================================================================
ggplot(
  students,
  aes(x = study_hours, y = score, colour = programme)
) +
  geom_point()


# ====================================================================
# Code example 20
# ====================================================================
# Colour mapped to a variable
ggplot(students, aes(study_hours, score, colour = programme)) +
  geom_point()

# One fixed colour for all points
ggplot(students, aes(study_hours, score)) +
  geom_point(colour = "steelblue")


# ====================================================================
# Code example 21
# ====================================================================
ggplot(students, aes(x = programme)) +
  geom_bar() +
  labs(
    title = "Students by Programme",
    x = "Programme",
    y = "Number of Students"
  )


# ====================================================================
# Code example 22
# ====================================================================
programme_summary <- as.data.frame(table(students$programme))
names(programme_summary) <- c("programme", "count")

ggplot(programme_summary, aes(x = programme, y = count)) +
  geom_col(fill = "steelblue") +
  labs(
    title = "Student Count by Programme",
    x = "Programme",
    y = "Number of Students"
  )


# ====================================================================
# Code example 23
# ====================================================================
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


# ====================================================================
# Code example 24
# ====================================================================
ggplot(students, aes(x = programme, y = score, fill = programme)) +
  geom_boxplot() +
  labs(
    title = "Examination Scores by Programme",
    x = "Programme",
    y = "Score"
  ) +
  guides(fill = "none")


# ====================================================================
# Code example 25
# ====================================================================
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


# ====================================================================
# Code example 26
# ====================================================================
ggplot(students, aes(x = study_hours, y = score)) +
  geom_point(size = 3) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Relationship Between Study Hours and Scores",
    x = "Weekly Study Hours",
    y = "Examination Score"
  )


# ====================================================================
# Code example 27
# ====================================================================
ggplot(semester_data, aes(x = semester, y = enrolment)) +
  geom_line(linewidth = 1) +
  geom_point(size = 2) +
  labs(
    title = "Student Enrolment Across Semesters",
    x = "Semester",
    y = "Number of Students"
  )


# ====================================================================
# Code example 28
# ====================================================================
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  labs(
    title = "Study Time and Examination Performance",
    subtitle = "Illustrative departmental student dataset",
    x = "Weekly study hours",
    y = "Examination score (out of 100)",
    caption = "Source: DTS 211 teaching dataset"
  )


# ====================================================================
# Code example 29
# ====================================================================
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  theme_minimal()


# ====================================================================
# Code example 30
# ====================================================================
theme_classic()
theme_bw()
theme_light()


# ====================================================================
# Code example 31
# ====================================================================
ggplot(students, aes(x = programme)) +
  geom_bar() +
  theme(
    axis.text.x = element_text(angle = 30, hjust = 1)
  )


# ====================================================================
# Code example 32
# ====================================================================
ggplot(students, aes(study_hours, score)) +
  geom_point() +
  facet_wrap(~ programme) +
  labs(
    title = "Study Hours and Scores by Programme",
    x = "Weekly Study Hours",
    y = "Score"
  )


# ====================================================================
# Code example 33
# ====================================================================
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


# ====================================================================
# Code example 34
# ====================================================================
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


# ====================================================================
# Code example 35
# ====================================================================
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


# ====================================================================
# Code example 36
# ====================================================================
str(students)
summary(students)
sum(is.na(students$score))
range(students$score, na.rm = TRUE)


# ====================================================================
# Code example 37
# ====================================================================
head(students)
str(students)
summary(students)


# ====================================================================
# Code example 38
# ====================================================================
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
