#' Create a UIkit card
#'
#' Build an UIkit card.
#'
#' @param ... any element.
#' @param title Card title.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'   ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitCard(
#'     title = "My card",
#'     checkboxInput("somevalue", "Some value", FALSE)
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitCard <- function(..., title = NULL) {
  shiny::tags$div(
    class = "uk-card uk-card-default uk-card-body",
    shiny::tags$h3(class = "uk-card-title", title),
    ...
  )
}