#' Render Template
#'
#' @description
#' This function is a modification of [usethis::use_template()] that applies user
#' supplied data fields to a given template file via [whisker::whisker.render()].
#'
#' @param template_path Path to the template file
#' @param out_path Path to desired output location
#' @param data list of fields to pass to the template file
#' @param open logical - should the file be opened?
#'
#' @return Invisible
#' @export
#'
#' @examples
#' \dontrun{
#' render_template(system.file("templates/pkgdevt-script", package = "templateeR"),
#'                 ".", data = list(package_name = "testPackage"),
#'                 open = TRUE)
#' }
#' @importFrom usethis write_over
#' @importFrom whisker whisker.render
render_template <- function(template_path, out_path, data = list(), open = TRUE) {

  contents <- strsplit(
    whisker::whisker.render(
      readLines(template_path, encoding = "UTF-8", warn = FALSE), data
    ),
    "\n"
  )[[1]]

  usethis::write_over(out_path, contents)
  if (open) file.edit(out_path)
  invisible()

}
