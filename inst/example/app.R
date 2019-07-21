#### Libraries ####
library(shiny)
library(shinyfoundation)

#### Set-Up ####
ns <- NS("example")

#### Form ####
number_module_ui <- tagList(
  h3("Numeric Input"),
  fd_grid(
    medium_max = 2,
    fd_cell(
      fd_numeric(ns("number"), "Select a number", 10, 1, 50)
    ),
    fd_cell(
      tags$pre(
        tags$code(class = "html",
        as.character(fd_numeric(ns("number"), "Select a number", 10, 1, 50))
        )
      )
    )
  )
)

number_module <- function(input, output, session) {

}

#### UI ####
ui <- shinyfoundation::fd_page(
  fd_container(
    fd_grid(
      margin = "x",
      h1("Foundation UI for Shiny"),
      number_module_ui
    )
  )
)

#### Server ####
server <- function(input, output, session) {
  callModule(number_module, "example")
}

shiny::shinyApp(ui, server)
