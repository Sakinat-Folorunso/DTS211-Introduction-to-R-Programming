# DTS 211 — Week 6 R Code Collection
# Extracted from: DTS211_Week6_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
students <- read.csv(
  "data/students_raw.csv",
  na.strings = c("", "NA")
)


# ====================================================================
# Code example 2
# ====================================================================
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)


# ====================================================================
# Code example 3
# ====================================================================
sapply(students, class)
sapply(students, typeof)


# ====================================================================
# Code example 4
# ====================================================================
is.na(students)
anyNA(students)
colSums(is.na(students))
colMeans(is.na(students)) * 100


# ====================================================================
# Code example 5
# ====================================================================
unique(students$programme)
table(students$programme, useNA = "ifany")


# ====================================================================
# Code example 6
# ====================================================================
range(students$age, na.rm = TRUE)
range(students$score, na.rm = TRUE)
summary(students$age)
summary(students$score)


# ====================================================================
# Code example 7
# ====================================================================
students_raw <- read.csv(
  "data/students_raw.csv",
  na.strings = c("", "NA")
)

students_clean <- students_raw


# ====================================================================
# Code example 8
# ====================================================================
dim(students_raw)
dim(students_clean)

names(students_raw)
names(students_clean)


# ====================================================================
# Code example 9
# ====================================================================
programme <- c(
  "Computer Science",
  " Statistics",
  "Mathematics ",
  "Computer Science "
)

programme


# ====================================================================
# Code example 10
# ====================================================================
programme_clean <- trimws(programme)
programme_clean


# ====================================================================
# Code example 11
# ====================================================================
students_clean$programme <- trimws(students_clean$programme)


# ====================================================================
# Code example 12
# ====================================================================
"Statistics" == "statistics"


# ====================================================================
# Code example 13
# ====================================================================
tolower(c("Computer Science", "STATISTICS", "Mathematics"))
toupper(c("Computer Science", "statistics", "Mathematics"))


# ====================================================================
# Code example 14
# ====================================================================
students_clean$programme <- tolower(
  trimws(students_clean$programme)
)


# ====================================================================
# Code example 15
# ====================================================================
students_clean$programme[
  students_clean$programme == "Comp. Science"
] <- "Computer Science"


# ====================================================================
# Code example 16
# ====================================================================
# install.packages("dplyr")  # Run once if needed
library(dplyr)

students_clean <- students_clean |>
  mutate(
    programme = recode(
      programme,
      "Comp. Science" = "Computer Science",
      "computer science" = "Computer Science"
    )
  )


# ====================================================================
# Code example 17
# ====================================================================
students_clean <- students_clean |>
  mutate(
    programme = trimws(programme),
    programme = tolower(programme)
  )


# ====================================================================
# Code example 18
# ====================================================================
unique(students_clean$programme)
table(students_clean$programme, useNA = "ifany")


# ====================================================================
# Code example 19
# ====================================================================
students_clean$score <- as.numeric(
  trimws(students_clean$score)
)


# ====================================================================
# Code example 20
# ====================================================================
str(students_clean$score)
unique(students_clean$score)


# ====================================================================
# Code example 21
# ====================================================================
students_clean$programme <- factor(
  students_clean$programme
)


# ====================================================================
# Code example 22
# ====================================================================
students_clean$study_mode <- factor(
  students_clean$study_mode,
  levels = c("Full-time", "Part-time")
)


# ====================================================================
# Code example 23
# ====================================================================
table(students_clean$study_mode, useNA = "ifany")


# ====================================================================
# Code example 24
# ====================================================================
student_id <- c("001", "002", "003")


# ====================================================================
# Code example 25
# ====================================================================
registered <- c("Yes", "No", "Yes", "No")


# ====================================================================
# Code example 26
# ====================================================================
registered_logical <- registered == "Yes"
registered_logical


# ====================================================================
# Code example 27
# ====================================================================
sum(is.na(students_clean))
colSums(is.na(students_clean))


# ====================================================================
# Code example 28
# ====================================================================
incomplete_rows <- students_clean[
  !complete.cases(students_clean),
]

incomplete_rows


# ====================================================================
# Code example 29
# ====================================================================
students_complete <- students_clean[
  complete.cases(students_clean),
]


# ====================================================================
# Code example 30
# ====================================================================
students_with_scores <- students_clean[
  !is.na(students_clean$score),
]


# ====================================================================
# Code example 31
# ====================================================================
# Do not do this without a defensible reason:
students_clean$score[is.na(students_clean$score)] <- 0


# ====================================================================
# Code example 32
# ====================================================================
duplicated(students_clean)
sum(duplicated(students_clean))


# ====================================================================
# Code example 33
# ====================================================================
students_clean[
  duplicated(students_clean),
]


