#template
library(shiny)
ui = fluidPage()
server = function(input,output){}
shinyApp(ui = ui, server = server)


ui = fluidPage(

  sliderInput(inputId = "num",
              label = "Choose a value",
              value = 25,
              min = 1, 
              max = 100),
  actionButton("click","click me!"),
  plotOutput("hist")
)
server = function(input,output){
  observeEvent(input$click,
    {
      print(as.numeric(input$click))
    }
  )
  
  output$hist = renderPlot(
    {
      hist(rnorm(input$num))
    }
  )
}
shinyApp(ui = ui, server = server)