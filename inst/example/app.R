#### Libraries ####
library(shiny)
library(shinyfoundation)

#### Set-Up ####
ns <- NS("example")

#### Form ####
text_module_ui <- tagList(
  h3("Text"),
  fd_grid(
    n_cells = 2, margin = "x",
    fd_cell(
      fd_text(ns("text"), "Name", placeholder = "Enter Here"),
      "Your Name:", textOutput(ns("text"), inline = TRUE)
    ),
    fd_cell(
      tags$pre(
        class = "code-block",
        "fd_text(\"text\", \"Name\", placeholder = \"Enter Here\")"
      )
    )
  )
)

text_module <- function(input, output, session) {
  output$text <- renderText(input$text)
}

password_module_ui <- tagList(
  h3("Password"),
  fd_grid(
    n_cells = 2, margin = "x",
    fd_cell(
      fd_text(ns("password"), "Password", placeholder = "Enter Here", type = "password"),
      "Password:", textOutput(ns("password"), inline = TRUE)
    ),
    fd_cell(
      tags$pre(
        class = "code-block",
        "fd_text(\"password\", \"Name\", placeholder = \"Enter Here\", type = \"password\")"
      )
    )
  )
)

password_module <- function(input, output, session) {
  output$password <- renderText(input$password)
}

number_module_ui <- tagList(
  h3("Numeric"),
  fd_grid(
    n_cells = 2, margin = "x",
    fd_cell(
      fd_numeric(ns("number"), "Select a number", 10, 1, 50),
      "Selected Number:", textOutput(ns("number"), inline = TRUE)
    ),
    fd_cell(
      tags$pre(
        class = "code-block",
        "fd_numeric(\"number\", \"Select a number\", 10, 1, 50)"
      )
    )
  )
)

number_module <- function(input, output, session) {
  output$number <- renderText(input$number)
}

#### Containers ####
accordion_module_ui <- tagList(
  h3("Accordion"),
  fd_grid(
    n_cells = 2, margin = "x",
    fd_cell(
      fd_accordion(
        fd_accordion_item("Item 1", "This is an item", TRUE),
        fd_accordion_item("Item 2", "This is an item too"),
        fd_accordion_item("Item 3", fd_action_button(ns("accordion-button"), "You can add buttons too!"))
      )
    ),
    fd_cell(
      tags$pre(
        class = "code-block",
        "fd_accordion(
  fd_accordion_item(\"Item 1\", \"This is an item\", TRUE),
  fd_accordion_item(\"Item 2\", \"This is an item too\"),
  fd_accordion_item(\"Item 3\", fd_action_button(\"accordion-button\", \"You can add buttons too!\"))
)"
      )
    )
  )
)

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
    ),

    hr(),

    fd_grid(
      direction = "y",
      text_module_ui
    ),

    hr(),

    fd_grid(
      direction = "y",
      password_module_ui
    ),

    hr(),

    h2("Containers"),
    fd_grid(
      direction = "y",
      accordion_module_ui
    )
  )
)

#### Server ####
server <- function(input, output, session) {
  callModule(number_module, "example")
  callModule(text_module, "example")
  callModule(password_module, "example")
}

shiny::shinyApp(ui, server)
