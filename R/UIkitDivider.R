#' Create an UIkit divider
#'
#' Create dividers to separate content and apply different styles to them
#' 
#' @param small Divider size. FALSE by default. If TRUE, the divider class
#' will be small.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    h1("blabla"),
#'    UIkitDivider(),
#'    h1("blabla")
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitDivider <- function(small = FALSE) {
  cl <- "uk-divider-icon"
  if (isTRUE(small)) cl <- gsub(x = cl, pattern = "icon", "small")
  shiny::tags$hr(class = cl)
} 