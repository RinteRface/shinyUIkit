#' Create an UIkit close icon
#'
#' To close elements
#' 
#' @param size Icon size: NULL or "large".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitCard(
#'     title = "My card",
#'     badge = "test",
#'     hover = TRUE,
#'     horizontal = TRUE,
#'     UIkitCardMedia(
#'       src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'       horizontal = TRUE, 
#'       position = "left"
#'     ),
#'     body = "This is the body"
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitClose <- function(size = NULL) {
  
  closeCl <- NULL
  if (!is.null(size)) closeCl <- paste0(closeCl, "uk-close-large")
  
  closeTag <- shiny::tags$button(type = "button", class = closeCl)
  closeTag$attribs[["uk-close"]] <- NA
  closeTag
}