
#  ------------------------------------------------------------------------
#
# Title : templateeR R Package Development Script
#    By : Jimmy Briggs
#  Date : 2022-01-22
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

usethis::create_package("templateeR")
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_git()
usethis::use_package_doc()
usethis::use_tibble() # #' @return a [tibble][tibble::tibble-package]
usethis::use_pipe()
usethis::use_tidy_eval()
devtools::document()


# github ------------------------------------------------------------------

# set description and title first so included in GH repo
desc::desc_set(
  "Title" = "Collection of templates for R",
  "Description" = "Apply variouse R related templates."
)

usethis::use_github()

# data --------------------------------------------------------------------

usethis::use_data_raw("gh-labels")



# inst directories --------------------------------------------------------


# functions ---------------------------------------------------------------

c(
  "utils",
  "use_gh_labels",
  "use_git_cliff",
  "use_pkgdevt_script",
  "render_template"
) |>
  purrr::walk(usethis::use_r, open = FALSE)


# tests -------------------------------------------------------------------

usethis::use_test("gh_labels")
