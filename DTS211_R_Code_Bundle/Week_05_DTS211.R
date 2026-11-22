# DTS 211 — Week 5 R Code Collection
# Extracted from: DTS211_Week5_Standard_Class_Note.md
# Code blocks are preserved in source order; consult the weekly note for explanations and context.


# ====================================================================
# Code example 1
# ====================================================================
# Input: read a CSV file into R
students <- read.csv("students.csv")

# Output: write an R data frame to a CSV file
write.csv(students, "students_export.csv", row.names = FALSE)


# ====================================================================
# Code example 2
# ====================================================================
students <- read.csv(
  "C:/Users/Student/Documents/DTS211/students.csv"
)


# ====================================================================
# Code example 3
# ====================================================================
students <- read.csv("data/students.csv")


# ====================================================================
# Code example 4
# ====================================================================
getwd()


# ====================================================================
# Code example 5
# ====================================================================
list.files()


# ====================================================================
# Code example 6
# ====================================================================
list.files("data")


# ====================================================================
# Code example 7
# ====================================================================
setwd("C:/Users/Student/Documents/DTS211_Project")
getwd()


# ====================================================================
# Code example 8
# ====================================================================
students <- read.csv("data/students.csv")

students


# ====================================================================
# Code example 9
# ====================================================================
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)


# ====================================================================
# Code example 10
# ====================================================================
students <- read.csv(
  file = "data/students.csv",
  header = TRUE,
  sep = ",",
  na.strings = c("", "NA", "N/A"),
  stringsAsFactors = FALSE
)


# ====================================================================
# Code example 11
# ====================================================================
measurements <- read.csv(
  "data/measurements_no_header.csv",
  header = FALSE
)

names(measurements) <- c("sample_id", "temperature", "humidity")


# ====================================================================
# Code example 12
# ====================================================================
survey <- read.csv(
  "data/survey.csv",
  na.strings = c("", "NA", "N/A", "999")
)


# ====================================================================
# Code example 13
# ====================================================================
students_tsv <- read.delim(
  "data/students.tsv",
  header = TRUE,
  na.strings = c("", "NA")
)


# ====================================================================
# Code example 14
# ====================================================================
students_tsv <- read.table(
  "data/students.tsv",
  header = TRUE,
  sep = "\t",
  na.strings = c("", "NA")
)


# ====================================================================
# Code example 15
# ====================================================================
data_semicolon <- read.table(
  "data/data_semicolon.txt",
  header = TRUE,
  sep = ";"
)


# ====================================================================
# Code example 16
# ====================================================================
dim(data_imported)
names(data_imported)
head(data_imported)


# ====================================================================
# Code example 17
# ====================================================================
install.packages("readxl")


# ====================================================================
# Code example 18
# ====================================================================
library(readxl)


# ====================================================================
# Code example 19
# ====================================================================
excel_sheets("data/student_records.xlsx")


# ====================================================================
# Code example 20
# ====================================================================
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students"
)

students_excel
str(students_excel)


# ====================================================================
# Code example 21
# ====================================================================
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = 1
)


# ====================================================================
# Code example 22
# ====================================================================
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students",
  skip = 2
)


# ====================================================================
# Code example 23
# ====================================================================
students_excel <- read_excel(
  "data/student_records.xlsx",
  sheet = "Students",
  range = "A3:E20"
)


# ====================================================================
# Code example 24
# ====================================================================
dim(students_excel)
names(students_excel)
str(students_excel)
head(students_excel)


# ====================================================================
# Code example 25
# ====================================================================
write.csv(
  students,
  file = "output/students_export.csv",
  row.names = FALSE
)


# ====================================================================
# Code example 26
# ====================================================================
write.csv(
  students,
  file = "output/students_with_row_names.csv",
  row.names = TRUE
)


# ====================================================================
# Code example 27
# ====================================================================
write.table(
  students,
  file = "output/students_export.tsv",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)


# ====================================================================
# Code example 28
# ====================================================================
install.packages("writexl")


# ====================================================================
# Code example 29
# ====================================================================
library(writexl)


# ====================================================================
# Code example 30
# ====================================================================
write_xlsx(
  students,
  path = "output/students_export.xlsx"
)


# ====================================================================
# Code example 31
# ====================================================================
write_xlsx(
  list(
    Student_Records = students,
    Programme_Summary = programme_summary
  ),
  path = "output/student_report.xlsx"
)


# ====================================================================
# Code example 32
# ====================================================================
saveRDS(students, "output/students.rds")