# ====================================================================
# Code example 34
# ====================================================================
students_unique <- students_clean[
  !duplicated(students_clean),
]


# ====================================================================
# Code example 35
# ====================================================================
duplicated(students_clean$student_id)
sum(duplicated(students_clean$student_id))


# ====================================================================
# Code example 36
# ====================================================================
students_clean[
  duplicated(students_clean$student_id) |
    duplicated(students_clean$student_id, fromLast = TRUE),
]


# ====================================================================
# Code example 37
# ====================================================================
students_one_per_id <- students_clean[
  !duplicated(students_clean$student_id),
]


# ====================================================================
# Code example 38
# ====================================================================
students_clean$score < 0 |
  students_clean$score > 100


# ====================================================================
# Code example 39
# ====================================================================
invalid_scores <- students_clean[
  !is.na(students_clean$score) &
    (students_clean$score < 0 | students_clean$score > 100),
]

invalid_scores


# ====================================================================
# Code example 40
# ====================================================================
invalid_ages <- students_clean[
  !is.na(students_clean$age) &
    (students_clean$age < 15 | students_clean$age > 100),
]


# ====================================================================
# Code example 41
# ====================================================================
students_clean <- students_clean |>
  mutate(
    score_out_of_range = !is.na(score) &
      (score < 0 | score > 100)
  )


# ====================================================================
# Code example 42
# ====================================================================
students_clean <- students_clean |>
  mutate(
    pass_status = case_when(
      is.na(score) ~ NA_character_,
      score >= 50 ~ "Pass",
      score < 50 ~ "Not yet passed"
    )
  )


# ====================================================================
# Code example 43
# ====================================================================
students_clean <- students_clean |>
  mutate(
    age_group = case_when(
      age < 20 ~ "Under 20",
      age >= 20 & age < 25 ~ "20–24",
      age >= 25 ~ "25 and above",
      TRUE ~ NA_character_
    )
  )


# ====================================================================
# Code example 44
# ====================================================================
students_clean <- students_clean |>
  mutate(
    study_mode = recode(
      study_mode,
      "FT" = "Full-time",
      "PT" = "Part-time"
    )
  )


# ====================================================================
# Code example 45
# ====================================================================
names(students_clean)
names(students_clean)[names(students_clean) == "Student Name"] <- "student_name"


# ====================================================================
# Code example 46
# ====================================================================
students_clean <- students_clean |>
  rename(
    student_name = name,
    assessment_score = score
  )


# ====================================================================
# Code example 47
# ====================================================================
students_selected <- students_clean[
  ,
  c("student_id", "programme", "score")
]


# ====================================================================
# Code example 48
# ====================================================================
students_selected <- students_clean |>
  select(student_id, programme, score)


# ====================================================================
# Code example 49
# ====================================================================
students_passed <- students_clean[
  !is.na(students_clean$score) &
    students_clean$score >= 50,
]


# ====================================================================
# Code example 50
# ====================================================================
students_passed <- students_clean |>
  filter(!is.na(score), score >= 50)


# ====================================================================
# Code example 51
# ====================================================================
students_sorted <- students_clean |>
  arrange(score)

students_sorted_desc <- students_clean |>
  arrange(desc(score))


# ====================================================================
# Code example 52
# ====================================================================
programme_summary <- students_clean |>
  group_by(programme) |>
  summarise(
    number_of_students = n(),
    mean_score = mean(score, na.rm = TRUE),
    observed_scores = sum(!is.na(score)),
    .groups = "drop"
  )


# ====================================================================
# Code example 53
# ====================================================================
# install.packages("tidyr")  # Run once if needed
library(tidyr)

scores_long <- scores_wide |>
  pivot_longer(
    cols = starts_with("test"),
    names_to = "test",
    values_to = "score"
  )


# ====================================================================
# Code example 54
# ====================================================================
install.packages("dplyr")
install.packages("tidyr")


# ====================================================================
# Code example 55
# ====================================================================
library(dplyr)
library(tidyr)


# ====================================================================
# Code example 56
# ====================================================================
students_clean |>
  filter(!is.na(score)) |>
  select(student_id, programme, score) |>
  arrange(desc(score))


# ====================================================================
# Code example 57
# ====================================================================
analysis_data <- students_clean |>
  mutate(
    programme = trimws(programme)
  ) |>
  filter(!is.na(student_id)) |>
  select(student_id, programme, study_mode, score) |>
  arrange(student_id)


