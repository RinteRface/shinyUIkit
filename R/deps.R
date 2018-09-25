# Add an html dependency, without overwriting existing ones
appendDependencies <- function(x, value) {
  if (inherits(value, "html_dependency"))
    value <- list(value)
  
  old <- attr(x, "html_dependencies", TRUE)
  
  htmltools::htmlDependencies(x) <- c(old, value)
  x
}

# Add dashboard dependencies to a tag object
addDeps <- function(x) {
  
  # put all necessary ressources here
  uikit_js <- "uikit.min.js"
  uikit_icons_js <- "uikit-icons.min.js"
  uikit_css <- "uikit.min.css"
  
  dashboardDeps <- list(
    # bootstrap deps
    htmltools::htmlDependency(
      name = "uikit", 
      version = "3.0.0",
      src = c(file = system.file("uikit-3.0.0", package = "shinyUIkit")),
      script = c(uikit_js, uikit_icons_js),
      stylesheet = uikit_css
    )
  )
  appendDependencies(x, dashboardDeps)
}