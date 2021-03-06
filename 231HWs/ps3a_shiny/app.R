
library(shiny)

ui <- fluidPage(
  navlistPanel(
    tabPanel(
      title = "Histogram",
      sliderInput(inputId = "num", 
              label = "Choose a number", 
              value = 25, min = 1, max = 100),
      textInput(inputId = "title",
            label = "Write a title",
            value = "Histogram of Random Normal Values"),
      plotOutput("hist")),
    tabPanel(
      title = "Summary of Data",
      verbatimTextOutput("stats")
    ) # closes tab panel
) # closes navlist panel
    ) # closes fluid page

server <- function(input, output) {
  
  data <- reactive({
    rnorm(input$num)
  })
  
  output$hist <- renderPlot({
    hist(data(), main = input$title)
  })
  output$stats <- renderPrint({
    summary(data())
  })
}

shinyApp(ui = ui, server = server)

