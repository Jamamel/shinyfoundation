#' Basic Page for Foundation UI
#'
#' @description
#' Creates a Shiny UI page that load s the CSS and JavaScript for Foundation.
#'
#' @param ... The contents of the document body.
#'
#' @export
foundationPage <- function(...) {
  htmltools::attachDependencies(
    shiny::tagList(
      ...,
      tags$script("$(document).foundation()")
    ),
    foundationLib()
  )
}

#' Library location for foundation framework
#'
#' @export
foundationLib <- function() {
  htmltools::htmlDependency(
    "foundation", "6.5.1",
    c(
      href = "foundation",
      file = system.file("www/foundation/6.5.1", package = "shiny.foundation")
    ),
    script = c("js/foundation.min.js", "js/what-input.js"),
    stylesheet = "css/foundation.min.css"
  )
}
