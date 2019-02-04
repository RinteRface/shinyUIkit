library(shiny)
shiny::shinyApp(
  ui = UIkitPage(
    title = "My UIkit application",
    UIkitSwitcher(
      #animation = "scale-up",
      mode = "switcher",
      UIkitSwitcherItem(
        tabName = "tab1",
        UIkitSortable(
          UIkitSortableItem(
            UIkitCard(
              width = NULL,
              title = "Plot Ouput",
              hover = TRUE,
              horizontal = FALSE,
              body = tagList(
                sliderInput(
                  "obs", 
                  "Number of observations:",
                  min = 0, 
                  max = 1000, 
                  value = 500
                ),
                plotOutput("distPlot")
              )
            )
          ),
          UIkitSortableItem(
            UIkitCard(
              width = NULL,
              title = "Plot Ouput",
              hover = TRUE,
              horizontal = FALSE,
              body = tagList(
                radioButtons(
                  "dist", "Distribution type:",
                  c("Normal" = "norm",
                    "Uniform" = "unif",
                    "Log-normal" = "lnorm",
                    "Exponential" = "exp")
                ),
                plotOutput("plot")
              )
            )
          )
        )
      ),
      UIkitSwitcherItem(
        tabName = "tab2",
        checkboxGroupInput(
          "variable", 
          "Variables to show:",
                           c("Cylinders" = "cyl",
                             "Transmission" = "am",
                             "Gears" = "gear")
          ),
        tableOutput("data")
      ),
      UIkitSwitcherItem(
        tabName = "tab3",
        "some test"
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
    }, execOnResize = TRUE)
    
    output$data <- renderTable({
      mtcars[, c("mpg", input$variable), drop = FALSE]
    }, rownames = TRUE)
    
  }
)

