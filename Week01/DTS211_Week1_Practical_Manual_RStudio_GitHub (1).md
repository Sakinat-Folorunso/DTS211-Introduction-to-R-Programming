# DTS 211 — Introduction to R Programming
## Week 1 Practical Manual: Getting Started with RStudio and Posit Cloud

**Department of Computer Science, Olabisi Onabanjo University**

---

## 1. Week 1 Focus

### Guiding Question

> **What is R, why do data scientists use it, and how do I work in RStudio?**

This practical manual is designed for students who may be using RStudio for the first time. You will install the software, create an RStudio Project, learn the RStudio interface, write your first R code, analyse a small dataset, create a plot, and complete an independent mini-analysis.

### By the end of this practical, you should be able to:

- explain what R is and why it is useful in data science;
- distinguish between R, RStudio and Posit Cloud;
- use Posit Cloud as a browser-based alternative to RStudio Desktop;
- install R and RStudio;
- create and organise an RStudio Project;
- identify the main RStudio interface areas;
- use the Console to run R commands;
- create and save an R script;
- run code from the Source/Script Editor;
- create and inspect a simple set of scores;
- calculate basic statistics;
- create a simple bar plot;
- recognise and correct common beginner errors;
- save and organise your Week 1 work.

---

# 2. Before You Start

You need:

- a laptop or desktop computer;
- internet access for downloading the software;
- permission to install software on your computer;
- R;
- RStudio Desktop **if you are working locally**.
- a modern web browser and reliable internet access **if you are using Posit Cloud**.

> **You do not need to install R or RStudio Desktop locally when using Posit Cloud.** Posit Cloud provides an RStudio environment in your browser.

### Important distinction

| Tool | What it is |
|---|---|
| **R** | Programming language and computing environment |
| **RStudio** | Integrated Development Environment (IDE) for working with R |
| **Posit Cloud** | Browser-based environment for working with R/RStudio |

For this course, **RStudio Desktop is our primary working environment**.

---

# 3. Download and Install R

## Step 1 — Download R

Go to the official R/CRAN website:

**https://cran.r-project.org/**

Choose the download appropriate for your operating system.

### Windows

Select:

**Download R for Windows → base**

Download the current installer.

### macOS

Select:

**Download R for macOS**

Choose the appropriate installer.

### Linux

Select:

**Download R for Linux**

Choose the appropriate distribution instructions.

> **Important:** Download R from the official R/CRAN source rather than an unofficial software website.

---

# 4. Install R

Open the installer you downloaded.

Follow the installation wizard and accept the standard/default options unless your lecturer instructs you otherwise.

After installation, R should be available on your computer.

You do not need to spend much time working in the basic R interface because this course will use RStudio Desktop.

---

# 5. Download and Install RStudio

Go to:

**https://posit.co/downloads/**

Choose:

> **RStudio Desktop**

Download the installer for your operating system.

Install RStudio using the standard installation options.

### Important order

Install:

**1. R**

then

**2. RStudio**

RStudio is the IDE; R is the environment that executes the R code.

---

# 6. Posit Cloud — Browser-Based Alternative

If you cannot install R and RStudio Desktop on your computer, or if you prefer to work from a browser, you can use **Posit Cloud**.

Posit Cloud provides an RStudio IDE environment in your web browser. Your RStudio project, scripts, packages and data can be worked with in the cloud, so you do not need a local installation of RStudio Desktop for this option.

### Important course arrangement

For DTS 211: **RStudio Desktop is the primary working environment, while Posit Cloud is the browser-based alternative.**

You do **not** need to learn two different versions of R. The same R commands and the same Week 1 `.R` practical can be used in both environments.

Think of the two options as: 

```text
                 DTS 211 — INTRODUCTION TO R
                              |
                 +------------+------------+
                 |                         |
          RStudio Desktop             Posit Cloud
          Local computer             Web browser
                 |                         |
                 +------------+------------+
                              |
                         Same R code
                         Same practical
                         Same learning goals
```

## What you need for Posit Cloud

You need:

- a computer, tablet or other supported device with a modern web browser;
- reliable internet access;
- a Posit Cloud account.

You do **not** need to install R or RStudio Desktop locally to use this option.

## Step 1 — Open Posit Cloud

Go to:

**https://posit.cloud/**

You can sign up for a free account to get started.

