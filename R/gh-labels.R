#' Manage GitHub Repository Issue Labels
#'
#' @description
#' `use_gh_labels()` leverages  [usethis::use_github_labels()] to allow users to
#' create, edit, delete, and manage your repository's GitHub issue labels. It can
#' update colors and descriptions of current labels and optionally
#' delete GitHub's default labels.
#'
#' The main difference between this function and [usethis::use_github_labels()]
#' is its usage of a `labels.yml` configuration file. By default this file should
#' be places under `.github/labels.yml` of your repository.
#'
#' @section Note:
#' Default labels will be removed if argument `remove_default` is kept as `TRUE`.
#' It will not delete any issue labels currently assigned to an issue, however.
#'
#' @seealso [usethis::use_github_labels()], [gh::gh()].
#'
#' @param path (Optional) Path to a `labels.yml` configuration file specifying the
#'  GitHub labels in yaml format. See `system.file("config/labels.yml", package = "templateeR")`
#'  for an example using the default labels this package provides. If left `NULL`
#'  the function will check path `.github/labels.yml` first before applying the
#'  default labels.
#' @param ... Passed to [usethis::use_github_labels()]
#'
#' @return invisibly returns list of labels.
#' @export
#'
#' @examples
#' \dontrun{
#' # if no input, will apply default templateeR::gh_labels labels:
#' use_gh_labels()
#'
#' # or can provide path to a `labels.yml` config file:
#' yml_path <- system.file("config/labels.yml", package = "templateeR")
#' use_gh_labels(path = yml_path)
#'
#' # or can use `usethis::use_github_labels()` arguments:
#' use_gh_labels(
#'  labels = c("foofy", "foofier", "foofiest"),
#'    colours = NULL,
#'    descriptions = NULL
#' )
#' }
#'
#' @importFrom lifecycle is_present
#' @importFrom purrr map_depth pluck
#' @importFrom usethis use_github_labels
#' @importFrom utils data
#' @importFrom stats setNames
#' @importFrom yaml read_yaml
#' @importFrom rlang .env
use_gh_labels <- function(path = NULL,
                          ...) {

  if (is.null(path) && is.null(labels) && file.exists(".github/labels.yml")) {
    path <- ".github/labels.yml"
    msg_info("Found labels config file: {msg_path(path)}.")
  }

  if (!is.null(path)) {

    gh_labels_yml <- yaml::read_yaml(path)[["gh_labels"]]
    gh_labels <- list(
      "labels" = names(gh_labels_yml),
      "descriptions" = purrr::map_depth(gh_labels_yml, 1, purrr::pluck, "description"),
      "colours" = purrr::map_depth(gh_labels_yml, 1, purrr::pluck, "colour")
    )
    msg_info("Loaded labels from config file: {msg_path(path)}.")

  } else if (lifecycle::is_present(labels)) {

    msg_info("Using provided labels: {msg_value(labels)}.")

    gh_labels <- list(
      "labels" = labels,
      "descriptions" = if (lifecycle::is_present(.env$descriptions)) .env$descriptions else NULL,
      "colours" = if (lifecycle::is_present(.env$colours)) .env$colours else NULL
    )

  } else {

    msg_info("Nothing provided and no config file found; defaulting to {msg_code('templateeR::gh_labels')} default labels.")

    utils::data("gh_labels")
    gh_labels <- list(
      "labels" = gh_labels$label,
      "descriptions" = gh_labels$description |> stats::setNames(gh_labels$label),
      "colours" = gh_labels$colour |> stats::setNames(gh_labels$label)
    )

  }

  usethis::use_github_labels(
    labels = gh_labels$labels,
    colours = gh_labels$colours,
    descriptions = gh_labels$descriptions,
    delete_default = TRUE,
    ...
  )

  invisible(gh_labels)

}

