# DTS 211: Introduction to R Programming

Course materials and R programming examples for DTS 211, a 200-level undergraduate course in the B.Sc. Data Science programme, Department of Computer Science, Olabisi Onabanjo University (OOU).

**Instructor:** Dr Sakinat Folorunso  
Team Lead, Artificial Intelligence Systems Research Group (ARISG)  
Olabisi Onabanjo University, Ago-Iwoye, Nigeria  
Email: [sakinat.folorunso@oouagoiwoye.edu.ng](mailto:sakinat.folorunso@oouagoiwoye.edu.ng)

| | |
|---|---|
| **Course** | DTS 211: Introduction to R Programming |
| **Delivery** | Week 0 orientation + 12 teaching weeks; 30 lecture hours + 45 practical hours |
| **Primary platform** | RStudio Desktop (R 4.3 or later recommended; R 4.1.0 minimum) |
| **Fallback platform** | [Posit Cloud](https://posit.cloud/) |

## Start here (students)

### Course teaching notes

- **[Complete course teaching notes (Word document)](docs/DTS_211_Introduction_to_R_Programming.docx)** — download or open in Microsoft Word or Google Docs.
- **[Complete course teaching notes (Google Docs)](https://docs.google.com/document/d/1-CXjlZcq7hpqBVnBkiahCCmk1LqnzJnUwRzUnyCuYbg/edit?tab=t.h5ncap8bpna0)** — online reading copy. Access depends on the document owner's Google sharing settings.

### Set up R and RStudio

1. Install [R](https://cran.r-project.org/) first.
2. Install [RStudio Desktop](https://posit.co/download/rstudio-desktop/).
3. On this repository page, choose **Code > Download ZIP**, then unzip the folder.
4. Double-click `DTS211.Rproj` to open the project in RStudio.
5. In the Console, run `source("00_make_data.R")`. This creates or refreshes the illustrative practice datasets in `data/` and the `output/` folder. It is safe to run again.
6. Open the `DTS211_R_Code_Bundle` folder and select the relevant weekly R file.

If you cannot install software locally, use [Posit Cloud](https://posit.cloud/) and upload the repository ZIP or create a project from the Git repository URL.

## Weekly R code

The `DTS211_R_Code_Bundle` folder contains R code blocks extracted from the weekly teaching notes. These are instructional examples, not fully integrated standalone weekly practical scripts. Some blocks depend on objects, datasets, or packages introduced elsewhere. Read the comments and run examples in order.

| Week | Topic | R code |
|---|---|---|
| 1 | Introduction to R programming | [Week 1 R examples](DTS211_R_Code_Bundle/Week_01_DTS211.R) |
| 2 | Evaluation in R and R objects | [Week 2 R examples](DTS211_R_Code_Bundle/Week_02_DTS211.R) |
| 3 | Vectors, matrices and arrays | [Week 3 R examples](DTS211_R_Code_Bundle/Week_03_DTS211.R) |
| 4 | Lists, factors, missing values and data frames | [Week 4 R examples](DTS211_R_Code_Bundle/Week_04_DTS211.R) |
| 5 | Getting data into and out of R | [Week 5 R examples](DTS211_R_Code_Bundle/Week_05_DTS211.R) |
| 6 | Cleaning and transforming data | [Week 6 R examples](DTS211_R_Code_Bundle/Week_06_DTS211.R) |
| 7 | Displaying and plotting data | [Week 7 R examples](DTS211_R_Code_Bundle/Week_07_DTS211.R) |
| 8 | Reading text and external data; dates and times | [Week 8 R examples](DTS211_R_Code_Bundle/Week_08_DTS211.R) |
| 9 | Control structures and vectorised operations | [Week 9 R examples](DTS211_R_Code_Bundle/Week_09_DTS211.R) |
| 10 | Functions, scoping rules and looping | [Week 10 R examples](DTS211_R_Code_Bundle/Week_10_DTS211.R) |
| 11 | Coding standards, debugging and profiling R code | [Week 11 R examples](DTS211_R_Code_Bundle/Week_11_DTS211.R) |
| 12 | Creating data products using R | [Week 12 R examples](DTS211_R_Code_Bundle/Week_12_DTS211.R) |

For details about the extracted code blocks, see the [R code bundle guide](DTS211_R_Code_Bundle/README.md).

## Repository layout

```text
.
├── DTS211.Rproj
├── 00_make_data.R
├── DTS211_R_Code_Bundle/   # weekly R examples and bundle guide
├── data/                   # illustrative practice datasets
├── docs/                   # complete course note and visual assets
├── tools/                  # instructor utility scripts
├── CITATION.cff
├── LICENSE
└── LICENSE-CONTENT.md
```

## For instructors

- The [data-generation script](00_make_data.R) creates illustrative practice datasets. It is safe to rerun.
- The [instructor utility](tools/run_all_scripts.R) is included in the repository. Check its comments and required packages before running it; it is not a substitute for testing each teaching example in the classroom.
- The datasets are illustrative and should not be interpreted as real student records.
- The proposed assessment map is included in the course teaching materials and remains subject to departmental approval.

## Requirements

- R 4.1.0 or later; R 4.3 or later is recommended.
- Some examples use packages such as `readxl`, `writexl`, `readr`, `dplyr`, `tidyr`, and `ggplot2`. Install a package before running examples that require it, for example `install.packages("ggplot2")`.

## Licence

- **Code:** [MIT Licence](LICENSE).
- **Course text, diagrams and datasets:** [CC BY-NC-SA 4.0](LICENSE-CONTENT.md).

## How to cite

See [CITATION.cff](CITATION.cff), or use GitHub's **Cite this repository** button.

## Questions and corrections

Students: ask in class or your course channel first. For corrections, open an issue in the repository and include your operating system, `R.version.string`, and the exact error message.
