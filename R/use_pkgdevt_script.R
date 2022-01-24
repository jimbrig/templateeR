#' Use a `pkgdevt.R` script
#'
#' @description
#' This function adds a script to `inst/scripts/pkgdevt.R` to keep track of the
#' various steps applied setting up your R package.
#'
#' @details
#' For details see this package's `pkgdevt.R` script by running:
#'
#' `file.edit(fs::path_package("templateeR", "scripts/pkgdevt.R"))`.
#'
#' @seealso <https://github.com/jimbrig/templateeR/blob/main/inst/scripts/pkgdevt.R>
#'
#' @param package_name Name of your package
#' @param package_author Author
#' @param package_description Description
#' @param package_title Title
#' @param github_private_repo Logical
#' @param ... if necessary
#'
#' @return Invisible
#' @export
#'
#' @examples
#' \dontrun{
#' use_pkgdevt_script("testPackage",
#'                    package_description = "My awesome description.",
#'                    package_title = "package title",
#'                    github_private_repo = FALSE)
#' }
#' @importFrom fs path dir_create path_package
use_pkgdevt_script <- function(package_name = basename(getwd()),
                               package_author = Sys.getenv("FULLNAME", ""),
                               package_description = "My awesome description.",
                               package_title = "My awesome title",
                               github_private_repo = FALSE,
                               ...) {

  out_file <- fs::path(getwd(), "inst/scripts/pkgdevt.R")

  if (!dir.exists(dirname(out_file))) fs::dir_create(dirname(out_file), recurse = TRUE)

  render_template(
    fs::path_package("templateeR", "templates/scripts/pkgdevt-template.R"),
    out_file,
    data = list(
      package_name = package_name,
      package_author = package_author,
      package_description = package_description,
      package_title = package_title,
      github_private_repo = github_private_repo,
      today = as.character(Sys.Date()),
      ...
    ),
    open = TRUE
  )

  invisible(0)

}
