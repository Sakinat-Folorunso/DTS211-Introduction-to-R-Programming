# =====================================================================
# DTS 211: Introduction to R Programming     |  WEEK 0 (student script)
# Getting Ready: Setup Check
# ---------------------------------------------------------------------
# Instructor : Dr Sakinat Folorunso
#              Team Lead, Artificial Intelligence Systems Research Group (ARISG)
#              Olabisi Onabanjo University, Ago-Iwoye, Nigeria
# Contact    : sakinat.folorunso@oouagoiwoye.edu.ng
# Platform   : RStudio Desktop (Posit Cloud also works)
# =====================================================================
#
# WHAT THIS SCRIPT DOES
#   It checks that your computer (or Posit Cloud project) is ready for
#   DTS 211 and prints PASS or FIX for each item. Nothing here changes
#   your data. It only creates small test files in output/.
#
# HOW TO USE IT
#   1. Open DTS211.Rproj first (File > Open Project).
#   2. Run the whole script: Source (Ctrl+Shift+S), or one line at a time
#      (Ctrl+Enter / Cmd+Enter).
#   3. Read the report at the end. Fix every FIX before Week 1.
#   4. Copy the final report into a comment in your first script.
# =====================================================================

# ---- 0. SETTINGS you may change ---------------------------------------
install_missing <- TRUE      # TRUE: install any missing course packages
                             # (needs internet; set FALSE to only check)
set.seed(42)

# PREDICT: before you run anything, which of the checks below do you
# think will say FIX on your computer? Write your guess here: ________

# ---- helper: record one check -------------------------------------------
results <- data.frame(check = character(), status = character(), detail = character(),
                      stringsAsFactors = FALSE)
record <- function(check, ok, detail = "") {
  if (ok && grepl("^if FIX", detail)) detail <- ""      # show repair hints only when something failed
  results[nrow(results) + 1, ] <<- c(check, if (ok) "PASS" else "FIX", detail)
  cat(sprintf("[%s] %s %s\n", if (ok) "PASS" else "FIX ", check, if (nzchar(detail)) paste0("- ", detail) else ""))
}

# ---- 1. Which computer am I on? ------------------------------------------
cat("\n--- 1. Your system ---\n")
R.version.string                      # which R?
Sys.info()[["sysname"]]               # Windows, Darwin (macOS) or Linux
Sys.getlocale("LC_CTYPE")             # language/encoding settings
Sys.timezone()                        # your time zone (Posit Cloud is often UTC)
# INVESTIGATE: copy these four lines of output into a comment. You may need them
# if you ask for help.

# ---- 2. R version --------------------------------------------------------
cat("\n--- 2. R version ---\n")
r_ver <- getRversion()
record("R version is 4.1.0 or later (needed for the |> pipe)", r_ver >= "4.1.0",
       paste("you have", as.character(r_ver)))
record("R version is 4.3.0 or later (recommended)", r_ver >= "4.3.0",
       if (r_ver >= "4.3.0") "good" else "please update R if you can")

# ---- 3. Project folder -----------------------------------------------------
cat("\n--- 3. Project folder ---\n")
getwd()                                # PREDICT: should end in your project folder name
record("working directory contains 00_make_data.R", file.exists("00_make_data.R"),
       "if FIX: close RStudio and open DTS211.Rproj")
record("scripts/ folder exists", dir.exists("scripts"),
       "if FIX: unzip the whole project, do not copy single files")

# ---- 4. Create the data and output folders -----------------------------------
cat("\n--- 4. Data and output folders ---\n")
if (file.exists("00_make_data.R") && !dir.exists("data")) {
  source("00_make_data.R")             # builds data/ and output/ once
}
if (!dir.exists("output")) dir.create("output")
record("data/ folder exists", dir.exists("data"))
record("data/students.csv exists", file.exists("data/students.csv"))
record("output/ folder exists", dir.exists("output"))

# ---- 5. Can R write, read and plot? -----------------------------------------
cat("\n--- 5. Write, read and plot ---\n")
test_df <- data.frame(id = 1:3, score = c(70, 85, 92))
ok_write <- tryCatch({ write.csv(test_df, "output/week0_test.csv", row.names = FALSE); TRUE },
                     error = function(e) FALSE, warning = function(w) FALSE)
record("can write a CSV file to output/", ok_write)
back <- if (ok_write) tryCatch(read.csv("output/week0_test.csv"), error = function(e) NULL) else NULL
record("can read the CSV file back", !is.null(back) && identical(dim(back), c(3L, 2L)))

ok_plot <- tryCatch({
  png("output/week0_test_plot.png", width = 600, height = 400)
  plot(test_df$id, test_df$score, type = "b", xlab = "ID", ylab = "Score", main = "Week 0 test plot")
  dev.off()
  file.exists("output/week0_test_plot.png")
}, error = function(e) { try(dev.off(), silent = TRUE); FALSE })
record("can draw a plot and save it as PNG", isTRUE(ok_plot))

# ---- 6. Text encoding ------------------------------------------------------------
cat("\n--- 6. Text encoding ---\n")
utf8_ok <- isTRUE(l10n_info()[["UTF-8"]])
record("R is running in UTF-8 (needed for names such as Yoruba or Igbo text)", utf8_ok,
       if (utf8_ok) "good" else
         "use R 4.2 or later on Windows; in RStudio set Tools > Global Options > Code > Saving > Default text encoding > UTF-8")

# ---- 7. Packages for later weeks ---------------------------------------------------
cat("\n--- 7. Course packages ---\n")
pkgs <- c("dplyr", "tidyr", "ggplot2", "readxl", "writexl", "readr")
missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing) > 0 && install_missing) {
  cat("Installing:", paste(missing, collapse = ", "), "(this can take a few minutes)\n")
  try(install.packages(missing), silent = FALSE)
  missing <- pkgs[!vapply(pkgs, requireNamespace, logical(1), quietly = TRUE)]
}
for (p in pkgs) record(paste("package", p), !(p %in% missing),
                       if (p %in% missing) "not installed: check internet, then run again" else "installed")

# ---- 8. The report ------------------------------------------------------------------
cat("\n=====================================================================\n")
cat("DTS 211 WEEK 0 SETUP REPORT\n")
cat("=====================================================================\n")
print(results, row.names = FALSE, right = FALSE)
n_fix <- sum(results$status == "FIX")
cat("\n")
if (n_fix == 0) {
  cat("READY: all checks passed. See you in Week 1!\n")
} else {
  cat(sprintf("NOT READY: %d item(s) say FIX. Use the troubleshooting table in the Week 0 note.\n", n_fix))
}
cat(sprintf("Report made on %s with %s\n", format(Sys.time(), "%Y-%m-%d %H:%M"), R.version.string))

# ---- YOUR TURN ------------------------------------------------------------------------
# TASK 1: Compare your PREDICT guess at the top with the report. Which check surprised you?
# YOUR CODE (or notes):
#
# TASK 2: Paste the final report above into a comment in a new script called
#         scripts/My_First_Script.R and save it. This is your Week 0 evidence.
# YOUR CODE (or notes):
#
# TASK 3: In one sentence, say whether you are using RStudio Desktop or Posit Cloud
#         and what was the hardest step.
# MY ANSWER:
#
# CHECK YOUR UNDERSTANDING
# Q1. Why must R be installed before RStudio Desktop?
# A:
# Q2. What does getwd() tell you, and why does it matter for data/students.csv?
# A:
