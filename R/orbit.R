#' Orbit for Foundation UI
#'
#' @export
fd_orbit <- function(..., label = "Orbit", options = NULL, slide_style = NULL) {
  slides <- list(...)

  orbit_slides <- lapply(seq(length(slides)), function(x) {
    tags$li(
      class = paste0(if(x == 1) "is-active ", "orbit-slide"),
      slides[[x]]
    )
  })

  orbit_bullets <- lapply(seq(length(slides)) - 1, function(x) {
    if (x == 0) tags$button(class = "is-active", `data-slide` = x) else tags$button(`data-slide` = x)
  })

  shiny::div(
    class = "orbit", role = "region", `aria-label` = label, `data-orbit` = NA,

    shiny::div(
      class = "orbit-wrapper",

      shiny::div(
        class = "orbit-controls",
        tags$button(class = "orbit-previous", "&#9664;&#xFE0E;"),
        tags$button(class = "orbit-next", "&#9654;&#xFE0E;")
      ),

      tags$ul(
        class = "orbit-container", style = slide_style,
        orbit_slides
      )
    ),

    tags$nav(
      class = "orbit-bullets",
      orbit_bullets
    )
  )
}
