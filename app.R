require(shiny)
require(DT)

shinyApp(
  ui = fluidPage(
    sidebarLayout(
      sidebarPanel(
        textInput("uname", "Your name", "anonymous")
      ),
      mainPanel(
        textOutput("greeting"),
        DT::dataTableOutput(head("iris")),
        includeHTML("rmarkdown.html")
      )
    )
  ),
  server = function(input, output, session) {
    output$greeting <- renderText(paste("Hello",input$uname))
    output$iris <- DT::renderDataTable({
      datatable(iris)
    })
  }
)
