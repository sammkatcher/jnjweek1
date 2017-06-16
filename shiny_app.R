# install.packages('shiny')
library(shiny)

#load in data
endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
head(endomech)

col_choices <- names(endomech)
col_choices <- col_choices[2:119]

ui <- fluidPage(
  theme = "bootstrap.css",
  tags$div(
    HTML("
         <style>
         header{
         text-align: center;
         }
         </style>
         <header>
         <h1><strong>Endomech Forecasting</strong></h1>
         <h2> Week 1 Data Science Project </h2>
         <br/>
         <h4> Rory O'Donnell, Alexandria Geise, and Samm Katcher </h4>
         <br/>
         </header>")
    ),
  
  selectInput("col_choice", "Column Choice", col_choices),
  plotOutput("line_plot"),
  mainPanel(
    textOutput("text1")
  )
  )

server <- function(input, output){
  output$text1 <- renderText({ 
        
          paste("You have selected this ", input$col_choice)
     })
  output$line_plot <- renderPlot({
    plot(as.Date(endomech$Date, format = "%m/%d/%Y"), endomech[eval(input$col_choice)],
         xlab = "Date", ylab = input$col_choice, type = 'l')
  })
}
shinyApp(ui = ui, server = server)



### When you click the button, get choice of scatter plot and line plot
### final plot with the red dots for a year out of predicition