#' Create an UIkit article
#'
#' Build a container to write articles.
#' 
#' @param ... Article content. 
#' @param title Article title.
#' @param metadata Article meta datas.
#' @param url Url to give more information.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'  ui = UIkitPage(
#'    title = "My UIkit application",
#'    UIkitContainer(
#'     UIkitArticle(
#'       title = "Heading",
#'       metadata = "Written by Super User on 12 April 2012. Posted in Blog",
#'       url = "http://www.google.com",
#'       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
#'       sed do eiusmod tempor incididunt ut labore et dolore magna 
#'       aliqua. Ut enim ad minim veniam, quis nostrud 
#'       exercitation ullamco laboris nisi ut aliquip"
#'      )
#'    )
#'  ),
#'  server = function(input, output) {}
#'  )
#' }
#' 
#' @author David Granjon, \email{dgranjon@@gmail.com}
#'
#' @export
UIkitArticle <- function(..., title = NULL, metadata = NULL, url = NULL) {
  
  footerTag <- shiny::tags$div(
    class = "uk-grid-small uk-child-width-auto",
    shiny::tags$a(class = "uk-button uk-button-text", href = url, "Read more")
  )
  footerTag$attribs[["uk-grid"]] <- NA
  
  articleTag <- shiny::tags$article(
    class = "uk-article",
    shiny::tags$h1(class = "uk-article-title", title),
    shiny::tags$p(class = "uk-article-meta", metadata),
    shiny::tags$p(class = "uk-text-lead", ...)
  )

  articleTag <- shiny::tagAppendChild(articleTag, footerTag)
  
  articleTag
  
} 