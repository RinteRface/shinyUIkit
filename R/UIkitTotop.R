#' Create an UIkit to top scroller
#'
#' Navigate at the top of the web page
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
#'     ),
#'     UIkitCard(
#'       title = "My card",
#'       badge = "test",
#'       hover = TRUE,
#'       horizontal = FALSE,
#'       header = "This is the header",
#'       style = "secondary",
#'       UIkitCardMedia(
#'         src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'         horizontal = TRUE, 
#'         position = "left"
#'       ),
#'       body = "This is the body",
#'       footer = "This is the footer"
#'     ),
#'     UIkitCard(
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
#'     ),
#'     UIkitCard(
#'       title = "My card",
#'       badge = "test",
#'       hover = TRUE,
#'       horizontal = FALSE,
#'       header = "This is the header",
#'       style = "secondary",
#'       UIkitCardMedia(
#'         src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'         horizontal = TRUE, 
#'         position = "left"
#'       ),
#'       body = "This is the body",
#'       footer = "This is the footer"
#'     ),
#'     UIkitTotop()
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitTotop <- function() {
  totopTag <- shiny::tags$a(href = "")
  totopTag$attribs[["uk-totop"]] <- NA
  totopTag
}