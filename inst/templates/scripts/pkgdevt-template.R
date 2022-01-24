
#  ------------------------------------------------------------------------
#
# Title : {{{package_name}}} R Package Development Script
#    By : {{{package_author}}}
#  Date : {{{today}}}
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
library(templateeR)

# initialize package ------------------------------------------------------

usethis::create_package("{{{package_name}}}")
usethis::use_namespace()
usethis::use_roxygen_md()
usethis::use_git()
usethis::use_tibble() # #' @return a [tibble][tibble::tibble-package]
usethis::use_pipe()
usethis::use_tidy_eval()
devtools::document()


# github ------------------------------------------------------------------

# set description and title first so included in GH repo
desc::desc_set(
  "Description" = "{{{package_description}}}",
  "Title" = "{{{package_title}}}"
)

usethis::use_github(private = {{{github_private_repo}}})

# github labels -----------------------------------------------------------

templateeR::use_gh_labels()


# package docs ------------------------------------------------------------

usethis::use_readme_rmd()
usethis::use_mit_license()
usethis::use_package_doc()
usethis::use_news_md()


# functions ---------------------------------------------------------------

c(
  # add function file names here:
  "utils",
  "zzz"
) |> purrr::walk(usethis::use_r, open = FALSE)


# tests -------------------------------------------------------------------

c(
  # add function test file names here:

) |> purrr::walk(usethis::use_test)

# data --------------------------------------------------------------------

c(
  # add data prep script names here:

) |> purrr::walk(usethis::use_data_raw)

# vignettes ---------------------------------------------------------------

c(
  # add vignette names here:
  "{{{package_name}}}"

) |> purrr::walk(usethis::use_vignette)





