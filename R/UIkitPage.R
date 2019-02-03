#' Create an UIkit page
#'
#' Build an UIkit Shiny app.
#'
#' @param ... any element.
#' @param title App title.
#' @param navbar Navbar content, if any.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' library(shinyUIkit)
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
UIkitPage <- function(..., title = NULL, navbar = NULL){
  
  shiny::tagList(
    # Head
    shiny::tags$head(
      shiny::tags$title(title),
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(
        name = "viewport", 
        content = "width=device-width, initial-scale=1"
      ),
      # we need bootstrap.min.js to display tab content
      # otherwise shiny will keep output hidden
      # need to trigger show event
      shiny::bootstrapLib()
    ),
    # Body 
    addDeps(
      shiny::tagList(
        if (!is.null(navbar)) navbar,
        shiny::tags$br(),
        UIkitContainer(...)  
      )
    )
  )
}