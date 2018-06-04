#' Create an UIkit card
#'
#' Create layout boxes with different styles
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
#' @param width Card width: if "1-2", the card will take half of the page,
#' "1-3" will be one third... If you wrap card in a grid layout, set width to NULL
#' since the grid will handle it automatically. The sum of all element containing
#' width should be 1. You can also specify fixed width such as "small", "medium", "large",
#' "xlarge", "xxlarge".
#' @param height Card height: "small", "medium" or "large".
#' @param shadow Create a shadow around the box, similar to material design z-depth.
#' "small", "medium", "large" or "xlarge". NULL by default.
#' @param shadow_position Shadow position: NULL or "bottom".
#' @param animation NULL by default: card animation if any, see \url{https://getuikit.com/docs/animation#usage}.
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
#'    UIkitGrid(
#'     child_width = "expand",
#'     gutter = "small",
#'     UIkitGridElement(
#'      UIkitCard(
#'       width = NULL,
#'       height = "medium",
#'       title = "My card",
#'       hover = TRUE,
#'       style = "primary",
#'       horizontal = FALSE,
#'       header = "This is the header",
#'       body = "This is the body",
#'       footer = "This is the footer"
#'      )
#'     ),
#'     UIkitGridElement(
#'      UIkitCard(
#'       width = NULL,
#'       title = "My card",
#'       badge = "test",
#'       horizontal = FALSE,
#'       UIkitCardMedia(
#'         src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'         horizontal = TRUE, 
#'         position = "left"
#'       ),
#'       body = "This is the body"
#'      )
#'     ),
#'     UIkitGridElement(
#'      UIkitCard(
#'       animation = "shake",
#'       width = NULL,
#'       title = "My card",
#'       hover = TRUE,
#'       horizontal = TRUE,
#'       height = "medium",
#'       UIkitCardMedia(
#'         src = "http://wallpics4k.com/wp-content/uploads/2014/07/470318.jpg",
#'         horizontal = TRUE, 
#'         position = "left"
#'       ),
#'       body = "This is the body"
#'      )
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
UIkitCard <- function(..., title = NULL, size = NULL, hover = "FALSE",
                      style = "default", header = NULL, body = NULL, 
                      footer = NULL, badge = NULL, horizontal = FALSE,
                      width = "1-2", height = NULL, shadow = NULL, 
                      shadow_position = NULL, animation = NULL) {
  
  cardCl <- "uk-card"
  
  if (!is.null(size)) cardCl <- paste0(cardCl, " uk-card-", size)
  if (!is.null(style)) cardCl <- paste0(cardCl, " uk-card-", style)
  if (isTRUE(hover)) cardCl <- paste0(cardCl, " uk-card-hover")
  if (isTRUE(horizontal)) cardCl <- paste0(
    cardCl, " uk-grid-collapse uk-child-width-1-2@s uk-margin"
    )
  if (!is.null(width)) cardCl <- paste0(cardCl, " uk-width-", width)
  if (!is.null(height)) cardCl <- paste0(cardCl, " uk-height-", height)
  
  if (!is.null(shadow)) {
    if (!is.null(shadow_position)) {
      cardCl <- paste0(cardCl, " uk-box-shadow-bottom uk-box-shadow-", shadow)
    } else {
      cardCl <- paste0(cardCl, " uk-box-shadow-", shadow)
    }
  }
  
  if (!is.null(animation)) cardCl <- paste0(cardCl, " uk-animation-", animation)
    
  
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
  
  
  # return the cardTag
  if (!is.null(animation)) {
    shiny::tags$div(
      class = "uk-animation-toggle",
      cardTag
    )
  } else {
    cardTag
  }
  
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