#' Dropdown for Foundation UI
#'
#' @export
fd_dropdown <- function() {

}

#' Numeric Input for Foundation UI
#'
#' @examples
#' if (interactive()) {
#'   ui <- fd_page(
#'     fd_numeric("test_num", "Number", 5, min = 1, max = 10),
#'     shiny::textOutput("out_num")
#'   )
#'
#'   server <- function(input, output) {
#'     output$out_num <- shiny::renderText(input$test_num)
#'   }
#' }
#'
#' @export
fd_numeric <- function(id, label, value, min = NULL, max = NULL, step = NULL) {
  tags$label(
    class = "shiny-input-container", label,
    tags$input(
      type = "number", id = id, value = value,
      min = min, max = max, step = step
    )
  )
}

#' Text Input for Foundation UI
#'
#' @export
fd_text <- function(id, label, value = "", placeholder = NULL) {
  tags$label(
    class = "shiny-input-container",
    label,
    tags$input(
      type = "text", id = id, value = value, placeholder = placeholder
    )
  )
}

#' Select Input for Foundation UI
#'
#' @export
fd_select <- function(id, label, values, value_labels = values) {
  div(
    class = "shiny-input-container",
    tags$label(label),
    div(
      tags$select(
        id = id,
        tagList(lapply(seq(values), function(x) {
          tags$option(value = values[x], value_labels[x])
        }))
      )
    )
  )
}
