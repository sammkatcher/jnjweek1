endomech <- read.csv("endomech.csv", header = TRUE)
## Load in ggplot2
install.packages("ggplot2")
install.packages("plotly")
head(endomech)

## How to access names
head(names(endomech))
str(endomech)

# making a variable column and then a dataframe with that column and Date
#### readline()
#### https://stackoverflow.com/questions/12550677/in-r-is-there-some-function-like-raw-input-in-python
column <- "Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH"
col <- endomech$Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH
selected_df <- data.frame(endomech$Date, endomech[column])

# getting a mean from the 'non NA' data in the column
non_na_selected <- subset(selected_df, !is.na(selected_df[column]))
non_na_selected
mean(non_na_selected[1:nrow(non_na_selected),2])

# changing all the NAs to the calculated mean
selected_df[is.na(selected_df)] <- mean(non_na_selected[1:nrow(non_na_selected),2])
selected_df <- selected_df[1:74,]
# change date column from factor variable to an actual graphable date
selected_df$endomech.Date <- as.Date(selected_df$endomech.Date
                                          , format = "%m/%d/%Y")

plot(selected_df, type = "l")

# linear model
linear <- lm(selected_df[,2] ~ selected_df$endomech.Date)
summary(linear) 

# arima model
install.packages('forecast')
library('forecast')
arima_auto_test <- auto.arima(selected_df[,2], max.P = 10, max.Q = 10)
summary(arima_auto_test)
arima <- arima(selected_df$Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH, order = c(1, 0, 5))
arima_forecast <- forecast.Arima(arima, h = 12)
plot.forecast(arima_forecast)
summary(arima)

# exponential smoothing
install.packages("TTR")
library("TTR")
exp_smoothing <- HoltWinters(selected_df$Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH,
                             beta=FALSE, gamma=FALSE)
forecast_hw <- forecast.HoltWinters(exp_smoothing, h = 12)
plot.forecast(forecast_hw)

# Sum of Squared Residuals
SSE_arima <- sum((arima$residuals)^2)
SSE_linear <- sum((linear$residuals)^2)
SSE_exp_smoothing <- exp_smoothing$SSE
SSE_arima
SSE_linear
SSE_exp_smoothing

# start of test data
test_data <- data.frame(seq(as.Date("2016/11/1"), as.Date("2017/10/1"), "months"))
test_data

## Notes from talking:
## Column variable, run the script for any column
## figure out rows with NAs
## figure out how to clean up
## best fit graph: each one needs a different "best fit"
## index into the summary to get the correlation coefficient to figure out the best one