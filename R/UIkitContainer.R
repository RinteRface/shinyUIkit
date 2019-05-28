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
#'       src = "https://getuikit.com/docs/images/light.jpg",
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
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitContainer <- function(..., size = NULL) {
  shiny::tags$div(
    class = paste0("uk-container", if (!is.null(size)) " uk-container-", size),
    ...
  )
} 