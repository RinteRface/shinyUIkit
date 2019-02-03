#' Create an UIkit navigation bar container
#'
#' Create a navigation bar that can be used for your main site navigation
#' 
#' @param ... Slot for UIkitNavMenu.
#' @param transparent Navbar transparency. FALSE by default.
#' @param mode Way to trigger navbar elements: NULL by default (on hover) but also "click".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    navbar = UIkitNavbar(
#'      UIkitNavMenu(
#'        sidebarTrigger = TRUE, 
#'        sidebarId = "mysidebar",
#'        position = "center",
#'        UIkitNavItems(
#'          id = "container",
#'          #mode = "tabs",
#'          UIkitNavItem(tabName = "item1"),
#'          UIkitNavItem(tabName = "item2")
#'        )
#'      )
#'    ),
#'    UIkitSidebarLayout(
#'      sidebarPanel = UIkitSidebar(
#'        id = "mysidebar",
#'        tagList(
#'          h3("Test Sidebar"),
#'          "Lorem ipsum dolor sit amet, consectetur adipiscing 
#'          elit, sed do eiusmod tempor incididunt ut labore et 
#'          dolore magna aliqua. Ut enim ad minim veniam, quis 
#'          nostrud exercitation ullamco laboris nisi ut aliquip 
#'          ex ea commodo consequat.",
#'          sliderInput("obs", "Number of observations:",
#'                      min = 0, max = 1000, value = 500
#'          ),
#'          radioButtons(
#'            "dist", 
#'            "Distribution type:",
#'            c("Normal" = "norm",
#'              "Uniform" = "unif",
#'              "Log-normal" = "lnorm",
#'              "Exponential" = "exp"
#'            )
#'          )
#'        )
#'    ),
#'    mainPanel = UIkitTabItems(
#'      id = "container",
#'      plotOutput("distPlot"),
#'      plotOutput("plot")
#'    )
#'  )
#'  ),
#'  server = function(input, output) {
#'    output$distPlot <- renderPlot({
#'      hist(rnorm(input$obs))
#'    })
#'    output$plot <- renderPlot({
#'      dist <- switch(
#'        input$dist,
#'        norm = rnorm,
#'        unif = runif,
#'        lnorm = rlnorm,
#'        exp = rexp,
#'        rnorm
#'      )
#'      hist(dist(500))
#'    })
#'   }
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavbar <- function(..., transparent = FALSE, mode = NULL) {
  
  navbarCl <- "uk-navbar-container"
  if (isTRUE(transparent)) navbarCl <- paste0(navbarCl, " uk-navbar-transparent")
  
  shiny::tags$nav(
    class = navbarCl,
    `uk-navbar` = if (!is.null(mode)) paste0("mode:", mode) else NA,
    ...
  )
}



#' Create an UIkit navigation bar
#'
#' To insert in a UIkitNavbar container
#' 
#' @param ... Slot for UIkitNavbarParent, UIkitNavbarChild and UIkitNavbarDropdown.
#' @param position Navbar position: "left", "center" or "right".
#' @param sidebarTrigger Whether to display the sidebar trigger. FALSE by default.
#' @param sidebarId Sidebar id (unique). Share a common id with the sidebar trigger
#' and the sidebar itself.
#' @param logo Sidebar logo.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavMenu <- function(..., position = "left", sidebarTrigger = FALSE,
                         sidebarId = NULL, logo = "home") {
  
  shiny::tagList(
    shiny::tags$div(
      class = paste0("uk-navbar-", position),
      
      # brand logo
      shiny::tags$a(
        class = "uk-navbar-item uk-logo",
        shiny::tags$span(
          class = "uk-icon uk-margin-small-right",
          UIkitIcon(icon = logo)
        )
      ),
      
      #shiny::tags$ul(
      #  class = "uk-navbar-nav",
        #`uk-tab` = "connect: #component-nav",
        # content
        ...
      #)
    ),
    
    # sidebar trigger item if any
    if (isTRUE(sidebarTrigger)) {
      shiny::tags$div(
        class = paste0("uk-navbar-right"),
        shiny::tags$ul(
          class = "uk-navbar-nav",
          UIkitNavElem(
            shiny::tags$a(
              class = "uk-navbar-item uk-logo",
              href = paste0("#", sidebarId), 
              `uk-toggle` = NA, 
              UIkitIcon(icon = "cog")
            )
          )
        )
      )
    }
  )
}