Follow the account creation instructions on the Posit Cloud website. You may use the sign-in options provided by Posit Cloud, including supported account sign-in methods.

## Step 2 — Create a New RStudio Project

After signing in:

1. Open your Posit Cloud workspace.
2. Select **New Project**.
3. Choose **New RStudio Project**.
4. Give the project a meaningful name, for example:

```text
DTS211
```

A cloud-based RStudio IDE will open in your browser.

### What you should recognise

The cloud RStudio project is designed to work like the RStudio project you use on your computer. You should still be able to identify the familiar areas:

- Source/Script Editor;
- Console;
- Environment;
- Files;
- Plots;
- Packages.

The main difference is **where the computing environment is running**:

| RStudio Desktop | Posit Cloud |
|---|---|
| Runs on your computer | Runs in the cloud/browser |
| Uses your local R installation | Provides the R environment in the cloud |
| Files are stored locally unless you sync/share them | Project files are stored in the cloud project |
| Can work without internet after setup, depending on the task | Requires internet access |
| Primary DTS 211 environment | Alternative DTS 211 environment |

## Step 3 — Work From the DTS 211 GitHub Repository

The DTS 211 course materials are maintained in the course GitHub repository:

**https://github.com/Sakinat-Folorunso/DTS211-Introduction-to-R-Programming**

Posit Cloud can create an RStudio project from an existing Git repository. This means you can bring the course materials into your cloud workspace rather than manually downloading every file.

### Create a project from the DTS 211 GitHub repository

In Posit Cloud:

1. Select **New Project**.
2. Choose **New Project from Git Repo**.
3. Enter the HTTPS URL of the DTS 211 GitHub repository:

```text
https://github.com/Sakinat-Folorunso/DTS211-Introduction-to-R-Programming.git
```

4. Follow the prompts to create the project.
5. Once the project opens, locate the `Week01` folder.
6. Open:

```text
Week01/
```

7. Open the Week 1 practical R script:

```text
DTS211_Week1_Practical_RStudio.R
```

8. Work through the practical in the same order as students using RStudio Desktop.

> **Git/GitHub note:** Posit Cloud may ask for Git credentials when creating a project from a Git repository. Follow the current GitHub/Posit prompts if authentication is requested. Do not share your GitHub password or personal access token with another person.

## Step 4 — If You Do Not Want to Import the Whole Repository

You can also create a new RStudio project in Posit Cloud and upload the Week 1 files into the project.

For example, upload:

```text
DTS211_Week1_Practical_Manual_RStudio.md
DTS211_Week1_Practical_RStudio.R
```

Then open the `.R` file in the Source/Script Editor and work through the practical.

However, using **New Project from Git Repo** is recommended when you want your cloud project to start from the course repository and make it easier to access future course materials.

## Step 5 — Create Your Week 1 Work

Once the DTS 211 project is open in Posit Cloud, create or use the Week 1 folder:

```text
DTS211/
│
├── Week01/
│   ├── DTS211_Week1_Practical_RStudio.md
│   ├── DTS211_Week1_Practical_RStudio.R
│   └── My_Week1_Assignment.R
```

If you are using the GitHub repository directly, the course files may already be available. Add your personal assignment file as required.

## Step 6 — Run the Same R Code

The commands in this practical do not need to be rewritten for Posit Cloud. For example:

```r
scores <- c(60, 72, 55, 81, 67)
mean(scores)
barplot(scores)
```

The same code can be run in:

- RStudio Desktop; or
- the RStudio IDE inside Posit Cloud.

## Posit Cloud and GitHub — Understand the Difference

Do not confuse the two services:

| Tool | Role in DTS 211 |
|---|---|
| **GitHub** | Stores and organises the course materials, scripts, documentation and version history |
| **RStudio Desktop** | Primary environment for writing and running R locally |
| **Posit Cloud** | Browser-based alternative environment for writing and running R |

A useful mental model is:

```text
                         GITHUB
                           |
                Course materials & scripts
                           |
              +------------+------------+
              |                         |
       RStudio Desktop             Posit Cloud
          (local)                    (cloud)
              |                         |
              +------------+------------+
                           |
                       R analysis
```

## Important: Posit Cloud Is Not a Second Curriculum

You are **not** expected to complete one Week 1 practical for RStudio Desktop and another different practical for Posit Cloud.

There is one Week 1 practical.

You simply choose the environment that is available to you:

### Option A — RStudio Desktop

