#### Libraries ####
library(shiny)
library(shinyfoundation)

#### Set-Up ####
ns <- NS("example")

#### Form ####
number_module_ui <- tagList(
  h3("Numeric"),
  fd_grid(
    medium_max = 2,
    fd_cell(
      fd_numeric(ns("number"), "Select a number", 10, 1, 50),
      "Selected Number:", textOutput(ns("number"), inline = TRUE)
    ),
    fd_cell(
      tags$pre(
        "fd_numeric(ns(\"number\"), \"Select a number\", 10, 1, 50)"
      )
    )
  )
)

number_module <- function(input, output, session) {
  output$number <- renderText(input$number)
}

#### UI ####
ui <- shinyfoundation::fd_page(
  fd_container(
    h1("Foundation UI for Shiny"),

    h2("Typography"),

    hr(),

    h2("Inputs"),
    fd_grid(
      direction = "y",
      number_module_ui
    )
  )
)

#### Server ####
server <- function(input, output, session) {
  callModule(number_module, "example")
}

shiny::shinyApp(ui, server)
