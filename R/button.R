#' Button for Foundation UI
#'
#' @description
#' Creates a button that either is a link or performs an action when clicked.
#'
#' @param id The \code{input} slot that will be used to access the value.
#' @param label The contents of the button or link.
#' @param link The URL/path to direct the user to.
#' @param class Additional styles to add to the class. This can include (but not limited to):
#' \describe{
#' \item{\code{expanded}}{The button takes up the full available width.}
#' \item{\code{tiny}, \code{small}, \code{large}}{Changes the size of the button.}
#' \item{\code{primary}, \code{secondary}, \code{success}, \code{alert}, \code{warning}}{Changes the colour of the button.}
#' \item{\code{hollow}}{Turns the button to a hollow/non-block colour style.}
#' \item{\code{clear}}{Turns the button to a clear style, almost like a link with padding.}
#' }
#' @param disabled Logical. Should the button be disabled?
#' @param ... Named attributes to be applied to the button
#'
#' @rdname fd_button
#' @source \url{https://foundation.zurb.com/sites/docs/button.html}
#'
#' @export
fd_action_button <- function(id, label, class = NULL, disabled = FALSE, ...) {
  tags$button(
    id = id,
    class = paste("button", class, "action-button"),
    ...,
    diabled = if (disabled) NA else NULL,
    label
  )
}

#' @rdname fd_button
#' @export
fd_link_button <- function(id, label, link, class = NULL, ...) {
  tags$a(
    id = id,
    class = paste("button", if (disabled) "disabled", class),
    href = link,
    `aria-disabled` = if (disabled) NA else NULL,
    ...,
    label
  )
}

#' Button Group for Foundation UI
#'
#' @export
fd_buttongroup <- function(..., even = FALSE, stack = NULL) {
  group_class <- "button-group"
  if (even) group_class <- paste("expanded", group_class)
  if (!is.null(stack)) group_class <- paste("stacked-for-medium", group_class)

  tags$div(
    class = group_class,
    ...
  )
}
