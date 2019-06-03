#' @title Launch the shinyUIkit Gallery
#'
#' @description A gallery of all components available in shinyUIkit.
#'
#' @export
#'
#' @examples
#' if (interactive()) {
#'
#'  UIkitallery()
#'
#' }
UIkitGallery <- function() { # nocov start
  if (!requireNamespace(package = "shiny"))
    message("Package 'shiny' is required to run this function")
  shiny::shinyAppFile(
    system.file(
      "examples/gallery/app.R",
      package = 'shinyUIkit',
      mustWork = TRUE
    )
  )
}