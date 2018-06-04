#' Create an UIkit switcher nav menu
#'
#' Dynamically transition through different content panes
#' 
#' @param ... Slot for UIkitSwitcherItem.
#' @param animation Apply animation to the switcher content. See \url{https://getuikit.com/docs/animation}.
#' @param mode Switcher mode: either nav pills or tabs. "switcher" by default.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitSwitcher(
#'     animation = "fade",
#'     mode = "switcher",
#'     UIkitSwitcherItem(
#'      switcherItemName = "tab1"
#'     ),
#'     UIkitSwitcherItem(
#'      switcherItemName = "tab2"
#'     )
#'    ),
#'    
#'    UIkitSwitcherContent(
#'     UIkitSwitcherContentItem(
#'      "Test"
#'     ), 
#'     UIkitSwitcherContentItem(
#'      "blabla"
#'     )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSwitcher <- function(..., animation = NULL, mode = "switcher") {
  
  if (mode == "switcher") {
    shiny::tags$ul(
      class = "uk-subnav uk-subnav-pill",
      `uk-switcher` = if (!is.null(animation)) paste0("animation: ", " uk-animation-", animation) else NA,
      ...
    )
  } else {
    shiny::tags$ul(
      class = "uk-subnav uk-subnav-pill",
      `uk-tab` = if (!is.null(animation)) paste0("animation: ", " uk-animation-", animation) else NA,
      ...
    )
  }
 
} 




#' Create an UIkit switcher nav item
#'
#' Item to insert in an UI kit tabset
#' 
#' @param switcherItemName Switcher item name. 
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSwitcherItem <- function(switcherItemName = NULL) {
 shiny::tags$li(
   shiny::tags$a(
     href = "#",
     switcherItemName
   )
 )
}



#' Create an UIkit switcher content menu
#'
#' Item to insert in an UI kit tabset
#' 
#' @param ... Slot for  UIkitSwitcherContentItem.
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSwitcherContent <- function(...) {
 shiny::tags$ul(
   class = "uk-switcher uk-margin",
   ...
 )
}




#' Create an UIkit switcher content item
#'
#' Item to insert in an UI kit tabset
#' 
#' @param ... Any UI element. 
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitSwitcherContentItem <- function(...) {
  shiny::tags$li(...)
}