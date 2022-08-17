#' Use `git-cliff`
#'
#' @description
#' `git-cliff` is a useful tool for automating the generation of repository
#' CHANGELOGs and following good practices with git by using the
#' [conventional commits](https://www.conventionalcommits.org) methodology.
#'
#' This function implements `git-cliff` into your repo by adding a `cliff.toml`
#' default configuration file and then running `git-cliff` to output a CHANGELOG.md
#' file based off the repo's git history.
#'
#' @seealso
#' - [orhun/git-cliff GitHub repo](https://github.com/orhun/git-cliff/)
#' - [Default cliff.toml config file](https://github.com/orhun/git-cliff/blob/main/config/cliff.toml)
#' - [Conventional Commits](https://www.conventionalcommits.org)
#'
#' @param path Path to output generated CHANGELOG.md file.
#' @param config Path to `cliff.toml` configuration file.
#'
#' @return Nothing; used for its side-effects.
#' @export
#'
#' @examples
#' \dontrun{
#'  use_git_cliff()
#' }
#'
#' @importFrom usethis use_build_ignore
#' @importFrom utils file.edit
use_git_cliff <- function(path = "CHANGELOG.md", config = "cliff.toml") {
  installed <- test_git_cliff_installed()
  if (!installed) stop(msg_err("No git-cliff installation detected. Please install and retry."))
  msg_info("Initialize git-cliff configuration file")
  system("git-cliff -i")
  usethis::use_build_ignore("cliff.toml")
  msg_info("Running git-cliff to generate output {msg_path('CHANGELOG.md')}")
  system("git-cliff -o CHANGELOG.md")
  usethis::use_build_ignore("CHANGELOG.md")
  msg_done("Success: created {msg_path('CHANGELOG.md')}.")
  msg_info("Updating cliff.toml configuration file to use custom configs...")
  fs::file_copy(
    fs::path_package("templateeR", "config/cliff.toml"),
    new_path = "cliff.toml",
    overwrite = TRUE
  )
  msg_done("Successfully update cliff.toml with custom configs.")
  invisible(0)
}

#' Test that `git-cliff` is installed
#' @keywords internal
test_git_cliff_installed <- function() {
  if (Sys.which("git-cliff") == "") return(FALSE)
  TRUE
}
