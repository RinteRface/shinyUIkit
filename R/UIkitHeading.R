#' Create an UIkit h1 custom title
#'
#' Define different styles for headings
#' 
#' @param title Heading content.
#' @param style Heading style: "primary", "hero", "divider", "bullet" and "line".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitGrid(
#'     child_width = "1-2",
#'     UIkitHeading(
#'     style = "primary",
#'     title = "Heading Primary"
#'     ),
#'     UIkitHeading(
#'      style = "hero",
#'      title = "Heading Hero"
#'     )
#'    ),
#'    UIkitGrid(
#'     child_width = "1-2",
#'     UIkitHeading(
#'      style = "divider",
#'      title = "Heading Divider"
#'     ),
#'     UIkitHeading(
#'      style = "bullet",
#'      title = "Heading Bullet"
#'     )
#'    ),
#'    UIkitGrid(
#'     child_width = "1-2",
#'     UIkitHeading(
#'      style = "line",
#'      title = "Heading Line"
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
UIkitHeading <- function(title, style) {
  stopifnot(!is.null(style))
  headingCl <- paste0("uk-heading-", style)
  if (style == "line") headingCl <- paste0(headingCl, " uk-text-center")
  shiny::tags$h1(
    class = headingCl, 
    if (style == "line") shiny::tags$span(title) else title
  )
} 