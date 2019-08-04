#' Callout for Foundation UI
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
