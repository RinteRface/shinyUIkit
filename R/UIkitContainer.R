#' Create an UIkit container
#'
#' Build a container to align and center page content.
#' 
#' @param ... Any UI element. 
#' @param size Container size: "small", "large" or "expand".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitContainer(
#'     UIkitCard(
#'      title = "My card",
#'      badge = "test",
#'      hover = TRUE,
#'      horizontal = TRUE,
#'      UIkitCardMedia(
#'       src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'       horizontal = TRUE, 
#'       position = "left"
#'      ),
#'      body = "This is the body"
#'     )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitContainer <- function(..., size = NULL) {
  shiny::tags$div(
    class = paste0("uk-container-", size), 
    ...
  )
} 