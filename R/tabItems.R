#' Create an UIkit tabItems panel 
#'
#' Wrap elements inside when you are using a navbar
#' 
#' @param ... Any UI element. 
#' @param id Unique id element, same as the sidebar menu. See \link{UIkitNavItems}.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitTabItems <- function(..., id) {
  items <- list(...)
  shiny::tags$ul(
    id = id,
    class = "uk-switcher uk-margin",
    lapply(1:length(items), function(i) {
      shiny::tags$li(
        class = "tab-pane",
        items[[i]]
      )
    })
  )
}