# install.packages('shiny')
library(shiny)

#load in data
endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
head(endomech)



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
  HTML("<img src='jnj-og-logo.jpg'/>")
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