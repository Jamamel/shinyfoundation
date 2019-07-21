#' Tab Panel for Foundation UI
#'
#' @export
fd_tabpanel <- function(id, tabs) {


  tagList(
    # Header
    tags$ul(
      class = "tabs", `data-tabs` = NA, id = id,
      lapply(seq(tabs), function(x) {

      })
    ),

    # Content
    div(
      class = "tabs-content"
    )
  )
}
