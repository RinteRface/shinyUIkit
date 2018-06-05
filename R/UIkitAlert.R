#' Create an UIkit alert
#'
#' Build an UIkit alert.
#'
#' @param ... Alert text.
#' @param color Alert color: "primary", "success", "warning", "danger".
#' @param closable Whether to display a close button. TRUE by default.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    h1("Alerts are displayed, if slider > 5"),
#'    sliderInput(
#'     "slider", 
#'     "Number of observations:",
#'      min = 0, 
#'      max = 10, 
#'      value = 2
#'    ),
#'    uiOutput("alerts")
#'  ),
#'  server = function(input, output) {
#'   
#'   output$alerts <- renderUI({
#'    if (input$slider > 5) {
#'     tagList(
#'      UIkitAlert(
#'       color = "primary",
#'       h3("Primary Notice"),
#'       "Lorem ipsum dolor sit amet, consectetur 
#'       adipiscing elit, sed do eiusmod tempor 
#'       incididunt"
#'      ),
#'      UIkitAlert(
#'       color = "danger",
#'       h3("Danger Notice"),
#'       "Lorem ipsum dolor sit amet, consectetur 
#'       adipiscing elit, sed do eiusmod tempor 
#'       incididunt"
#'      ),
#'      UIkitAlert(
#'       color = "warning",
#'       h3("Warning Notice"),
#'       "Lorem ipsum dolor sit amet, consectetur 
#'       adipiscing elit, sed do eiusmod tempor 
#'       incididunt"
#'      )
#'     )
#'    }
#'   })
#'  
#'  }
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitAlert <- function(..., color = NULL, closable = TRUE) {
  
  alertCl <- "uk-width-1-6"
  if (!is.null(color)) alertCl <- paste0(alertCl, " uk-alert-", color) 
  
  alertTag <- shiny::tags$div(
    class = alertCl,
    ...
  )
  
  if (closable) {
    closeButtonTag <- shiny::tags$a(class = "uk-alert-close")
    closeButtonTag$attribs[["uk-close"]] <- NA
    alertTag <- shiny::tagAppendChild(alertTag, closeButtonTag)
  }
  
  alertTag$attribs[["uk-alert"]] <- NA
  alertTag
}