Use this if you can install R and RStudio on your computer.

### Option B — Posit Cloud

Use this if you prefer a browser-based environment or cannot install the software locally.

Both options support the same Week 1 learning activities.

## Posit Cloud Troubleshooting

### The project does not open

Check:

- your internet connection;
- that you are signed in to Posit Cloud;
- whether the project is still starting up.

If a cloud project becomes unresponsive, try relaunching the project from its project menu.

### The GitHub repository cannot be imported

Check:

- that you entered the repository URL correctly;
- that you used the HTTPS repository URL;
- whether Git credentials are required;
- that the repository is accessible.

### My files are not where I expect them to be

Use the **Files** pane to navigate through the cloud project. Remember that a Posit Cloud project is separate from folders on your personal computer.

### I changed computers

If you continue using the same Posit Cloud project, you can sign in from another computer and continue working from the browser, provided you have internet access and the appropriate project access.

### My code works on one computer but not in Posit Cloud

Check:

1. the R version;
2. the packages required by your code;
3. the file paths in your code;
4. whether the required data files have been uploaded to the project.

Avoid using absolute local paths such as:

```r
read.csv("C:/Users/MyName/Documents/DTS211/Data/file.csv")
```

Instead, as you progress through the course, learn to use project-relative file paths and organised project folders.

## Posit Cloud Safety and Good Practice

- Use your own student account.
- Do not share your account password.
- Do not upload confidential, private or sensitive data to a cloud project unless your lecturer has explicitly approved it and the appropriate data-protection requirements have been considered.
- Keep your work organised by week.
- Save important work regularly and maintain the course repository structure.
- When using GitHub, do not commit passwords, API keys, personal access tokens or other secrets.

> **Course rule:** Whether you use RStudio Desktop or Posit Cloud, your code should remain understandable, reproducible and properly documented.

---

# 7. Create Your DTS 211 RStudio Project

This is an important part of Week 1.

Instead of keeping your R files scattered across Downloads, Desktop and other folders, we will use an **RStudio Project** to organise our course work.

## Why use an RStudio Project?

A project gives your course work a clear home.

It helps RStudio keep track of:

- your working directory;
- your scripts;
- your data;
- your plots;
- your project files.

### Recommended course structure

Create a main folder called:

```text
DTS211
```

Inside it, your work can eventually be organised as:

```text
DTS211/
│
├── DTS211.Rproj
│
├── Week1/
│   ├── DTS211_Week1_Practical.R
│   └── My_Week1_Assignment.R
│
├── Week2/
│
├── Week3/
│
├── Week4/
│
└── Data/
```

You do not need to create all the folders now. We are establishing the project first.

---

## Step-by-step: Create the Project

Open RStudio.

From the top menu select:

**File → New Project...**

You will see project options.

Select:

**New Directory**

Then select:

**New Project**

For the directory name, enter:

```text
DTS211
```

Choose a suitable location on your computer, such as:

- Documents
- Desktop
- your university coursework folder

Then select:

**Create Project**

RStudio will create a project file similar to:

```text
DTS211.Rproj
```

### What has happened?

RStudio has created a dedicated workspace for your DTS 211 course.

You should now see the project name in RStudio.

---

# 8. Create the Week 1 Folder

In RStudio, use the **Files** pane.

Create a folder called:

```text
Week1
```

Your project should now contain:

```text
DTS211/
│
├── DTS211.Rproj
│
└── Week1/
```

You can create additional folders later as the course grows.

---

# 9. Put the Week 1 Practical Script in the Project

Download the Week 1 R script provided by your lecturer:

```text
DTS211_Week1_Practical_RStudio.R
```

Move or copy the file into:

```text
DTS211/Week1/
```

Then open it from RStudio.

You can do this using:

**File → Open File...**

or from the **Files** pane.

### Recommended student workflow

```text
Download practical
       ↓
Save/copy into Week1
       ↓
Open in RStudio
       ↓
Read the instructions
       ↓
Run examples
       ↓
Complete exercises
       ↓
Save your work
```

---

# 10. Your RStudio Interface

When your project is open, identify these areas.

| Area | Main purpose |
|---|---|
| **Source** | Write and edit scripts |
| **Console** | Execute R commands interactively |
| **Environment** | View objects created in your session |
| **Files** | Navigate your project files |
| **Plots** | View graphs |
| **Packages** | View and manage R packages |

