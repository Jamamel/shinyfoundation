#' Accordion for Foundation UI
#'
#' @description
#' Creates an accordion that can contain accordion items that are individually able to be
#' expanded and collapsed.
#'
#' @param ... Tags of class \code{accordion-item}. Generated from \code{\link{fd_accordion_item}}.
#' @param items A list of tags of class \code{accordion-item}. Generated from \code{\link{fd_accordion_item}}.
#' @param multi_expand Logical, can more than one accordion item be expanded?
#' @param all_closed Logical, should all items be closed on start-up?
#'
#' @source \url{https://foundation.zurb.com/sites/docs/accordion.html}
#'
#' @export
fd_accordion <- function(..., items = NULL, multi_expand = FALSE, all_closed = FALSE) {
  accordion_items <- if (!is.null(items)) items else list(...)

  tags$ul(
    class = "accordion",
    `data-accordion` = NA,
    `data-multi-expand` = if (multi_expand) "true" else NULL,
    `data-allow-all-closed` = if (all_closed) "true" else NULL,
    accordion_items
  )

  }

#' Accordion Item for Foundation UI
#'
#' @description
#' An individual item for the accordion.
#'
#' @param title Title of the item, will be seen when collapsed.
#' @param content Shiny tag containing the UI when the item is opened.
#' @param is_active Logical, should the item be open on start-up?
#'
#' @seealso \code{\link{fd_accordion}}
#'
#' @export
fd_accordion_item <- function(title, content, is_active = FALSE) {
  tags$li(
    class = paste("accordion-item", if(is_active) "is-active"),
    `data-accordion-item` = NA,
    tags$a(href = "#", class = "accordion-title", title),
    tags$div(class = "accordion-content", `data-tab-content` = NA, content)
  )
}
