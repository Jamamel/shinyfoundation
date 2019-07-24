#' Divider for Foundation UI
#'
#' @export
fd_divider <- function() {
  tags$hr()
}

#' Blockquote for Foundation UI
#'
#' @export
fd_blockquote <- function(text, person) {
  tags$blockquote(
    text,
    tags$cite(person)
  )
}

#' Abbreviations for Foundation UI
#'
#' @export
fd_abbreviation <- function(short, full) {
  tags$abbr(title = full, short)
}