Your screen may be arranged differently depending on your RStudio version and screen size.

---

# 11. Your RStudio Mental Model

Think of RStudio as a laboratory:

```text
                     RSTUDIO
                        |
          +-------------+-------------+
          |                           |
      WRITE CODE                  RUN CODE
          |                           |
       SOURCE                      CONSOLE
          |                           |
          +-------------+-------------+
                        |
                      RESULTS
             /          |          \
       ENVIRONMENT     PLOTS       FILES
```

A useful workflow is:

> **Think → Write → Run → Inspect → Interpret → Save**

---

# 12. Your First R Command

Find the **Console**.

You should see:

```text
>
```

The `>` prompt means that R is ready for your instruction.

Type:

```r
2 + 3
```

Press **Enter**.

You should obtain:

```text
[1] 5
```

You have just executed your first R command.

---

# 13. Explore R as a Calculator

R can perform ordinary mathematical operations.

| Operation | R operator |
|---|---|
| Addition | `+` |
| Subtraction | `-` |
| Multiplication | `*` |
| Division | `/` |
| Power | `^` |

Try:

```r
10 + 5
```

```r
20 - 7
```

```r
6 * 4
```

```r
20 / 5
```

```r
2^3
```

---

# 14. Do It Yourself 1 — Calculator Challenge

Write R commands to calculate:

1. `25 + 17`
2. `100 - 37`
3. `12 * 8`
4. `144 / 12`
5. `5^3`

Then calculate:

```text
((25 + 17) * 2) / 7
```

Do not copy the answers. Write the expressions yourself.

---

# 15. Console vs Script Editor

### Console

Use the Console when you want to:

- test an idea;
- run a quick calculation;
- explore.

### Source/Script Editor

Use the Source pane when you want to:

- write several commands;
- save your work;
- organise your analysis;
- return to the code later;
- share your code.

### Golden rule

> **Experiment in the Console. Save important work in a script.**

---

# 16. Create Your First R Script

If the lecturer has not already provided the Week 1 script:

Go to:

**File → New File → R Script**

Save it inside:

```text
DTS211/Week1/
```

Use:

```text
My_Week1_Work.R
```

### Running code

Place your cursor on a line and press:

**Windows:** `Ctrl + Enter`

**Mac:** `Cmd + Enter`

The code will be sent to the Console.

---

# 17. Your First Script

Try:

```r
2 + 3
10 * 5
100 / 4
```

Run the lines.

Notice that:

- the code remains in the Source pane;
- the results appear in the Console.

This is why scripts are useful.

---

# 18. Comments

A comment begins with:

```r
#
```

Example:

```r
# Calculate the average of five examination scores
(60 + 72 + 55 + 81 + 67) / 5
```

Comments are ignored by R but help humans understand the code.

---

# 19. Do It Yourself 2 — Comment Your Code

Write two calculations.

Add a useful comment above each one.

Your comment should explain **what the calculation is doing**.

---

# 20. Our First Data Problem

Imagine that five students obtained:

| Student | Score |
|---|---:|
| A | 60 |
| B | 72 |
| C | 55 |
| D | 81 |
| E | 67 |

We want to know:

- What is the average?
- What is the total?
- How many scores are there?
- What is the highest score?
- What is the lowest score?
- How many students scored at least 50?
- What percentage scored at least 50?

The mean is:

\[
\bar{x}=\frac{x_1+x_2+\cdots+x_n}{n}
\]

For the five students:

\[
\bar{x}=\frac{60+72+55+81+67}{5}=67
\]

Now let R perform the calculation.

---

# 21. Create the Scores

Run:

```r
scores <- c(60, 72, 55, 81, 67)
```

Then:

```r
scores
```

Look at the **Environment** pane.

You should see:

```text
scores
```

You have created an R object called `scores`.

We will study objects and vectors in greater depth in later weeks.

---

# 22. Calculate the Mean

Run:

```r
mean(scores)
```

Expected result:

```text
67
```

R has reproduced our manual calculation.

---

# 23. Explore the Scores

Run:

```r
sum(scores)
```

```r
length(scores)
```

```r
max(scores)
```

```r
min(scores)
```

You can think of these as:

| Command | Question |
|---|---|
| `sum(scores)` | What is the total? |
| `length(scores)` | How many values are there? |
| `max(scores)` | What is the largest value? |
| `min(scores)` | What is the smallest value? |
| `mean(scores)` | What is the average? |

