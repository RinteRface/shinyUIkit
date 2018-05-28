#' Create a UIkit badge
#'
#' Build an UIkit badge.
#' 
#' @param content Badge Text. Avoid large text.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitBadge(content = 100)
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitBadge <- function(content) {
  shiny::tags$span(class = "uk-badge", content)
}