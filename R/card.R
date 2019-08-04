#' Cards for Foundation UI
#'
#' @export
fd_card <- function(header, body) {
  shiny::div(
    class = "card",
    shiny::div(class = "card-divider", header),
    shiny::div(class = "card-content", body)
  )
}
