#' Create an UIkit label element
#'
#' Indicate important notes and highlight parts of your content
#' 
#' @param text Label Text.
#' @param color Label color: "success", "warning", "danger".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitLabel(
#'      color = "danger",
#'      text = "label"
#'    ),
#'    UIkitLabel(
#'      color = "warning",
#'      text = "label"
#'    ),
#'    UIkitLabel(
#'      color = "success",
#'      text = "label"
#'    ),
#'    UIkitLabel(text = "label")
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitLabel <- function(text = NULL, color = NULL) {
  shiny::tags$span(
    class = if (!is.null(color)) paste0("uk-label uk-label-", color) else "uk-label",
    text
  )
} 
