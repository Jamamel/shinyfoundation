#' Accordion for Foundation UI
#'
#' @export
fd_accordion <- function(..., multi_expand = FALSE, all_closed = FALSE) {
  tags$ul(
    class = "accordion",
    `data-accordion` = NA,
    `data-multi-expand` = if (multi_expand) "true" else NULL,
    `data-allow-all-closed` = if (all_closed) "true" else NULL,
    ...
  )
}

#' Accordion item for Foundation UI
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
