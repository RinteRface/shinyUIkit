#' Create an UIkit description list
#'
#' Easily create nice looking description lists, which come in different styles
#' 
#' @param ... Slot dor UIkitDescriptionListItem.
#' @param divider Whether to display a vertical divider between items. FALSE by default.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitDescriptionList(
#'     divider = TRUE,
#'     UIkitDescriptionListItem(
#'      title = "Description term",
#'      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
#'     ),
#'     UIkitDescriptionListItem(
#'      title = "Description term",
#'      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
#'     ),
#'     UIkitDescriptionListItem(
#'      title = "Description term",
#'      "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
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
UIkitDescriptionList <- function(..., divider = FALSE) {
  shiny::tags$dl(
    class = if (isTRUE(divider)) {
      "uk-description-list uk-description-list-divider" 
    }
    else {
      "uk-description-list"
    },
    ...
  )
} 




#' Create an UIkit description list item
#'
#' 
#' @param ... Item content.
#' @param title Item title

#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitDescriptionListItem <- function(..., title) {
  shiny::tagList(
    shiny::tags$dt(title),
    shiny::tags$dd(...)
  )
}