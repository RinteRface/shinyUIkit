# shinyUIkit

[![CRAN status](https://www.r-pkg.org/badges/version/shinyUIkit)](https://cran.r-project.org/package=shinyUIkit)
[![Travis build status](https://travis-ci.org/RinteRface/shinyUIkit.svg?branch=master)](https://travis-ci.org/RinteRface/shinyUIkit)

> [UIkit](https://getuikit.com) API for shiny 

[![uikit banner](https://cloud.githubusercontent.com/assets/321047/21769911/474d7d9e-d681-11e6-9fe0-d95f8ccfd3a9.jpg)](http://getuikit.com/)

# Example

```r
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
         
         checkboxGroupInput("variable", "Variables to show:",
                     c("Cylinders" = "cyl",
                       "Transmission" = "am",
                       "Gears" = "gear"))
       )
   ),
   mainPanel = UIkitTabItems(
     id = "container",
     plotOutput("distPlot"),
     tableOutput("data")
   )
 )
 ),
 server = function(input, output) {
   output$distPlot <- renderPlot({
     hist(rnorm(input$obs))
   })
   
   output$data <- renderTable({
    mtcars[, c("mpg", input$variable), drop = FALSE]
  }, rownames = TRUE)
   
 }
)
```

# Note for developers
- This build uses UIkit 3.0.3 (the first release was built on top of 3.0.0 rc 16)
- UIkit tabs do not render shiny output elements by default. Need to add some
[items](https://getbootstrap.com/docs/3.3/javascript/#tabs) from boostrap 3.3.6 to make it run properly. This is not the perfect solution but it works well.