#' Create an UIkit width
#'
#' Set up the element width.
#' 
#' @param ... Any UI element such as card. 
#' @param ratio By default, the width is set to 1 half or the page, namely "1-2".
#' Could be set to "1-3", ... until "1-6".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitContainer(
#'     UIkitWidth(
#'      ratio = "1-2",
#'       UIkitCard(
#'        title = "My card",
#'        badge = "test",
#'        hover = TRUE,
#'        horizontal = TRUE,
#'        UIkitCardMedia(
#'          src = "https://getuikit.com/docs/images/light.jpg",
#'          horizontal = TRUE, 
#'          position = "left"
#'        ),
#'        body = "The card width is 1 quarter of the full page width"
#'       )
#'      )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitWidth <- function(..., ratio = "1-2") {
  shiny::tags$div(class = paste0("uk-width-", ratio), ...)
} 