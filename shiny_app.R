# install.packages('shiny')
library(shiny)

#load in data
endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
head(endomech)



ui <- fluidPage(
  h2("Endomech Forecasting"),
                selectInput("col_choice", "Column Choice", col_choices),
  plotOutput("line_plot")
  )

server <- function(input, output){
  reactive({
    trim <- function (x) gsub("^\\s+|\\s+$", "", x)
    trimmed <- trim(endomech[input$col_choice])
    new_col <- as.numeric(gsub(",", "", trimmed))
             })
  output$line_plot <- renderPlot({
    plot(as.Date(endomech$Date, format = "%m/%d/%Y"), new_col,
         xlab = "Date", ylab = input$col_choice, type = 'l')
  })
}
shinyApp(ui = ui, server = server)



### When you click the button, get choice of scatter plot and line plot
### final plot with the red dots for a year out of predicition