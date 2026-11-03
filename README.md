# DTS 211: Introduction to R Programming

[![check-scripts](https://github.com/Sakinat-Folorunso/DTS211-Introduction-to-R-Programming/actions/workflows/check-scripts.yml/badge.svg)](https://github.com/Sakinat-Folorunso/DTS211-Introduction-to-R-Programming/actions/workflows/check-scripts.yml)

Course notes and **student-centred R scripts** for DTS 211, a 200-level undergraduate course in the B.Sc. Data Science programme, Department of Computer Science, Olabisi Onabanjo University (OOU).

**Instructor:** Dr Sakinat Folorunso
Team Lead, Artificial Intelligence Systems Research Group (ARISG)
Olabisi Onabanjo University, Ago-Iwoye, Nigeria
Email: sakinat.folorunso@oouagoiwoye.edu.ng

| | |
|---|---|
| **Course** | DTS 211 Introduction to R Programming |
| **Delivery** | Week 0 (orientation) + 12 teaching weeks; 30 lecture hours + 45 practical hours |
| **Primary platform** | RStudio Desktop (R 4.3 or later recommended; R 4.1.0 is the minimum) |
| **Fallback platform** | Posit Cloud (browser-based RStudio) |

## Start here (students)

### Option A: RStudio Desktop (recommended)

1. Install **R** first, then **RStudio Desktop** (step-by-step instructions are in Week 0 of the [master note](docs/DTS211_Master_Note.md)).
2. On this page choose **Code > Download ZIP**, then unzip it to a short folder such as `Documents/DTS211`. (Or use `git clone`.)
3. Double-click **`DTS211.Rproj`** so that RStudio opens the project folder.
4. In the Console run `source("00_make_data.R")`. It is safe to run more than once.
5. Open `scripts/Week_00_DTS211_setup_check.R` and run it. Fix every line that says **FIX**.
6. Open `scripts/Week_01_DTS211_student.R` and begin.

### Option B: Posit Cloud (only if you cannot install software)

1. Create a free account at <https://posit.cloud/>.
2. Choose **New Project > New Project from Git Repository** and paste this repository's address. (Alternatively create a new RStudio project, upload the downloaded ZIP in the Files pane, and open `DTS211.Rproj`.)
3. Choose R 4.3 or later if the option is offered, then continue from step 4 above.

## How each script works (Predict, Run, Investigate, Modify, Make)

Every weekly script follows the same learning cycle, adapted from the PRIMM approach to teaching programming:

1. **Predict**: write down what you expect R to print.
2. **Run**: run the block (Ctrl+Enter / Cmd+Enter) and compare.
3. **Investigate**: change one value, break the code on purpose, explain what happened.
4. **Modify**: complete the **YOUR TURN** tasks at the end of the script.
5. **Make**: combine the week's skills in a small piece of your own work.

Lines marked `EXPECTED ERROR` or `EXPECTED WARNING` are deliberate teaching examples (wrapped in `try()` where they would stop the script). Any other error means something needs attention.

## Weekly scripts

| Week | Topic | Script |
|---|---|---|
| 0 | Getting ready: platforms, installation, setup check | [`Week_00_DTS211_setup_check.R`](scripts/Week_00_DTS211_setup_check.R) |
| 1 | Understanding R and the RStudio/Posit environment | [`Week_01_DTS211_student.R`](scripts/Week_01_DTS211_student.R) |
| 2 | Evaluation in R and R objects | [`Week_02_DTS211_student.R`](scripts/Week_02_DTS211_student.R) |
| 3 | Vectors, matrices and arrays | [`Week_03_DTS211_student.R`](scripts/Week_03_DTS211_student.R) |
| 4 | Lists, factors, missing values and data frames | [`Week_04_DTS211_student.R`](scripts/Week_04_DTS211_student.R) |
| 5 | Getting data into and out of R | [`Week_05_DTS211_student.R`](scripts/Week_05_DTS211_student.R) |
| 6 | Cleaning and transforming data | [`Week_06_DTS211_student.R`](scripts/Week_06_DTS211_student.R) |
| 7 | Displaying and plotting data | [`Week_07_DTS211_student.R`](scripts/Week_07_DTS211_student.R) |
| 8 | Reading text and external data; dates and times | [`Week_08_DTS211_student.R`](scripts/Week_08_DTS211_student.R) |
| 9 | Control structures and vectorised operations | [`Week_09_DTS211_student.R`](scripts/Week_09_DTS211_student.R) |
| 10 | Functions, scoping rules and looping | [`Week_10_DTS211_student.R`](scripts/Week_10_DTS211_student.R) |
| 11 | Coding standards, debugging and profiling R code | [`Week_11_DTS211_student.R`](scripts/Week_11_DTS211_student.R) |
| 12 | Creating data products using R | [`Week_12_DTS211_student.R`](scripts/Week_12_DTS211_student.R) |

## Repository layout

```text
.
├── DTS211.Rproj          # open this first (sets the working directory)
├── 00_make_data.R        # builds data/ and output/ (run once)
├── scripts/              # Week_00 ... Week_12 student scripts
├── data/                 # small illustrative practice datasets
├── output/               # files written by student code (git-ignored)
├── docs/                 # master note (Markdown and Word) and diagrams
├── tools/run_all_scripts.R   # instructor check: runs every script
└── .github/workflows/    # automatic check on every push
```

## Course notes

The complete course outline and the 12-week teaching note (with Week 0) are in [`docs/DTS211_Master_Note.md`](docs/DTS211_Master_Note.md). A Word copy is in [`docs/DTS211_Master_Note.docx`](docs/DTS211_Master_Note.docx).

## For instructors

- **Check that everything still runs:** `Rscript tools/run_all_scripts.R` (needs `dplyr`, `tidyr`, `ggplot2`, `readxl`, `writexl`, `readr`). The same check runs on GitHub Actions for every push.
- **Datasets** are illustrative and contain no real student records. Names are invented first names.
- **Proposed assessment map** (CA and examination) is included in the course outline for Departmental approval.
- Week 8 reads one web page inside `tryCatch()` so the script still runs without internet access.

## Requirements

- R 4.1.0 or later (native pipe `|>` from Week 6). R 4.3 or later is recommended, because Week 9 uses the R 4.3 behaviour of `&&` with vectors.
- Packages used from Week 5 onward: `readxl`, `writexl`, `readr`, `dplyr`, `tidyr`, `ggplot2`.

## Licence

- **Code** (`scripts/`, `00_make_data.R`, `tools/`): [MIT](LICENSE).
- **Course text, diagrams and datasets** (`docs/`, `data/`): [CC BY-NC-SA 4.0](LICENSE-CONTENT.md).

## How to cite

See [`CITATION.cff`](CITATION.cff), or use GitHub's **Cite this repository** button.

## Questions and corrections

Students: ask in class or your course channel first. Everyone: open an issue using the template in this repository, and include your operating system, `R.version.string` and the exact error message.
