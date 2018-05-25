#' Create a UIkit card
#'
#' Build an UIkit card.
#'
#' @param ... any element.
#' @param title Card title.
#' @param size Card size: either NULL, "small" or "large".
#' @param hover Whether to trigger a hover effect. FALSE by default.
#' @param style Card style: "default", "primary" or "secondary".
#' @param header Header content, if any.
#' @param body Body content, if any.
#' @param footer Footer content, if any.
#' @param badge Badge content, if any.
#' @param horizontal Whether to display horizontal content. FALSE by default.
#' If TRUE, use UIkitCardMedia with horizontal set to TRUE!
#' 
#' @note Never use footer and header when horizontal is TRUE!
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitCard(
#'      title = "My card",
#'      badge = "test",
#'      hover = TRUE,
#'      horizontal = TRUE,
#'      UIkitCardMedia(src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'                     horizontal = TRUE, position = "left"),
#'      body = "This is the body"
#'    ),
#'    UIkitCard(
#'      title = "My card",
#'      badge = "test",
#'      hover = TRUE,
#'      horizontal = FALSE,
#'      header = "This is the header",
#'      style = "secondary",
#'      UIkitCardMedia(
#'       src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'       horizontal = TRUE, 
#'       position = "left"
#'      ),
#'      body = "This is the body",
#'      footer = "This is the footer"
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitCard <- function(..., title = NULL, size = NULL, hover = "FALSE",
                      style = "default", header = NULL, body = NULL, 
                      footer = NULL, badge = NULL, horizontal = FALSE) {
  
  cardCl <- "uk-card uk-width-1-2@m"
  
  if (!is.null(size)) cardCl <- paste0(cardCl, " uk-card-", size)
  if (!is.null(style)) cardCl <- paste0(cardCl, " uk-card-", style)
  if (isTRUE(hover)) cardCl <- paste0(cardCl, " uk-card-hover")
  if (isTRUE(horizontal)) cardCl <- paste0(
    cardCl, " uk-grid-collapse uk-child-width-1-2@s uk-margin"
    )
  
  cardTag <- shiny::tags$div(
    class = cardCl,
    if (!is.null(header)) {
      shiny::tags$div(
        class = "uk-card-header",
        shiny::tags$h3(class = "uk-card-title", title),
        header
      )
    },
    ...,
    if (horizontal) {
      shiny::tags$div(
        shiny::tags$div(
          class = "uk-card-body",
          shiny::tags$h3(class = "uk-card-title", title),
          if (!is.null(badge)) shiny::tags$div(class = "uk-card-badge uk-label", badge),
          body
        )
      )
    } else {
      shiny::tags$div(
        class = "uk-card-body",
        if (is.null(header)) shiny::tags$h3(class = "uk-card-title", title),
        if (!is.null(badge)) shiny::tags$div(class = "uk-card-badge uk-label", badge),
        body
      )
    },
    if (!is.null(footer)) {
      shiny::tags$div(class = "uk-card-footer", footer)
    }
  )
  
  if (horizontal) cardTag$attribs[["uk-grid"]] <- NA
  
  cardTag
  
}


#' Create a UIkit card
#'
#' Build an UIkit card.
#'
#' @param src Media url or path.
#' @param position Media position: "top" or "bottom". "top" by default. If
#' horizontal is TRUE, "left" or "right" are also available.
#' @param horizontal Media horizontal mode. Only works if the UIkitCard has
#' horizontal set to TRUE.
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitCardMedia <- function(src = NULL, position = "top",
                           horizontal = FALSE) {
  
  cardMediaCl <- paste0("uk-card-media-", position)
  if (position == "right") cardMediaCl <- paste0(cardMediaCl, " uk-flex-last@s")
  if (isTRUE(horizontal)) cardMediaCl <- paste0(cardMediaCl, " uk-cover-container")
  
  cardMediaTag <- shiny::tags$div(class = cardMediaCl)
  
  imgTag <- shiny::tags$img(src = src)
  
  if (horizontal) canvasTag <- shiny::tags$canvas(width = "600", height = "400")
  
  if (horizontal) imgTag$attribs[["uk-cover"]] <- NA
  
  cardMediaTag <- shiny::tagAppendChildren(cardMediaTag, imgTag, canvasTag)
  cardMediaTag
}