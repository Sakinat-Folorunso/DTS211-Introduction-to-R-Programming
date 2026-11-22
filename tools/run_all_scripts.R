# =====================================================================
# tools/run_all_scripts.R
# Instructor check: run scripts/Week_00 ... Week_12 in a clean COPY of the
# project and report any unexpected error. Deliberate teaching errors are
# wrapped in try() inside the scripts, so any error reported here is real.
#
# Usage (from the repository root):   Rscript tools/run_all_scripts.R
# Exit status is 1 if any script stops with an error, otherwise 0.
# =====================================================================
set.seed(42)
root <- normalizePath(".")
stopifnot(file.exists(file.path(root, "00_make_data.R")))
scripts <- sort(list.files(file.path(root, "scripts"), pattern = "^Week_\\d{2}_.*\\.R$", full.names = TRUE))
cat("R:", R.version.string, "\nScripts found:", length(scripts), "\n\n")

run_one <- function(script) {
  work <- tempfile("dts211_"); dir.create(work)
  keep <- c("00_make_data.R", "DTS211.Rproj", "data", "scripts")
  file.copy(file.path(root, keep), work, recursive = TRUE)
  dir.create(file.path(work, "output"), showWarnings = FALSE)
  old <- setwd(work); on.exit(setwd(old), add = TRUE)
  options(warn = 1, device = function(...) pdf(NULL))
  env <- new.env(parent = globalenv())
  exprs <- parse(script, keep.source = TRUE, encoding = "UTF-8")
  refs <- attr(exprs, "srcref")
  errors <- character()
  for (i in seq_along(exprs)) {
    msg <- tryCatch({ utils::capture.output(eval(exprs[[i]], env)); NULL },
                    error = function(e) conditionMessage(e))
    if (!is.null(msg)) {
      errors <- c(errors, sprintf("  line %d: %s", refs[[i]][1], gsub("\n", " ", msg)))
    }
  }
  list(n = length(exprs), errors = errors)
}

failed <- 0
for (s in scripts) {
  res <- run_one(s)
  status <- if (length(res$errors) == 0) "OK  " else "FAIL"
  cat(sprintf("[%s] %-34s %3d expressions\n", status, basename(s), res$n))
  if (length(res$errors) > 0) { failed <- failed + 1; cat(paste(res$errors, collapse = "\n"), "\n") }
}
cat(sprintf("\n%d of %d scripts ran without unexpected errors.\n", length(scripts) - failed, length(scripts)))
if (failed > 0) quit(status = 1)
