#' Create a UIkit page
#'
#' Build an UIkit Shiny app.
#'
#' @param ... any element.
#' @param title App title.
#' @param rtl Rigth to left support. FALSE by default.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'   ui = UIkitPage(
#'    title = "My UIkit application",
#'    sliderInput("obs", "Number of observations:",
#'     min = 0, max = 1000, value = 500
#'    ),
#'    plotOutput("distPlot")
#'   ),
#'   server = function(input, output) {
#'   output$distPlot <- renderPlot({
#'    hist(rnorm(input$obs))
#'   })
#'   }
#' )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitPage <- function(..., title = NULL, rtl = FALSE){
  
  shiny::tagList(
    # Head
    shiny::tags$head(
      shiny::tags$title(title),
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
      if (isTRUE(rtl)) {
        shiny::tags$link(rel = "stylesheet", text = "text/css", src = "css/uikit.rtl.min.css")
      } else {
        shiny::tags$link(rel = "stylesheet", text = "text/css", src = "css/uikit.min.css") 
      },
      shiny::tags$script(src = "js/uikit.min.js"),
      shiny::tags$script(src = "js/uikit-icons.min.js")
    ),
    # Body 
    ...
  )
}