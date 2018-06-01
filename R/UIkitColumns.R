#' Create a UIkit column
#'
#' Build a set of columns.
#' 
#' @param ... Any UI element. You can also insert inline element using UIkitColumnSpan().
#' @param n Number of columns: from 2 to 6.
#' @param divider Whether to display a divider between columns. FALSE by default.
#' 
#' @note UI content needs to be wrapped in a p() tag.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitColumns(
#'     n = 2,
#'     divider = TRUE,
#'     p("Lorem ipsum dolor sit amet, consectetur 
#'     adipiscing elit, sed do eiusmod tempor 
#'     incididunt ut labore et dolore magna aliqua. 
#'     Ut enim ad minim veniam, quis nostrud 
#'     exercitation ullamco laboris."
#'     ),
#'     p("Duis aute irure dolor in reprehenderit 
#'     in voluptate velit esse cillum dolore eu 
#'     fugiat nulla pariatur. Excepteur sint occaecat 
#'     cupidatat non proident, sunt in culpa qui officia 
#'     deserunt mollit anim id est laborum."
#'     ),
#'     UIkitColumnSpan(
#'     "All we have to decide is what to do 
#'     with the time that is given us"
#'     ),
#'     p("Ut enim ad minim veniam, quis nostrud 
#'     exercitation ullamco laboris nisi ut 
#'     aliquip ex ea commodo consequat. 
#'     Duis aute irure dolor in reprehenderit 
#'     in voluptate velit esse cillum dolore 
#'     eu fugiat nulla pariatur. Excepteur sint
#'     occaecat cupidatat non proident. Duis aute 
#'     irure dolor in reprehenderit in voluptate 
#'     velit esse cillum dolore.")
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitColumns <- function(..., n, divider = FALSE) {
  
  stopifnot(!is.null(n))
  
  colCl <- "uk-column-1-"
  if (!is.null(n)) colCl <- paste0(colCl, n)
  if (isTRUE(divider)) colCl <- paste0(colCl, " uk-column-divider")
  
  shiny::tags$div(
    class = colCl,
    ...
  )
}




#' Create a UIkit special p tag
#'
#' This p tag is designed for displayed inline element
#' in a column layout
#' 
#' @param ... Any UI element.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitColumnSpan <- function(...) {
  shiny::tags$p(class = "uk-column-span", ...)
}