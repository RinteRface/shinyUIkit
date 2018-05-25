#' Create a UIkit accordion
#'
#' Build an UIkit accordion which can contain UIkitAccordionItem.
#'
#' @param ... slot for UIkitAccordionItem.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitAccordion(
#'     UIkitAccordionItem(
#'      title = "Item 1",
#'      opened = TRUE, 
#'      "Lorem ipsum dolor sit amet, consectetur 
#'      adipiscing elit, sed do eiusmod tempor 
#'      incididunt ut labore et dolore magna aliqua"
#'     ),
#'     UIkitAccordionItem(
#'      title = "Item 2",
#'      "Lorem ipsum dolor sit amet, consectetur 
#'      adipiscing elit, sed do eiusmod tempor 
#'      incididunt ut labore et dolore magna aliqua"
#'     ),
#'     UIkitAccordionItem(
#'      title = "Item 3",
#'      "Lorem ipsum dolor sit amet, consectetur 
#'      adipiscing elit, sed do eiusmod tempor 
#'      incididunt ut labore et dolore magna aliqua"
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
UIkitAccordion <- function(..., multiple = FALSE) {
  
  accordionTag <- shiny::tags$ul(
    ...
  )
  accordionTag$attribs[["uk-accordion"]] <- NA
  if (multiple) accordionTag$attribs[["uk-accordion"]] <- "multiple: true"
  accordionTag
}



#' Create a UIkit accordion item
#'
#' Build an UIkit accordion item which can be embedded in an UIkitAccordion.
#'
#' @param ... Item content.
#' @param title Item title.
#' @param opened Whether to start with the item opened. FALSE by default.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitAccordionItem <- function(..., title = NULL, opened = FALSE) {
  
  shiny::tags$li(
    class = if (opened) "uk-open" else NULL,
    shiny::tags$a(
      class = "uk-accordion-title",
      href = "#",
      title
    ),
    shiny::tags$div(
      class = "uk-accordion-content",
      shiny::tags$p(...)
    )
  )
}