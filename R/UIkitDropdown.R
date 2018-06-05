#' Create an UIkit dropdown
#'
#' Defines different styles for a toggleable dropdown
#' 
#' @param ... Any element.
#' @param dropName Button name.
#' @param mode Dropdown activation mode. "Click" by default. If null, it is 
#' displayed by hovering over the button trigger.
#' @param position Dropdown position: see \url{https://getuikit.com/docs/dropdown#position}.
#' @param offset Custom offset between the dropdown container and the toggle. Numeric value.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitDropdown(
#'     position = "bottom-justify",
#'     mode = NULL,
#'     dropName = "Test me",
#'     "Lorem ipsum dolor sit amet, consectetur 
#'     adipiscing elit, sed do eiusmod tempor incididunt."
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitDropdown <- function(..., dropName = NULL, mode = "click", 
                          position = NULL, offset = NULL) {
  
  ukdropdown <- if (!is.null(mode)) paste0("mode: ", mode, ";") else NULL
  
  if (!is.null(position)) ukdropdown  <- if (is.null(mode)) {
    paste0(ukdropdown, "pos: ", position, ";")
  } else {
    paste0(ukdropdown, " pos: ", position, ";")
  }
  if (!is.null(offset)) ukdropdown  <- if (is.null(mode)) {
    paste0(ukdropdown, "offset: ", offset, ";")
  } else {
    paste0(ukdropdown, " offset: ", offset, ";")
  }

  shiny::tags$div(
    class = "uk-inline",
    shiny::tags$button(type = "button", dropName),
    shiny::tags$div(
      `uk-dropdown` = ukdropdown,
      ...
    )
  )
} 