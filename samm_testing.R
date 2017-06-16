# #load in data
# endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
# head(endomech)
# 
# ## How to access names
# head(names(endomech))
# str(endomech)
# 
# # making a variable column and then a dataframe with that column and Date
# # Working example: ## column <- "Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH"
# # factor example Circular.Stapler.Circular.Stapler.Ethicon.Circular.Stapler.excl.PPH
# column <- readline('Enter column name: ')
# 
# selected_df <- data.frame(endomech$Date, endomech[column])
# ##as.numeric(as.character(selected_df[,2]))
# 
# as.num = function(x, na.strings = "NA") {
#   stopifnot(is.character(x))
#   na = x %in% na.strings
#   x[na] = 0
#   x = as.numeric(x)
#   x[na] = NA_real_
#   x
# }
# as.num(c("1", "2", "X"), na.strings="X")
# #[1]  1  2 NA
# 
# as.num(c(as.character(selected_df[,2])))
# 
# test1 <- as.numeric(test)


install.packages('Shiny')
library(shiny)

#load in data
endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
head(endomech)

col_choices <- names(endomech)
col_choices <- col_choices[2:119]
ui <- fluidPage(theme = "bootstrap.css",
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
                plotOutput("forecast_plot"),
                
                HTML("<img src='data-labs.png'/>")
)

server <- function(input, output){
  output$forecast_plot <- renderPlot({
    plot(endomech$Circular.Stapler.Circular.Stapler.Ethicon.Circular.Stapler.excl.PPH,
         as.Date(endomech$Date, format = "%m/%d/%Y"))
  })
}
shinyApp(ui = ui, server = server)



### When you click the button, get choice of scatter plot and line plot
### final plot with the red dots for a year out of predicition
