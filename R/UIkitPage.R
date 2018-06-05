#' Create an UIkit page
#'
#' Build an UIkit Shiny app.
#'
#' @param ... any element.
#' @param title App title.
#' @param navbar Navbar content, if any.
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
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitPage <- function(..., title = NULL, navbar = NULL, rtl = FALSE){
  
  shiny::tagList(
    # Head
    shiny::tags$head(
      shiny::tags$title(title),
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(
        name = "viewport", 
        content = "width=device-width, initial-scale=1"
      ),
      if (isTRUE(rtl)) {
        shiny::includeCSS(system.file("css/uikit.rtl.min.css", package = "shinyUIkit"))
      } else {
        shiny::includeCSS(system.file("css/uikit.min.css", package = "shinyUIkit")) 
      },
      shiny::includeScript(system.file("js/uikit.min.js", package = "shinyUIkit")),
      shiny::includeScript(system.file("js/uikit-icons.min.js", package = "shinyUIkit"))
    ),
    # Body 
    if (!is.null(navbar)) {
      navbar
    },
    ...
  )
}