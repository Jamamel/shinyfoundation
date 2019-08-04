#### Foundation ####
library(shiny)
library(shinyfoundation)

testUI <- shinyfoundation::fd_page(
  tags$br(),
  fd_container(
    fd_grid(
      fd_cell("Cell 1"),
      fd_cell("Cell 2"),
      fd_cell("Cell 3"),
      medium_max = 3
    )
  ),
  tags$br(),
  shiny::div(
    class = "row",
    shiny::div(
      class = "columns",
      shiny::div(
        class ="primary progress", role = "progressbar", tabindex = "0",
        `aria-valuenow`="25", `aria-valuemin`="0", `aria-valuetext`="25 percent",
        `aria-valuemax`="100",
        shiny::div(
          class = "progress-meter", style = "width: 25%",
          tags$p(
            class = "progress-meter-text",
            "25%"
          )
        )
      )
    )
  )
)

testServer <- function(input, output) {

}

shiny::shinyApp(testUI, testServer)

#### Bootstrap ####
bsUI <- shiny::basicPage(
  tags$br(),
  tags$br(),
  shiny::div(
    class = "row",
    shiny::div(
      class = "progress",
      shiny::div(
        class ="progress-bar", role = "progressbar", tabindex = "0",
        `aria-valuenow`="25", `aria-valuemin`="0", style="width:70%",
        `aria-valuemax`="100"
      )
    )
  )
)

shiny::shinyApp(bsUI, testServer)
