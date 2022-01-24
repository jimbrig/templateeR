#' Use `git-cliff` GitHub Action Workflow
#'
#' @description
#' Adds a github action to auto-generate a `CHANGELOG.md` using GitHub actions and
#' `git-cliff`.
#'
#' @seealso [use_git_cliff()]
#'
#' @param save_as File name to save as; defaults to `git-cliff.yml`. Will be saved
#'   in the `.github/workflows` directory.
#' @param open Logical - should the file be opened?
#'
#' @return Invisible
#' @export
#'
#' @examples
#' \dontrun{
#'  use_git_cliff_action()
#' }
#' @importFrom fs path dir_create file_copy path_package
use_git_cliff_action <- function(save_as = "git-cliff.yml", open = FALSE) {

  out_file <- fs::path(".github", "workflows", save_as)
  if (!dir.exists(dirname(out_file))) fs::dir_create(dirname(out_file), recurse = TRUE)
  fs::file_copy(fs::path_package("templateeR", "templates/workflows/git-cliff.yml"), out_file, overwrite = TRUE)
  msg_done("Sucessfully created {msg_path(out_file)}. Please commit your changes to GitHub.")
  if (open) file.edit(out_file)
  invisible(0)

}
