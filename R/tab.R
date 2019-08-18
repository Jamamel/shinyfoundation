#' Tab Panel for Foundation UI
#'
#' @export
fd_tabpanel <- function(id, ..., .tabs) {
  tab_items <- if (!is.null(.tabs)) .tabs else as.list(...)

  # Check if more than one tab is active

  tagList(
    # Header
    tags$ul(
      class = "tabs", `data-tabs` = NA, id = id,
      lapply(seq(tab_items), function(x) {

      })
    ),

    # Content
    div(
      class = "tabs-content",
      lapply(seq(tab_items), function(x) {

      })
    )
  )
}

#' Tab for Foundation UI
#'
#' @export
fd_tab <- function(id, title, ..., is_active = FALSE) {
  structure(
    list(
      title = title,
      content = div(
        id = id, ..., class = "tab-panel"
      )
    ),
    class = "fd_tab"
  )
}
