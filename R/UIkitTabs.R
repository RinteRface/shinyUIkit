#' Create an UIkit tabset
#'
#' Create a tabbed navigation with different styles
#' 
#' @param ... Slot for UIkitTabsItem.
#' @param align Tab alignement: "center", "right" or NULL (default).
#' @param vertical Whether to display the tab in a vertical mode. FALSE by default.
#' @param bottom Whether to flip tab items to the bottom. FALSE by default.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitTab(
#'     UIkitTabItem(
#'      tabItemName = "tab1",
#'      active = TRUE
#'     ),
#'     UIkitTabItem(
#'      tabItemName = "tab2",
#'      disabled = TRUE
#'     ),
#'     UIkitTabItem(tabItemName = "tab3")
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitTab <- function(..., align = NULL, vertical = FALSE,
                     bottom = FALSE) {
  
  tabCl <- NULL
  if (!is.null(align)) tabCl <- paste0(tabCl, " uk-flex-", align)
  if (isTRUE(vertical)) tabCl <- paste0(tabCl, " uk-tab-right")
  if (isTRUE(bottom)) tabCl <- paste0(tabCl, " uk-tab-bottom")
  
  shiny::tags$ul(
    class = tabCl,
    `uk-tab` = NA,
    ...
  )
} 




#' Create an UIkit tab item
#'
#' Item to insert in an UI kit tabset
#' 
#' @param ... Tab Item content.
#' @param tabItemName Tab item name. 
#' @param active Whether to active the item or not. FALSE by default.
#' @param disabled Whether to disable the tab or not. FALSE by default.
#'
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitTabItem <- function(..., tabItemName = NULL, active = FALSE, disabled = FALSE) {
  
  tabItemCl <- NULL
  if (isTRUE(active)) tabItemCl <- paste0(tabItemCl, " uk-active")
  if (isTRUE(disabled)) tabItemCl <- paste0(tabItemCl, " uk-disabled")
  
  shiny::tags$li(
    class = tabItemCl,
    shiny::tags$a(href = "#", tabItemName),
    ...
  )
}