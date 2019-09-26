#' Foundation UI Grid
#'
#' @description
#' The UI grid is based off Foundation's XY-Grid. This allows the grid to either be set by columns or rows.
#'
#' @param ... Elements to include within the grid
#' @param direction Which direction should the elements go, can either be \code{x} or \code{y}
#' @param margin,padding Which direction
#' @param n_cells Only works when working with columns. The number of cells in each column.
#' The default will be that a cell takes up the full width.
#'
#' @examples
#' fd_container(
#'   fd_grid(
#'     n_cells = 3,
#'     fd_cell("Cell 1"),
#'     fd_cell("Cell 2"),
#'     fd_cell("Cell 3")
#'   )
#' )
#'
#' @source \url{https://foundation.zurb.com/sites/docs/xy-grid.html}
#'
#' @export
fd_grid <- function(..., direction = "x", margin = "", padding = "", n_cells = NULL) {
  # Checking have used x/y
  # direction <- match.arg(direction, c("x", "y"))
  # margin <- match.arg(margin, c("", "x", "y", "xy", "yx"))
  # padding <- match.arg(padding, c("", "x", "y", "xy", "yx"))

  # Setting up grid class
  grid_class <- paste0("grid-", direction)
  if (margin != "") {
    grid_class <- paste(grid_class, paste0("grid-margin-", strsplit(margin, "")[[1]], collapse = " "))
  }
  if (padding != "") {
    grid_class <- paste(grid_class, paste0("grid-padding-", strsplit(padding, "")[[1]], collapse = " "))
  }
  if (!is.null(n_cells) & direction == "x") grid_class <- paste0(grid_class, " small-up-", n_cells)

  shiny::div(
    class = grid_class,
    ...
  )
}

#' @export
fd_container <- function(..., fluid = FALSE, full = FALSE) {
  shiny::div(
    class = paste0("grid-container", if (fluid) " fluid", if (full) " full"),
    ...
  )
}

#' @export
fd_cell <- function(..., width = NA) {
  # Setting up cell class
  cell_class <- "cell"
  if (!is.na(width)) cell_class <- paste0(cell_class, " small-", width)

  shiny::div(
    class = cell_class,
    ...
  )
}
