#' Create an UIkit sortable grid
#'
#' Create sortable grids and lists to rearrange the order of its elements
#' 
#' @param ... Slot for UIkitSortableItem.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitSortable(
#'    lapply(X = 1:4, FUN = function(i) {
#'      UIkitSortableItem(
#'        UIkitCard(
#'         width = NULL,
#'         height = "medium",
#'         title = paste0("My card ", i),
#'         hover = TRUE,
#'         horizontal = FALSE,
#'         body = "This is the body"
#'        )
#'      )
#'    })
#'   )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSortable <- function(...) {
  
  sortableCl <- "uk-grid-small uk-child-width-1-2 uk-child-width-1-4@s uk-text-center"
  
  sortableTag <- shiny::tags$ul(
    class = sortableCl,
    ...
  )
  sortableTag$attribs[["uk-sortable"]] <- "handle: .uk-card"
  sortableTag$attribs[["uk-grid"]] <- NA
  sortableTag
} 



#' Create an UIkit sortable element
#'
#' To put inside a sortable grid
#' 
#' @param ... Any UI element to be sorted.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSortableItem <- function(...) {
  shiny::tags$li(...)
}