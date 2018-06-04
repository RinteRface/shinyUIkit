#' Create an UIkit image
#'
#' Create a special UIkit ready image tag
#' 
#' @param src Image source or path.
#' @param width Image width in pixels.
#' @param height Image height in pixels.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitImage(
#'     src = "https://getuikit.com/docs/images/photo.jpg",
#'     width = "500",
#'     height = "500"
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitImage <- function(src = NULL, width, height) {
  stopifnot(!is.null(width))
  stopifnot(!is.null(height))
  
  imgTag <- shiny::tags$img(
    `data-src` = src,
    width = width,
    height = height
  )
  
  imgTag$attribs[["uk-img"]] <- NA
  imgTag
  
} 