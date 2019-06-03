library(shiny)
library(shinyUIkit)

shiny::shinyApp(
  ui = UIkitPage(
    title = "My UIkit application",
    navbar = UIkitNavbar(
      UIkitNavMenu(
        sidebarTrigger = TRUE, 
        sidebarId = "mysidebar",
        position = "center",
        UIkitNavItems(
          id = "container",
          #mode = "tabs",
          UIkitNavItem(tabName = "item1"),
          UIkitNavItem(tabName = "item2")
        )
      )
    ),
    UIkitSidebarLayout(
      sidebarPanel = UIkitSidebar(
        id = "mysidebar",
        tagList(
          h3("Test Sidebar"),
          "Lorem ipsum dolor sit amet, consectetur adipiscing 
         elit, sed do eiusmod tempor incididunt ut labore et 
         dolore magna aliqua. Ut enim ad minim veniam, quis 
         nostrud exercitation ullamco laboris nisi ut aliquip 
         ex ea commodo consequat.",
          sliderInput("obs", "Number of observations:",
                      min = 0, max = 1000, value = 500
          ),
          radioButtons(
            "dist", 
            "Distribution type:",
            c("Normal" = "norm",
              "Uniform" = "unif",
              "Log-normal" = "lnorm",
              "Exponential" = "exp"
            )
          )
        )
      ),
      mainPanel = UIkitTabItems(
        id = "container",
        plotOutput("distPlot"),
        plotOutput("plot")
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
    output$plot <- renderPlot({
      dist <- switch(
        input$dist,
        norm = rnorm,
        unif = runif,
        lnorm = rlnorm,
        exp = rexp,
        rnorm
      )
      hist(dist(500))
    })
  }
)