#' Create an UIkit navigation bar item
#'
#' To insert in any item in a navigation bar
#' 
#' @param ... Any element (input, icon, ... logo).
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
UIkitNavElem <- function(...) {
  shiny::tags$div(
    class = "uk-navbar-item",
    ...
  )
}




#' Create an UIkit navigation bar tabSet
#'
#' To insert in a navigation bar.
#' 
#' @param ... slot for UIkitNavItem.
#' @param id unique id.
#' @param animation Apply animation to the switcher content. See \url{https://getuikit.com/docs/animation}.
#' @param mode NavItems mode: "switcher" or "tabs". "tabs" by default.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavItems <- function(..., id, animation = NULL, mode = "switcher") {
  
  if(is.null(mode)) stop("mode is either 'switcher' or 'tabs'!")
  
  uk_switcherAttr <- paste0("connect: #", id)
  if (!is.null(animation)) {
    uk_switcherAttr <- paste0(uk_switcherAttr ," animation: ", " uk-animation-", animation) 
  }
  
  # create the tab menu
  items <- list(...)
  switcherTabs <- lapply(X = 1:length(items), FUN = function(i) {
    current_item_name <- items[[i]]$name
    shiny::tags$li(
      shiny::tags$a(
        href = paste0("#", current_item_name),
        `data-toggle` = "tab",
        current_item_name
      )
    )
  })
  
  if (mode == "switcher") {
    shiny::tags$ul(
      class = "uk-subnav uk-subnav-pill",
      `uk-switcher` = uk_switcherAttr,
      switcherTabs
    )
  } else {
    shiny::tags$ul(
      `uk-tab` = uk_switcherAttr,
      switcherTabs
    )
  }
}



#' Create an UIkit navigation bar item
#'
#' Item to insert in an UIkitNavItems
#' 
#' @param ... Any UI element. 
#' @param tabName Switcher item name.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavItem <- function(tabName) {
  return(list(name = tabName))
}


# #' Create an UIkit navigation bar child element
# #'
# #' To insert in a navigation bar
# #' 
# #' @param childName nav item name.
# #' @param active Whether the item is active or not. FALSE by default.
# #' 
# #' @author David Granjon, \email{dgranjon@@ymail.com}
# #'
# #' @export
# UIkitNavbarChild <- function(childName = NULL, active = FALSE) {
#   shiny::tags$li(
#     class = if (isTRUE(active)) "uk-active" else NULL,
#     shiny::tags$a(href = "#", childName)
#   )
# }
# 
# 
# 
# 
# 
# #' Create an UIkit dropdown menu for a navbar
# #'
# #' To insert in a navigation bar
# #' 
# #' @param ... Any element (input, icon, ... logo), UIkitNavbarDivider, UIkitNavbarChild, UIkitNavbarParent.
# #' @param dropdownName Dropdown name.
# #' 
# #' @author David Granjon, \email{dgranjon@@ymail.com}
# #'
# #' @export
# UIkitNavbarDropdown <- function(..., dropdownName) {
#   shiny::tags$li(
#     shiny::tags$a(
#       href = "#", 
#       shiny::tags$span(`uk-icon` = "icon:  triangle-down"),
#       dropdownName
#     ),
#     shiny::tags$div(
#       class = "uk-navbar-dropdown",
#       shiny::tags$ul(
#         class = "uk-nav uk-navbar-dropdown-nav",
#         ...
#       )
#     )
#   )
# }




#' Create an UIkit navbar divider 
#'
#' Perfect to insert in a navbar dropdown
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavbarDivider <- function() {
  shiny::tags$li(class = "uk-nav-divider")
}




#' Create an UIkit navbar header 
#'
#' Perfect to insert in a navbar dropdown to sort dropdown items
#' 
#' @param headerName Header name.
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitNavbarHeader <- function(headerName = NULL) {
  shiny::tags$li(class = "uk-nav-header", headerName)
} 