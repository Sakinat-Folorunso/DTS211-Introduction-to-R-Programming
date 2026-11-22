# WEEK 0

**Instructor:** Dr Sakinat Folorunso, Team Lead, Artificial Intelligence Systems Research Group (ARISG), Olabisi Onabanjo University, Ago-Iwoye · sakinat.folorunso@oouagoiwoye.edu.ng

# DTS 211: Introduction to R Programming
## Week 0 — Getting Ready: Platforms, Installation and Your First Check

**Programme:** Department of Computer Science, Olabisi Onabanjo University  
**Course:** DTS 211 — Introduction to R Programming  
**Timing:** before Week 1 (a 60–90 minute supervised laboratory session or guided self-study). Week 0 is orientation; it is **not** counted in the 30 LH + 45 PH of the 12 teaching weeks.  
**Primary environment:** RStudio Desktop (Posit Cloud is the fallback)  
**Student script:** `scripts/Week_00_DTS211_setup_check.R`

---

## 1. Learning outcomes

By the end of Week 0, every student should be able to:

1. Distinguish R, RStudio Desktop, Posit Cloud and an RStudio Project.
2. Install R and RStudio Desktop on their own computer, or open a working Posit Cloud project.
3. Open the `DTS211` RStudio Project and confirm the working directory.
4. Run the setup-check script and interpret its PASS / FIX report.
5. Install the packages used later in the course.
6. Find help when something fails (error message, `getwd()`, `sessionInfo()`, ask early).

## 2. Four names, four jobs

| Name | What it is | Analogy |
|---|---|---|
| **R** | The programming language and the engine that runs your code | The language and the engine |
| **RStudio Desktop** | A free workspace (IDE) for writing and running R code on *your* computer | A well-organised desk |
| **Posit Cloud** | RStudio running in a web browser on Posit's computers | Renting the same desk online |
| **RStudio Project** (`.Rproj`) | A folder that RStudio treats as one piece of work and sets as the working directory | A labelled file box |

R must be installed **before** RStudio Desktop, because RStudio only provides the workspace.

## 3. Which route should I use?

| Question | RStudio Desktop (primary) | Posit Cloud (fallback) |
|---|---|---|
| Works offline after setup? | Yes | No: needs internet throughout |
| Needs installation? | Yes (R + RStudio, about 1 GB of disk space) | No: a modern browser is enough |
| Speed on a weak computer | Depends on your computer | Depends on your internet; free plans have usage limits |
| Your files live… | On your computer (back them up) | In the cloud project |
| Best for | Everyday course work | Students who cannot install software |

**Rule for DTS 211:** use RStudio Desktop wherever you can. Use Posit Cloud only if installation is impossible, and tell your instructor so that your laboratory arrangements can be planned.

## 4. Route A: install R and RStudio Desktop

Do the steps **in this order**. Check your computer's type first (Windows, macOS Intel, macOS Apple silicon, or Linux).

### 4.1 Install R

1. Go to https://cran.r-project.org/ and choose your operating system.
2. **Windows:** choose *base*, download the installer, run it and accept the default options. Rtools is **not** needed for this course.
3. **macOS:** download the `.pkg` that matches your chip (Apple silicon or Intel), open it and follow the prompts.
4. **Linux (Ubuntu/Debian):** `sudo apt install r-base` works, but the packaged version can be old. For R 4.3 or later, follow the CRAN instructions for your distribution.
5. Use **R 4.3 or later** if you can. The course needs at least R 4.1.0 (native pipe `|>`), and Week 9 behaviour of `&&` is the R 4.3.0 behaviour.

### 4.2 Install RStudio Desktop

1. Go to https://posit.co/download/rstudio-desktop/ and download the free **RStudio Desktop** installer for your system.
2. Run the installer with default options and open RStudio.
3. RStudio should find R automatically. If it reports that R cannot be found, install R first (section 4.1) and restart RStudio.

### 4.3 Install on a shared or laboratory computer

- Ask the laboratory technician whether R and RStudio are installed. If they are, you only need your own project folder.
- Save your work on a USB drive or cloud storage you control, not only on the lab machine.

## 5. Route B: Posit Cloud

