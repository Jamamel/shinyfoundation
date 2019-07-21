#' Button for Foundation UI
#'
#' @export
fd_button <- function(id, label, style = NULL, type = NULL) {
  tags$button(
    id = id,
    class = paste(style, "button", type, "action-button"),
    label
  )
}

#' Button Group for Foundation UI
#'
#' @export
fd_buttongroup <- function(..., even = FALSE, stack = NULL) {
  buttons <- as.list(...)

  group_class <- "button-group"
  if (even) group_class <- paste("expanded", group_class)
  if (!is.null(stack)) group_class <- paste("stacked-for-medium", group_class)

  tags$div(
    class = group_class,
    ...
  )
}
