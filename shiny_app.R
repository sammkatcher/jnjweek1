install.packages('Shiny')
library(shiny)


ui <- fluidPage("Endomech Forecasting")
server <- function(input, output){}
shinyApp(ui = ui, server = server)