---

# 24. Do It Yourself 3 — Investigate the Scores

Using R, determine:

1. total;
2. number of scores;
3. average;
4. highest score;
5. lowest score.

Write the command you used for each question in your notes.

---

# 25. Work With a Condition

Suppose we want to know which students scored at least 50.

Run:

```r
scores >= 50
```

R returns logical results.

- `TRUE` means the condition is satisfied.
- `FALSE` means the condition is not satisfied.

Now count the students:

```r
sum(scores >= 50)
```

Calculate the percentage:

```r
sum(scores >= 50) / length(scores) * 100
```

The mathematical idea is:

\[
Percentage=\frac{k}{n}\times100
\]

---

# 26. Do It Yourself 4 — Change the Data

Create:

```r
new_scores <- c(45, 52, 68, 39, 77)
```

Find:

1. the mean;
2. the number scoring at least 50;
3. the percentage scoring at least 50.

Try to write the commands yourself before looking back at the examples.

---

# 27. Compare Two Groups

Create:

```r
group_A <- c(60, 72, 55, 81, 67)
group_B <- c(45, 52, 68, 39, 77)
```

Calculate:

```r
mean(group_A)
```

and:

```r
mean(group_B)
```

### Think and discuss

With a partner:

1. What is the average of each group?
2. What evidence does R provide?
3. Is an average enough to describe a group completely?

> R provides evidence. **You provide the interpretation.**

---

# 28. Create Your First Plot

Run:

```r
barplot(
  scores,
  names.arg = c("A", "B", "C", "D", "E"),
  main = "Student Examination Scores",
  xlab = "Student",
  ylab = "Score"
)
```

Look at the **Plots** pane.

Discuss:

1. Which student has the highest score?
2. Which student has the lowest score?
3. How many students scored above 70?
4. Does the graph make the pattern easier to see?

---

# 29. Do It Yourself 5 — Create Your Own Plot

Create:

```r
my_scores <- c(55, 63, 48, 91, 74)
```

First try:

```r
barplot(my_scores)
```

Now improve the plot.

Your final plot should have:

- a meaningful title;
- an x-axis label;
- a y-axis label;
- labels `S1`, `S2`, `S3`, `S4`, `S5`.

---

# 30. Explore the Files Pane

Open the **Files** pane.

Your project should eventually become organised around the course project.

For example:

```text
DTS211/
│
├── DTS211.Rproj
│
├── Week1/
│   ├── DTS211_Week1_Practical.R
│   └── My_Week1_Assignment.R
│
├── Week2/
│
└── Data/
```

The purpose is not to create many folders for their own sake.

The purpose is to know **where your work lives**.

---

# 31. Explore the Packages Pane

Open the **Packages** pane.

R packages provide additional tools.

Later in this course you may use packages such as:

```text
ggplot2
dplyr
tidyr
readr
```

For Week 1, simply locate the Packages pane and understand its purpose.

Do not install large numbers of packages unnecessarily.

---

# 32. Debugging — Errors Are Information

Programming involves mistakes.

An error does not mean that you have failed.

It gives you information about what R could not understand or execute.

Try:

```r
Mean(scores)
```

You may receive an error because R is case-sensitive.

Correct it:

```r
mean(scores)
```

Now try:

```r
mean(score)
```

If you created `scores` but not `score`, R cannot find `score`.

Correct it:

```r
mean(scores)
```

---

# 33. Do It Yourself 6 — Debug the Code

Correct each of these:

### A

```r
Mean(scores)
```

### B

```r
mean(score)
```

### C

```r
mean scores
```

### D

```r
scores <- c(60, 72, 55, 81, 67
```

For each:

1. Run it.
2. Read the error.
3. Identify the problem.
4. Correct it.
5. Run the corrected version.

---

# 34. Pair Programming Challenge

Work in pairs.

### Student A — Driver

Controls the keyboard.

### Student B — Navigator

Reads the question, predicts what should happen, and watches for errors.

Switch roles after five minutes.

Create:

```r
attendance <- c(80, 75, 92, 68, 88, 95, 71)
```

Find:

- number of students;
- average attendance;
- highest attendance;
- lowest attendance;
- number with attendance at least 75%;
- percentage with attendance at least 75%.

Then create a bar chart.

Before writing each command, ask:

> **What question are we trying to answer?**

---

# 35. Independent Challenge — No Copying

Create:

