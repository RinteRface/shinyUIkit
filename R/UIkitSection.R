#' Create an UIkit section
#'
#' Create horizontal layout sections with different background colors and styles
#' 
#' @param ... Slot for UIkitSectionItem.
#' @param title Section title.
#' @param style Section style: "default", "muted", "primary", "secondary".
#' @param preserve Whether to preserve the color of UI elements inside the section.
#' TRUE by default.
#' @param size Section size: "xsmall", "small", "large", "xlarge" or NULL (default).
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  shiny::shinyApp(
#'    ui = UIkitPage(
#'      title = "My UIkit application",
#'      UIkitSection(
#'       size = "small",
#'       title = "Section Primary with cards",
#'       style = "primary",
#'       UIkitGrid(
#'        child_width = "expand",
#'        UIkitSectionItem(
#'         UIkitCard(
#'          width = NULL,
#'          height = "medium",
#'          title = "My card",
#'          hover = TRUE,
#'          horizontal = FALSE,
#'          header = "This is the header",
#'          body = "This is the body",
#'          footer = "This is the footer"
#'         )
#'        ),
#'        UIkitSectionItem(
#'         UIkitCard(
#'           width = NULL,
#'           height = "medium",
#'           title = "My card",
#'           hover = TRUE,
#'           horizontal = FALSE,
#'           header = "This is the header",
#'           body = "This is the body",
#'           footer = "This is the footer"
#'         )
#'        )
#'       )
#'      )
#'    ),
#'    server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSection <- function(..., title = NULL, style = NULL,
                         preserve = TRUE, size = NULL) {
  
  sectionCl <- "uk-section"
  if (!is.null(style)) sectionCl <- paste0(sectionCl, " uk-section-", style)
  if (isTRUE(preserve)) sectionCl <- paste0(sectionCl, " uk-preserve-color")
  if (!is.null(size)) sectionCl <- paste0(sectionCl, " uk-section-", size)
  
  shiny::tags$div(
    class = sectionCl,
    UIkitContainer(
      shiny::tags$h3(title),
      ...
    )
  )
} 




#' Create an UIkit section item
#'
#' Wrap any UI element inside
#' 
#' @param ... Any UI element.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSectionItem <- function(...) {
  shiny::tags$div(...)
}