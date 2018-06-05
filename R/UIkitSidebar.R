#' Create an UIkit sidebar layout
#'
#' Create a sidebarLayout similar to the original sidebarLayout in shiny
#' 
#' @param sidebarPanel Slots for the UIkitSidebar.
#' @param mainPanel Slot for UIkitSidebarTrigger and the content of
#' your app.
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  
#'  shiny::shinyApp(
#'   ui = UIkitPage(
#'     title = "My UIkit application",
#'     UIkitSidebarLayout(
#'      mainPanel = UIkitGrid(
#'       plotOutput("plot"),
#'       UIkitSidebarTrigger(id = "mysidebar")
#'      ), 
#'      sidebarPanel = UIkitSidebar(
#'       id = "mysidebar",
#'       tagList(
#'        h3("Test Sidebar"),
#'        "Lorem ipsum dolor sit amet, consectetur adipiscing 
#'        elit, sed do eiusmod tempor incididunt ut labore et 
#'        dolore magna aliqua. Ut enim ad minim veniam, quis 
#'        nostrud exercitation ullamco laboris nisi ut aliquip 
#'        ex ea commodo consequat.",
#'        sliderInput("obs", "Number of observations:",
#'         min = 0, max = 1000, value = 500
#'       )
#'      )
#'     )
#'    )
#'   ),
#'   server = function(input, output) {
#'    output$plot <- renderPlot({
#'     hist(rnorm(input$obs))
#'    })
#'   }
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSidebarLayout <- function(sidebarPanel, mainPanel) {
  shiny::tags$div(
    class = "uk-offcanvas-content",
    mainPanel,
    sidebarPanel
  )
} 



#' Create an UIkit sidebar
#'
#' Create an off-canvas sidebar that slides in and out of the page, 
#' which is perfect for creating mobile navigations
#' 
#' @param ... Any UI elements.
#' @param id Sidebar id (should be unique).
#' @param overlay Whether to blank out the page when the sidebar is open.
#' TRUE by default.
#' @param flip Whether to open the sidebar on the right side. TRUE by default.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSidebar <- function(..., id, overlay = TRUE, flip = TRUE) {
  
  stopifnot(!is.null(id))
  
  offCanvas <- NULL
  if (isTRUE(overlay)) offCanvas <- paste0(offCanvas, " overlay: true;")
  if (isTRUE(flip)) offCanvas <- paste0(offCanvas, " flip: true;")
  
  shiny::tags$div(
    id = id, 
    `uk-offcanvas` = offCanvas,
    shiny::tags$div(
      class = "uk-offcanvas-bar",
      shiny::tags$button(
        class = "uk-offcanvas-close",
        type = "button",
        `uk-close` = NA
      ),
      ...
    )
  )
} 


#' Create an UIkit sidebar trigger element
#'
#' A button to trigger the sidebar
#' 
#' @param id Sidebar id to toggle (should be unique).
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSidebarTrigger <- function(id) {
  
  stopifnot(!is.null(id))
  
  shiny::tags$button(
    class = "uk-button uk-button-default uk-button-small",
    `uk-toggle` = paste0("target:", " #", id),
    type = "button",
    UIkitIcon(icon = "cog")
  )
}