1. Go to https://posit.cloud/ and create a free account (or sign in).
2. Choose **New Project > New RStudio Project**.
3. In the project's settings, choose **R 4.3 or later** if the option is offered.
4. Get the course files into the project in **one** of two ways:
   - **Upload:** in the **Files** pane, click **Upload**, select the course ZIP (`DTS211_Student_Project.zip`, or the ZIP downloaded from the course GitHub repository) and confirm. RStudio normally unzips it automatically. If it does not, upload the files one folder at a time.
   - **From GitHub:** instead of step 2, choose **New Project > New Project from Git Repository** and paste the course repository address given by your instructor.
5. Open the course folder in the Files pane and click `DTS211.Rproj`.

Things that differ on Posit Cloud: the first package installation is slower, the server clock may be set to UTC (which matters in Week 8), and free accounts have usage limits. Check Posit's current plan limits before you rely on it.

## 6. Set up the DTS 211 project (both routes)

1. Get the course files: on the course GitHub page choose **Code > Download ZIP** (or use the ZIP your instructor gives you), then unzip it to a short, simple path such as `Documents/DTS211` (avoid very long paths, and avoid folders with unusual characters in their names).
2. Double-click `DTS211.Rproj`. RStudio opens with the project folder as the working directory.
3. In the Console type `getwd()`. The path must end in the name of the unzipped course folder.
4. Run `source("00_make_data.R")` once. It creates `data/` and `output/` and writes every practice dataset.

## 7. Run the setup check

Open `scripts/Week_00_DTS211_setup_check.R` and run it from top to bottom (**Source**, or one line at a time). It checks, and prints **PASS** or **FIX** for:

- your R version;
- the project folder and the `data/` and `output/` folders;
- the ability to write and read a file;
- the ability to make and save a plot;
- text encoding (UTF-8);
- the packages used later in the course (it installs missing ones if you set `install_missing <- TRUE`).

Copy the final report into your first script as a comment and keep it. If any line says **FIX**, use the troubleshooting table before Week 1.

## 8. Troubleshooting

| Symptom | Likely cause | What to try |
|---|---|---|
| RStudio says it cannot find R | R is not installed, or was installed after RStudio | Install R, then restart RStudio |
| `getwd()` shows the wrong folder | You opened the `.R` file, not the project | Close RStudio; double-click `DTS211.Rproj` |
| `cannot open file 'data/...'` | `00_make_data.R` has not been run, or wrong working directory | Check `getwd()`, then `source("00_make_data.R")` |
| `package 'xyz' is not available` or installation fails | No internet, firewall, or an old R version | Check connection; update R; try another network; ask for the lab copy |
| Installation fails with a permission or path error | Folder path contains unusual characters, a very long path, or a synchronised (for example OneDrive) folder | Move the project to a short, simple local path |
| Strange characters in output, or the UTF-8 check says FIX | Encoding is not UTF-8 | On Windows use R 4.2 or later; in RStudio set Tools > Global Options > Code > Saving > Default text encoding: UTF-8 |
| Posit Cloud upload did not unzip | Upload method | Upload files individually or use the GitHub link |
| Script stops at the first line | Console is still running something | Press Esc in the Console, then run again |

Always include in any help request: your operating system, the output of `R.version.string`, the exact error message, and what you had just run.

## 9. Low-bandwidth and laboratory plan (for the instructor)

- Place the R and RStudio installers, and a copy of the project zip, on a laboratory server or USB drives before the session.
- Use a supervised session in the computer laboratory so that package installation happens once, on the departmental connection.
- For students without a personal computer, schedule laboratory access and tell them where to save their work.
- Do not assume that every student can use Posit Cloud: it needs a stable connection for the whole session.

## 10. Week 0 checklist (exit ticket)

Students submit a screenshot or pasted text showing:

- [ ] `R.version.string` (R 4.3 or later preferred)
- [ ] `getwd()` ending in the project folder name
- [ ] the final **READY** report from the setup-check script
- [ ] one sentence: *Which route did you use (Desktop or Posit Cloud), and what was the hardest step?*

## 11. Instructor notes

- Run the setup check yourself on the exact laboratory image before the session.
- Pair students who finish early with students who are stuck (peer support is part of the course method).
- Record who is on Posit Cloud so that Week 8 time-zone behaviour and slower installs can be anticipated.
- Keep Week 0 short: the goal is a working environment, not an R lecture.

---
