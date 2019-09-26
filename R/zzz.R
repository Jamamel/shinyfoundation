# Adding the foundation JS/CSS to shiny resource paths
.onLoad <- function(libname, pkgname) {
  # Add directory for static resources
  file <- system.file("www/foundation/6.5.1", package = "shinyfoundation", mustWork = TRUE)
  shiny::addResourcePath("foundation", file)
}

#' Run Foundation Example App
#'
#' @description
#' Runs the shiny app showing examples of all the UI features for the Foundation framework.
#'
#' @export
run_fd_example <- function() {
  example_dir <- system.file("example", package = "shinyfoundation")
  shiny::runApp(example_dir)
}


#' @importFrom shiny tags tagList
#'
#' @docType package
NULL
