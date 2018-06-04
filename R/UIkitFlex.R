#' Create an UIkit flex 
#'
#' Utilize the power of flexbox to create a wide range of layouts
#' 
#' @param ... Slot for an UIkitFlexElement.
#' @param horiz_align Horizontal alignement style: "left", "center", "right", "between"
#' and "around".
#' @param vert_align Vertical alignement style: "stretch", "top", "middle" and
#' "bottom".
#' @param direction Flex direction: either "row" or "column",
#'
#' @note You can also include UIkitGridElement instead ot UIkitFlexElement. 
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitFlex(
#'     horiz_align = "center",
#'     vert_align = "middle",
#'     direction = "column",
#'     UIkitFlexElement(
#'      UIkitTile(style = "primary", "Primary")
#'     ),
#'     UIkitFlexElement(
#'      UIkitTile(style = "primary", "Primary")
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
UIkitFlex <- function(..., horiz_align = NULL, vert_align = NULL,
                      direction = "row") {
  
  flexCl <- "uk-flex"
  if (direction == "row") {
    flexCl <- paste0(flexCl, " uk-flex-row") 
  } else {
    flexCl <- paste0(flexCl, " uk-flex-column") 
  }
    
  if (!is.null(horiz_align)) flexCl <- paste0(flexCl, " uk-flex-", horiz_align)
  if (!is.null(vert_align)) flexCl <- paste0(flexCl, " uk-flex-", vert_align)
  
  shiny::tags$div(
    class = flexCl,
    ...
  )
} 



#' Create an UIkit flex element
#'
#' Element to insert in a flex layout.
#' 
#' @param ... Any UI element.
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitFlexElement <- function(...) {
  shiny::tags$div(...)
}