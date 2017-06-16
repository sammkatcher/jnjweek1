install.packages('Shiny')
library(shiny)

col_choices <- names(endomech)
col_choices <- col_choices[2:119]
ui <- fluidPage(
  h2("Endomech Forecasting"),
                selectInput("col_choice", "Column Choice", col_choices),
                plotOutput("forecast_plot")
                )
server <- function(input, output){
  output$forecast_plot <- renderPlot({
    plot(input$col_choice,
         as.Date(endomech$Date, format = "%m/%d/%Y"))
  })
}
shinyApp(ui = ui, server = server)
