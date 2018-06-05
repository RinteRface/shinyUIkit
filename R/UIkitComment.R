#' Create an UIkit comment
#'
#' Build a container to write comments.
#' 
#' @param ... Comment element. 
#' @param src Comment image path, if any.
#' @param author Comment author.
#' @param date Comment date.
#' @param style Comment style: NULL by default or "primary".
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitGrid(
#'     child_width = "1-2",
#'     UIkitComment(
#'       src = "https://getuikit.com/docs/images/avatar.jpg",
#'       author = "Germaine",
#'       date = "12 days ago",
#'       "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
#'       sed diam nonumy eirmod tempor invidunt ut labore et dolore 
#'       magna aliquyam erat, sed diam voluptua. At vero eos et accusam 
#'       et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
#'       no sea takimata sanctus est Lorem ipsum dolor sit amet."
#'      ),
#'      UIkitComment(
#'       style = "primary",
#'       src = "https://getuikit.com/docs/images/avatar.jpg",
#'       author = "Germaine",
#'       date = "12 days ago",
#'       "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, 
#'       sed diam nonumy eirmod tempor invidunt ut labore et dolore 
#'       magna aliquyam erat, sed diam voluptua. At vero eos et accusam 
#'       et justo duo dolores et ea rebum. Stet clita kasd gubergren, 
#'       no sea takimata sanctus est Lorem ipsum dolor sit amet."
#'      )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @export
UIkitComment <- function(..., src = NULL, author = NULL, date = NULL,
                         style = NULL) {
  
  headerTag <- shiny::tags$header(
    class = "uk-comment-header uk-grid-medium uk-flex-middle",
    
    # image
    shiny::tags$div(
      class = "uk-width-auto",
      shiny::tags$img(
        class = "uk-comment-avatar",
        src = src,
        width = "80",
        height = "80"
      )
    ),
    
    # author/date
    shiny::tags$div(
      class = "uk-width-expand",
      shiny::tags$h4(
        class = "uk-comment-title uk-margin-remove",
        shiny::tags$a(class = "uk-link-reset", href = "#", author)
      ),
      shiny::tags$ul(
        class = "uk-comment-meta uk-subnav uk-subnav-divider uk-margin-remove-top",
        shiny::tags$li(shiny::tags$a(href = "#", date))
      )
    )
    
  )
  
  headerTag$attribs[["uk-grid"]] <- NA
  
  bodyTag <- shiny::tags$div(
    class = "uk-comment-body",
    ...
  )
  
  commentTag <- shiny::tags$article(
    class = if (!is.null(style)) paste0("uk-comment", "-", style) else "uk-comment"
  )
  
  commentTag <- shiny::tagAppendChildren(commentTag, headerTag, bodyTag)
  
  commentTag
  
} 