
#  ------------------------------------------------------------------------
#
# Title : Data Preparation for `gh-labels` Dataset
#    By : Jimmy Briggs
#  Date : 2022-01-22
#
#  ------------------------------------------------------------------------

require(usethis)
require(docthis)

labels <- c(
  "bug",
  "feature",
  "documentation",
  "release",
  "config",
  "refactor",
  "question",
  "data",
  "tests"
)

descriptions <- c(
  "Bugfixes in codebase when something is not working.",
  "New enhancements and features.",
  "Improvements or additions to docs.",
  "Indicates a new release.",
  "Configuration and meta-infrastructural changes.",
  "Code refactoring.",
  "Further information requested.",
  "Issues pertaining to data or data preparations.",
  "Issues related to tests."
) |> setNames(labels)

colours <- c(
  "d73a4a",
  "1B6659",
  "0075ca",
  "108a51",
  "8ed92e",
  "D0EFCD",
  "d876e3",
  "FAA631",
  "e4e669"
) |> setNames(labels)

gh_labels <- tibble::tibble(
  label = labels,
  description = descriptions,
  colour = colours
)

usethis::use_data(gh_labels, overwrite = TRUE)
data_doc <- docthis::doc_this("gh_labels")
writeLines(data_doc, "R/data.R")

# fs::dir_create("inst/config")
# gh_labels_yml <- yaml::read_yaml("inst/config/gh_labels.yml")
