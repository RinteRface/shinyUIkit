#' Create an UIkit grid
#'
#' Create a fully responsive, fluid and nestable grid layout
#' 
#' @param ... Slot for an UIkitGridElement.
#' @param gutter Grid gutter (space bewteen elements): "small", "medium", "large" 
#' or "collapse".
#' @param divider Whether to separate grid elements with a vertical divider.
#' FALSE by default.
#' 
#' @note Do not forget to wrap UI element in a UIkitGridElement before putting
#' them in a grid layout (see example)!
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitGrid(
#'     gutter = "small",
#'     UIkitGridElement(
#'      UIkitCard(
#'       width = NULL,
#'       title = "My card",
#'       badge = "test",
#'       hover = TRUE,
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
#'       width = NULL,
#'       title = "My card",
#'       badge = "test",
#'       hover = TRUE,
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
#'       width = NULL,
#'       title = "My card",
#'       badge = "test",
#'       hover = TRUE,
#'       horizontal = FALSE,
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
UIkitGrid <- function(..., gutter = NULL, divider = FALSE) {
  
 gridCl <- "uk-child-width-expand@s uk-grid-match"
 if (!is.null(gutter)) gridCl <- paste0(gridCl, " uk-grid-", gutter)
 if (isTRUE(divider)) gridCl <- paste0(gridCl, " uk-grid-divider")
  
 gridTag <- shiny::tags$div(class = gridCl, ...)
 gridTag$attribs[["uk-grid"]] <- NA
 gridTag
} 



#' Create an UIkit grid element
#'
#' Element to insert in a grid layout.
#' 
#' @param ... Any UI element.
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitGridElement <- function(...) {
  shiny::tags$div(...)
}