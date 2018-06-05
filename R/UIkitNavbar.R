#' Create an UIkit navigation bar container
#'
#' Create a navigation bar that can be used for your main site navigation
#' 
#' @param ... Slot for UIkitNavbarnav.
#' @param transparent Navbar transparency. FALSE by default.
#' @param mode Way to trigger navbar elements: NULL by default (on hover) but also "click".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' shiny::shinyApp(
#'   ui = UIkitPage(
#'     title = "My UIkit application",
#'     
#'     UIkitSidebarLayout(
#'       sidebarPanel = UIkitSidebar(
#'         id = "mysidebar",
#'         tagList(
#'           h3("Test Sidebar"),
#'           "Lorem ipsum dolor sit amet, consectetur adipiscing 
#'           elit, sed do eiusmod tempor incididunt ut labore et 
#'           dolore magna aliqua. Ut enim ad minim veniam, quis 
#'           nostrud exercitation ullamco laboris nisi ut aliquip 
#'           ex ea commodo consequat.",
#'           sliderInput("obs", "Number of observations:",
#'                       min = 0, max = 1000, value = 500
#'           )
#'         )
#'     ),
#'     mainPanel = UIkitNavbar(
#'       UIkitNavbarnav(
#'         sidebarTrigger = TRUE, 
#'         sidebarId = "mysidebar",
#'         position = "center",
#'         UIkitNavbarParent(
#'           parentName = "Parent"
#'         ),
#'         UIkitNavbarChild(
#'           childName = "Child",
#'           active = TRUE
#'         ),
#'         UIkitNavbarDropdown(
#'           dropdownName = "Dropdown",
#'           UIkitNavbarHeader("Group 1"),
#'           UIkitNavbarChild(
#'             childName = "item 1"
#'           ),
#'           UIkitNavbarChild(
#'             childName = "item 2"
#'           ),
#'           UIkitNavbarDivider(),
#'           UIkitNavbarHeader("Group 2"),
#'           UIkitNavbarChild(
#'             childName = "item 3"
#'           ),
#'           UIkitNavbarChild(
#'             childName = "item 4"
#'           )
#'         )
#'       )
#'     )
#'   )
#'   ),
#'   server = function(input, output) {}
#'   )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbar <- function(..., transparent = FALSE, mode = NULL) {
  
  navbarCl <- "uk-navbar-container"
  if (isTRUE(transparent)) navbarCl <- paste0(navbarCl, " uk-navbar-transparent")
  
  shiny::tags$nav(
    class = navbarCl,
    `uk-navbar` = if (!is.null(mode)) {if (mode == "click") "mode: click"} else NA,
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
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarnav <- function(..., position = "left", sidebarTrigger = FALSE,
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
      
      shiny::tags$ul(
        class = "uk-navbar-nav",
        `uk-tab` = "connect: #component-nav",
        # content
        ...
      )
    ),

    # sidebar trigger item if any
    if (isTRUE(sidebarTrigger)) {
      shiny::tags$div(
        class = paste0("uk-navbar-right"),
        shiny::tags$ul(
          class = "uk-navbar-nav",
          UIkitNavbarItem(
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




#' Create an UIkit navigation bar parent element
#'
#' To insert in a navigation bar. Can contain several subitems
#' 
#' @param parentName nav item name.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarParent <- function(parentName = NULL) {
  shiny::tags$li(
    class = "uk-parent",
    shiny::tags$a(href = "#", parentName)
  )
}




#' Create an UIkit navigation bar child element
#'
#' To insert in a navigation bar
#' 
#' @param childName nav item name.
#' @param active Whether the item is active or not. FALSE by default.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarChild <- function(childName = NULL, active = FALSE) {
  shiny::tags$li(
    class = if (isTRUE(active)) "uk-active" else NULL,
    shiny::tags$a(href = "#", childName)
  )
}



#' Create an UIkit navigation bar item
#'
#' To insert in any item in a navigation bar
#' 
#' @param ... Any element (input, icon, ... logo).
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarItem <- function(...) {
  shiny::tags$div(
    class = "uk-navbar-item",
    ...
  )
}



#' Create an UIkit dropdown menu for a navbar
#'
#' To insert in a navigation bar
#' 
#' @param ... Any element (input, icon, ... logo), UIkitNavbarDivider, UIkitNavbarChild, UIkitNavbarParent.
#' @param dropdownName Dropdown name.
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarDropdown <- function(..., dropdownName) {
  shiny::tags$li(
    shiny::tags$a(
      href = "#", 
      shiny::tags$span(`uk-icon` = "icon:  triangle-down"),
      dropdownName
    ),
    shiny::tags$div(
      class = "uk-navbar-dropdown",
      shiny::tags$ul(
        class = "uk-nav uk-navbar-dropdown-nav",
        ...
      )
    )
  )
}




#' Create an UIkit navbar divider 
#'
#' Perfect to insert in a navbar dropdown
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
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
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitNavbarHeader <- function(headerName = NULL) {
  shiny::tags$li(class = "uk-nav-header", headerName)
} 