```r
marks <- c(45, 67, 72, 38, 81, 59, 90, 64)
```

Without copying the complete solutions from earlier examples, find:

1. number of marks;
2. total;
3. average;
4. highest mark;
5. lowest mark;
6. number scoring at least 50;
7. percentage scoring at least 50;
8. a bar plot;
9. a meaningful title;
10. a two-sentence interpretation.

The goal is not to memorise commands.

The goal is to translate a question into a computational instruction.

---

# 36. Week 1 Mini Data Investigation

Use:

```r
scores <- c(60, 72, 55, 81, 67)
```

Your lecturer asks:

> "Give me a quick summary of the students' performance."

Use this workflow:

```text
QUESTION
   ↓
DATA
   ↓
CALCULATE
   ↓
VISUALISE
   ↓
INTERPRET
```

Report:

**Mean:** __________________

**Highest:** __________________

**Lowest:** __________________

**Number scoring ≥ 60:** __________________

**Percentage scoring ≥ 60:** __________________

**Interpretation:**

__________________________________________________

__________________________________________________

---

# 37. Week 1 Assignment — My First R Analysis

Create a new script:

```text
My_Week1_Assignment.R
```

Create your own dataset containing at least **8 numerical observations**.

Possible topics:

- daily study hours;
- quiz scores;
- weekly expenses;
- attendance percentages;
- exercise hours;
- another appropriate numerical dataset.

Use R to determine:

1. number of observations;
2. total;
3. mean;
4. maximum;
5. minimum;
6. a meaningful condition;
7. number meeting the condition;
8. percentage meeting the condition.

Create a bar plot.

Give the plot:

- a meaningful title;
- an x-axis label;
- a y-axis label.

Finally, write a short interpretation.

### Suggested structure

```r
# DTS 211 Week 1 Assignment
# Name:
# Matric Number:
# Date:

# Part A: Data

my_data <- c(
  # at least 8 values
)

# Part B: Analysis

# Number of observations


# Total


# Mean


# Maximum


# Minimum


# Part C: Condition


# Count


# Percentage


# Part D: Visualisation


# Part E: Interpretation
```

---

# 38. Reflection

Complete these statements in your notes:

### Before this practical, I thought R was...

### Now I understand that R is...

### RStudio is...

### The Console is used for...

### The Script Editor is used for...

### The Environment shows...

### The Files pane is used for...

### The Plots pane is used for...

### One thing I can now do independently is...

### One thing I still need to practise is...

---

# 39. Week 1 Exit Checklist

Before leaving the practical, confirm:

- [ ] I can open RStudio.
- [ ] I can create an RStudio Project.
- [ ] I know where my DTS 211 project is stored.
- [ ] I can create a Week1 folder.
- [ ] I can open an `.R` script.
- [ ] I can find the Console.
- [ ] I can find the Source pane.
- [ ] I can create and save an R script.
- [ ] I can run code using `Ctrl + Enter`.
- [ ] I can find an object in Environment.
- [ ] I can find a graph in Plots.
- [ ] I can find files in Files.
- [ ] I can calculate a mean.
- [ ] I can calculate a percentage.
- [ ] I can create a bar plot.
- [ ] I can recognise and correct a simple error.
- [ ] I can explain the difference between R and RStudio.

---

# 40. The Week 1 Workflow

You should now be able to follow this workflow:

```text
OPEN RSTUDIO
      ↓
OPEN DTS211 PROJECT
      ↓
OPEN WEEK1 SCRIPT
      ↓
READ THE QUESTION
      ↓
WRITE / RUN CODE
      ↓
OBSERVE RESULTS
      ↓
CHECK ENVIRONMENT / PLOTS
      ↓
INTERPRET
      ↓
SAVE YOUR WORK
```

Remember:

> **Think → Code → Run → Observe → Correct → Explain**

You are not learning R by memorising commands.

You are learning R by using code to answer questions.

---

## Official Resources

- R Project / CRAN: https://cran.r-project.org/
- Posit Downloads: https://posit.co/downloads/
- RStudio documentation: https://docs.posit.co/ide/user/
- Posit Cloud: https://posit.cloud/
- Posit Cloud documentation: https://docs.posit.co/cloud/
- Posit Cloud — Getting Started: https://docs.posit.co/cloud/get_started/
- Posit Cloud — Code Projects: https://docs.posit.co/cloud/guide/projects/
