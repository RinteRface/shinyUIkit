#' Create an UIkit lightbox element
#'
#' Create a responsive lightbox gallery with images and videos
#' 
#' @param src Image path or url.
#' @param caption Image title, description.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitLightbox(
#'     src = "https://getuikit.com/docs/images/photo.jpg",
#'     caption = "Hello"
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitLightbox <- function(src = NULL, caption = NULL) {
  lightboxTag <- shiny::tags$div(
    shiny::tags$a(
      class = "uk-button uk-button-default",
      href = src,
      `data-caption` = caption,
      #target = "_blank",
      "Open Lightbox"
    )
  )
  lightboxTag$attribs[["uk-lightbox"]] <- NA
  lightboxTag
} 
