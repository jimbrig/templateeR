
#  ------------------------------------------------------------------------
#
# Title : {{package_name}} R Package Development Script
#    By : {{author}}
#  Date : {{today}}
#
#  ------------------------------------------------------------------------


# library R packages ------------------------------------------------------

library(devtools)
library(usethis)
library(pkgbuild)
library(pkgload)
library(pkgdown)
library(testthat)
library(knitr)
library(pak)
library(purrr)
library(desc)
library(chameleon)
library(attachment)


# initialize package ------------------------------------------------------

usethis::create_package({{package_name}})
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_git()
usethis::use_package_doc()
usethis::use_tibble() # #' @return a [tibble][tibble::tibble-package]
usethis::use_pipe() # move to propaloc-package.R
usethis::use_tidy_eval() # move to propalloc-package.R
devtools::document()


# github ------------------------------------------------------------------

# set description and title first so included in GH repo
desc::desc_set(
  "Description" = {{package_description}},
  "Title" = {{package_title}}
)

usethis::use_github()
usethis::use_github_labels(
  labels = c("bug", "feature", "documentation", "release", "config", "refactor", "question", "data"),
  descriptions = c(
    "bug" = "Bugfixes in codebase when something is not working.",
    "New enhancements and features.",
    "Improvements or additions to docs.",
    "Indicates a new release.",
    "Configuration and meta-infrastructural changes.",
    "Code refactoring.",
    "Further information requested.",
    "Issues pertaining to data or data preparations."
  ),
  delete_default = TRUE,
  colours = c(
    ""
  )
)



# github labels -----------------------------------------------------------




