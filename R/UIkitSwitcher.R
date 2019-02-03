#' Create an UIkit switcher nav menu
#'
#' Dynamically transition through different content panes
#' 
#' @param ... Slot for UIkitSwitcherItem.
#' @param animation Apply animation to the switcher content. See \url{https://getuikit.com/docs/animation}.
#' @param mode Switcher mode: "switcher" or "tabs". "tabs" by default.
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
#'      tabName = "tab1",
#'      "Tab content 1"
#'     ),
#'     UIkitSwitcherItem(
#'      tabName = "tab2",
#'      "Tab content 2"
#'     )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSwitcher <- function(..., animation = NULL, mode = "tabs") {
  
  if(is.null(mode)) stop("mode is either 'switcher' or 'tabs'!")
  
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
  
  shiny::tagList(
    if (mode == "switcher") {
      shiny::tags$ul(
        class = "uk-subnav uk-subnav-pill",
        `uk-switcher` = if (!is.null(animation)) {
          paste0("animation: ", " uk-animation-", animation) 
        }else {
          NA
        },
        switcherTabs
      )
    } else {
      shiny::tags$ul(
        `uk-tab` = NA,
        switcherTabs
      )
    },
    shiny::tags$ul(
      class = "uk-switcher uk-margin",
      lapply(X = 1:length(items), function(i) items[[i]]$tag)
    )
  )
 
} 




#' Create an UIkit switcher content item
#'
#' Item to insert in an UI kit tabset
#' 
#' @param ... Any UI element. 
#' @param tabName Switcher item name.
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitSwitcherItem <- function(..., tabName) {
  return(list(name = tabName, tag = shiny::tags$li(..., id = tabName, class = "tab-pane")))
}