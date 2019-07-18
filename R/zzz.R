# Adding the foundation JS/CSS to shiny resource paths
.onLoad <- function(libname, pkgname) {
  # Add directory for static resources
  file <- system.file("www/foundation/6.5.1", package = "shiny.foundation", mustWork = TRUE)
  shiny::addResourcePath("foundation", file)
}
