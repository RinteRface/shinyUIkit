#' Create an UIkit cover
#'
#' Expand images, videos or iframes to cover their entire 
#' container and place your own content on top.
#' 
#' @param src Media source or path. 
#' @param type Media type: "image", "video" or "iframe".
#' @param height Cover height: "medium" by default but also "small" or "large".
#' 
#' @note Prefer iframe movie quality than the video one.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitCover(
#'      src = "https://getuikit.com/docs/images/dark.jpg",
#'      type = "image"
#'    ),
#'    UIkitCover(
#'      src = "https://quirksmode.org/html5/videos/big_buck_bunny.mp4",
#'      type = "video"
#'    ),
#'    UIkitCover(
#'      src = "https://www.youtube-nocookie.com/embed/YE7VzlLtp-4",
#'      type = "iframe"
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitCover <- function(src = NULL, type = "img", height = "medium") {
  
  mediaTag <- if (type == "image") {
    shiny::tags$img(src = src)
  } else if (type == "video") {
    shiny::tags$video(
      shiny::tags$source(
        src = src,
        type = "video/mp4"
      )
    )
  } else {
    shiny::tags$iframe(
      src = src,
      width = "560", 
      height = "315",
      frameborder = "0",
      `allowfullscreen` = "true"
    )
  }
  
  mediaTag$attribs[["uk-cover"]] <- NA
  
  if (type == "video") {
    mediaTag$attrib[["autoplay"]] <- NA
    mediaTag$attrib[["loop"]] <- NA
    mediaTag$attrib[["muted"]] <- NA
    mediaTag$attrib[["playsinline"]] <- NA
  } 

  coverTag <- shiny::tags$div(
    class = paste0("uk-cover-container", " uk-height-", height), 
    mediaTag
  )
  coverTag <- shiny::tagAppendChild(coverTag, mediaTag)
  coverTag
  
} 