# ====================================================================
# Code example 33
# ====================================================================
students_restored <- readRDS("output/students.rds")
str(students_restored)


# ====================================================================
# Code example 34
# ====================================================================
programme_summary <- table(students$programme)

save(
  students,
  programme_summary,
  file = "output/week5_objects.RData"
)


# ====================================================================
# Code example 35
# ====================================================================
load("output/week5_objects.RData")


# ====================================================================
# Code example 36
# ====================================================================
write.csv(
  students,
  "output/students_check.csv",
  row.names = FALSE
)

students_check <- read.csv("output/students_check.csv")

dim(students)
dim(students_check)
names(students)
names(students_check)
str(students_check)


# ====================================================================
# Code example 37
# ====================================================================
all.equal(
  as.data.frame(students),
  as.data.frame(students_check),
  check.attributes = FALSE
)


# ====================================================================
# Code example 38
# ====================================================================
saveRDS(students, "output/students_check.rds")
students_rds <- readRDS("output/students_check.rds")

identical(students, students_rds)


# ====================================================================
# Code example 39
# ====================================================================
getwd()
list.files()
dim(imported_data)
names(imported_data)
head(imported_data)
str(imported_data)
summary(imported_data)


# ====================================================================
# Code example 40
# ====================================================================
# DTS 211 — Week 5
# Topic: Getting Data into and out of R

# 1. Identify the project directory
getwd()

# 2. Load required package
# install.packages("readxl")  # Run once if not installed
library(readxl)

# 3. Import data
students <- read.csv(
  "data/students.csv",
  header = TRUE,
  na.strings = c("", "NA")
)

# 4. Inspect imported data
head(students)
dim(students)
names(students)
str(students)
summary(students)

# 5. Export a copy
write.csv(
  students,
  "output/students_export.csv",
  row.names = FALSE
)


# ====================================================================
# Code example 41
# ====================================================================
students_source <- data.frame(
  student_id = c("DTS001", "DTS002", "DTS003", "DTS004", "DTS005", "DTS006"),
  name = c("Amina", "Bola", "Chidi", "Dayo", "Efe", "Fola"),
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

students_source


# ====================================================================
# Code example 42
# ====================================================================
write.csv(
  students_source,
  "students_source.csv",
  row.names = FALSE,
  na = "NA"
)


# ====================================================================
# Code example 43
# ====================================================================
students_imported <- read.csv(
  "students_source.csv",
  header = TRUE,
  na.strings = c("", "NA")
)

students_imported


# ====================================================================
# Code example 44
# ====================================================================
head(students_imported)
dim(students_imported)
names(students_imported)
str(students_imported)
summary(students_imported)


# ====================================================================
# Code example 45
# ====================================================================
write.csv(
  students_imported,
  "students_final_export.csv",
  row.names = FALSE
)


# ====================================================================
# Code example 46
# ====================================================================
students <- read.csv(
  "data/students.csv",
  header = TRUE,
  na.strings = c("", "NA")
)


# ====================================================================
# Code example 47
# ====================================================================
head(students)
tail(students)
dim(students)
names(students)
str(students)
summary(students)


# ====================================================================
# Code example 48
# ====================================================================
students_tab <- read.delim(
  "data/students.tsv",
  header = TRUE,
  na.strings = c("", "NA")
)

str(students_tab)


# ====================================================================
# Code example 49
# ====================================================================
write.csv(
  students,
  "output/students_export.csv",
  row.names = FALSE
)


# ====================================================================
# Code example 50
# ====================================================================
# Install once if necessary:
# install.packages("writexl")

library(writexl)

write_xlsx(
  students,
  "output/students_export.xlsx"
)


# ====================================================================
# Code example 51
# ====================================================================
students_check <- read.csv(
  "output/students_export.csv",
  na.strings = c("", "NA")
)

dim(students_check)
names(students_check)
head(students_check)
str(students_check)


# ====================================================================
# Code example 52
# ====================================================================
saveRDS(students, "output/students.rds")

students_restored <- readRDS("output/students.rds")

identical(students, students_restored)


# ====================================================================
# Code example 53
# ====================================================================
getwd()
list.files()

x <- read.csv("data/students.csv", na.strings = c("", "NA"))
head(x)
dim(x)
str(x)

write.csv(x, "output/students.csv", row.names = FALSE)

saveRDS(x, "output/students.rds")
y <- readRDS("output/students.rds")

identical(x, y)
