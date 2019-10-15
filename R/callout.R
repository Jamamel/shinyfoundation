#' Callout for Foundation UI
#'
#' @description
#' A
#'
#' @param ... tags of the contents of the callout.
#' @param class Option to add the type of
#'
#' @examples
#' fd_callout(
#'   tags$p("This is an example callout")
#' )
#'
#' @export
fd_callout <- function(..., class = "", closable = FALSE) {
  if(isTRUE(closable)) {
    close_class <- NA
  } else if (identical(closable, FALSE)) {
    close_class <- NULL
  } else {
    close_class <- closable
  }

  shiny::div(
    class = paste("callout", class),
    `data-closable` = close_class,
    ...
  )
}
