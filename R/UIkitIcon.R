#' Create an UIkit icon
#'
#' Place scalable vector icons anywhere in your content
#' 
#' @param icon Icon name. See \url{https://getuikit.com/docs/icon#library} for the full list.
#' @param ratio Icon ratio compared to the normal value. 2 means twice bigger than
#' the base case.
#' @param button Whether to wrap the icon in a button.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitIcon("paint-bucket"),
#'    UIkitIcon("home", ratio = 2),
#'    UIkitIcon("twitter", button = TRUE)
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitIcon <- function(icon, ratio = NULL, button = FALSE) {
  
  stopifnot(!is.null(icon))
  
  iconCl <- "uk-margin-small-right"
  if (isTRUE(button)) iconCl <- paste0(iconCl, " uk-icon-button")
  
  shiny::tags$span(
    class = iconCl,
    `uk-icon` = if (!is.null(ratio)) {
      paste("icon:", icon, ";", "ratio:", ratio) 
    } else {
      paste("icon:", icon)
    }
  )
} 