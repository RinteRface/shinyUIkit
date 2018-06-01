#' Create an UIkit spinner
#'
#' Create an animated loading spinner
#' 
#' @param ratio Relative spinner size. If 3, the spinner will be 3 times
#' bigger than in the normal case.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitSpinner(),
#'    UIkitSpinner(ratio = 3),
#'    UIkitSpinner(ratio = 5)
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSpinner <- function(ratio = NULL) {
  spinnerTag <- shiny::tags$div()
  spinnerTag$attribs[["uk-spinner"]] <- if (!is.null(ratio)) paste0("ratio: ", ratio) else NA
  spinnerTag
} 
