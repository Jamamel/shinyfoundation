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
#' @details
#' The types available:
#' \itemize{
#' \item{text}
#' \item{date}
#' \item{datetime}
#' \item{datetime-local}
#' \item{email}
#' \item{month}
#' \item{number}
#' \item{password}
#' \item{search}
#' \item{tel}
#' \item{time}
#' \item{url}
#' \item{week}
#' }
#'
#' @export
fd_text <- function(id, label, value = "", placeholder = NULL, type = "text") {
  if (!type %in% fd_text_types) stop(type, " is not a valid text input type.")

  tags$label(
    class = "shiny-input-container",
    label,
    tags$input(
      type = type, id = id, value = value, placeholder = placeholder
    )
  )
}

fd_text_types <- c(
  "text", "date", "datetime", "datetime-local", "email", "month",
  "number", "password", "search", "tel", "time", "url", "week"
)

#' Text Area Input for Foundation UI
#'
#' @export
fd_textarea <- function(id, label, value = "", placeholder = NULL) {
  tags$label(
    class = "shiny-input-container",
    label,
    tags$textarea(
      type = "text", id = id, value = value, placeholder = placeholder
    )
  )
}

#' Select Input for Foundation UI
#'
#' @export
fd_select <- function(id, label, values, value_labels = values, multiple = FALSE) {
  div(
    class = "shiny-input-container",
    tags$label(label),
    div(
      tags$select(
        multiple = if (multiple) NA else NULL,
        id = id,
        tagList(lapply(seq(values), function(x) {
          tags$option(value = values[x], value_labels[x])
        }))
      )
    )
  )
}

# #' Checkbox Input for Foundation UI
# #'
# #' @export
# fd_checkbox <- function(id, label, values, value_labels = value) {
#   div(
#     class = "shiny-input-checkboxgroup shiny-input-container",
#     tags$fieldset(
#       class = "shiny-options-group",
#       tags$legend(label),
#       tagList(lapply(seq(values), function(x) {
#         rand_id <- paste(sample(c(letters, 0:9), 9, TRUE), collapse = "")
#         tagList(
#           tags$input(type = "checkbox", id = rand_id, name = id, value = values[x]),
#           tags$label(`for` = rand_id, value_labels[x])
#         )
#       }))
#     )
#   )
# }

#' Slider Input for Foundation UI
#'
#' @export
fd_slider <- function(id, label, value, min, max, step = NULL) {
  div(
    class = "grid-x grid-margin-x",
    div(
      class = "cell small-10",
      div(
        class = "slider",
        `data-slider`= NA, `data-slider data-initial-start` = value,
        `data-start` = min, `data-end` = max, `data-step` = step,
        tags$span(
          class = "slider-handle", `data-slider-handle` = NA, role = "slider",
          tabindex = "1", `aria-controls` = id
        ),
        tags$span(class = "slider-fill", `data-slider-fill` = NA)
      )
    ),
    tags$div(
      class = "cell small-2 shiny-input-container",
      tags$input(
        id = id, type = "number", value = value,
        min = min, max = max, step = step
      )
    )
  )
}

#' Help Text for Foundation Inputs
#'
#' @description
#' A piece of text that can be placed underneath an input that can be used
#' to describe what is required for the input.
#'
#' @export
fd_helptext <- function(...) {
  tags$div(class = "help-text", ...)
}
