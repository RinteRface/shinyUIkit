#' Create an UIkit progress bar
#'
#' Defines progress bars that indicate how far along a process is started
#' 
#' @param value Current value.
#' @param max Maximum value.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  shiny::shinyApp(
#'    ui = UIkitPage(
#'      title = "My UIkit application",
#'      sliderInput(
#'        inputId = "progressinput", 
#'        label = "Increase the progress bar",
#'        value = 1, 
#'        min = 0, 
#'        max = 10
#'      ),
#'      uiOutput("progress")
#'    ),
#'    server = function(input, output) {
#'      output$progress <- renderUI({
#'        UIkitProgress(
#'          value = input$progressinput,
#'          max = 10
#'        )
#'      })
#'    }
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitProgress <- function(value, max) {
  stopifnot(!is.null(value))
  stopifnot(!is.null(max))
  stopifnot(value <= max)
  
  shiny::tags$progress(
    class = "uk-progress",
    value = value,
    max = max
  )
} 