# ====================================================================
# Code example 58
# ====================================================================
students_raw <- data.frame(
  student_id = c(
    "DTS001", "DTS002", "DTS003", "DTS004",
    "DTS005", "DTS006", "DTS006", "DTS008"
  ),
  name = c(
    " Amina", "Bola ", "Chidi", "Dayo",
    "Efe", "Fola", "Fola", "Ganiyu"
  ),
  programme = c(
    "Computer Science", "statistics", "Mathematics ",
    "Comp. Science", "Statistics", "Mathematics",
    "Mathematics", "Computer Science"
  ),
  age = c(21, 22, -3, 23, 21, 22, 22, NA),
  score = c(68, 74, 55, 105, NA, 77, 77, 69),
  study_mode = c(
    "Full-time", "FT", "Part-time", "Full-time",
    "PT", "Full-time", "Full-time", "Part-time"
  ),
  stringsAsFactors = FALSE
)

students_raw
str(students_raw)


# ====================================================================
# Code example 59
# ====================================================================
students_clean <- students_raw


# ====================================================================
# Code example 60
# ====================================================================
dim(students_raw)
colSums(is.na(students_raw))
unique(students_raw$programme)
unique(students_raw$study_mode)
duplicated(students_raw$student_id)


# ====================================================================
# Code example 61
# ====================================================================
students_clean <- students_clean |>
  mutate(
    name = trimws(name),
    programme = trimws(programme),
    study_mode = trimws(study_mode)
  )


# ====================================================================
# Code example 62
# ====================================================================
students_clean <- students_clean |>
  mutate(
    programme = recode(
      programme,
      "statistics" = "Statistics",
      "Comp. Science" = "Computer Science"
    ),
    study_mode = recode(
      study_mode,
      "FT" = "Full-time",
      "PT" = "Part-time"
    )
  )


# ====================================================================
# Code example 63
# ====================================================================
students_clean <- students_clean |>
  mutate(
    age_invalid = !is.na(age) & age < 15,
    score_invalid = !is.na(score) & (score < 0 | score > 100)
  )

students_clean[
  students_clean$age_invalid | students_clean$score_invalid,
]


# ====================================================================
# Code example 64
# ====================================================================
students_clean[
  duplicated(student_id) |
    duplicated(student_id, fromLast = TRUE),
]


# ====================================================================
# Code example 65
# ====================================================================
students_clean <- students_clean |>
  distinct()


# ====================================================================
# Code example 66
# ====================================================================
students_clean <- students_clean |>
  mutate(
    age = ifelse(age_invalid, NA, age),
    score = ifelse(score_invalid, NA, score)
  )


# ====================================================================
# Code example 67
# ====================================================================
str(students_clean)
summary(students_clean)
unique(students_clean$programme)
unique(students_clean$study_mode)
colSums(is.na(students_clean))


# ====================================================================
# Code example 68
# ====================================================================
students_clean <- students_clean |>
  mutate(
    programme = factor(programme),
    study_mode = factor(
      study_mode,
      levels = c("Full-time", "Part-time")
    ),
    pass_status = case_when(
      is.na(score) ~ NA_character_,
      score >= 50 ~ "Pass",
      score < 50 ~ "Not yet passed"
    )
  )


# ====================================================================
# Code example 69
# ====================================================================
students_clean |>
  group_by(programme) |>
  summarise(
    records = n(),
    observed_scores = sum(!is.na(score)),
    mean_score = mean(score, na.rm = TRUE),
    .groups = "drop"
  )


# ====================================================================
# Code example 70
# ====================================================================
dim(students_raw)
dim(students_clean)


# ====================================================================
# Code example 71
# ====================================================================
anyDuplicated(students_clean$student_id)


# ====================================================================
# Code example 72
# ====================================================================
table(students_clean$programme, useNA = "ifany")
table(students_clean$study_mode, useNA = "ifany")


# ====================================================================
# Code example 73
# ====================================================================
range(students_clean$score, na.rm = TRUE)
range(students_clean$age, na.rm = TRUE)


# ====================================================================
# Code example 74
# ====================================================================
colSums(is.na(students_clean))


# ====================================================================
# Code example 75
# ====================================================================
head(students_raw)
head(students_clean)


# ====================================================================
# Code example 76
# ====================================================================
write.csv(
  students_clean,
  "output/students_clean.csv",
  row.names = FALSE,
  na = "NA"
)

saveRDS(
  students_clean,
  "output/students_clean.rds"
)


# ====================================================================
# Code example 77
# ====================================================================
survey_raw <- read.csv(
  "data/student_survey_raw.csv",
  na.strings = c("", "NA")
)

survey_clean <- survey_raw


# ====================================================================
# Code example 78
# ====================================================================
x <- c(" Computer Science", "statistics ", "Mathematics")

trimws(x)
tolower(trimws(x))

values <- c(10, NA, 20, 30)
sum(is.na(values))
mean(values, na.rm = TRUE)

df <- data.frame(
  id = c("A01", "A02", "A02"),
  score = c(70, 80, 80)
)

duplicated(df)
duplicated(df$id)

# Using dplyr
df |>
  mutate(pass = score >= 50) |>
  arrange(desc(score))
