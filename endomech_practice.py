#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jun 13 14:23:04 2017

@author: sammkatcher


********** We should use matplotlib and numpy to do our calculations
"""
import csv

## Load in ggplot2
#install.packages("ggplot2")
#install.packages("plotly")

with open('endomech.csv', newline='') as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)

## making a variable column and then a dataframe with that column and Date
## Working example: ## column = "Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH"
column = input('Enter column name: ')

#selected_df = data.frame(endomech$Date, endomech[column])
#
## getting a mean from the 'non NA' data in the column
#non_na_selected = subset(selected_df, !is.na(selected_df[column]))

##print(non_na_selected)

#mean(non_na_selected[1:nrow(non_na_selected),2])
#
## changing all the NAs to the calculated mean
#selected_df[is.na(selected_df)] = mean(non_na_selected[1:nrow(non_na_selected),2])
##selected_df = selected_df[1:74,]
#
## change date column from factor variable to an actual graphable date
#selected_df$endomech.Date = as.Date(selected_df$endomech.Date
#                                          , format = "%m/%d/%Y")
#
#plot(selected_df, type = "l")
#
## linear model
#linear = lm(selected_df[,2] ~ selected_df$endomech.Date)
#summary(linear) 
#
## arima model
#install.packages('forecast')
#library('forecast')

#arima_auto = auto.arima(selected_df[,2], max.P = 10, max.Q = 10)
#arima_forecast = forecast.Arima(arima_auto, h = 12)
#plot.forecast(arima_forecast)
#summary(arima_auto)
#
## exponential smoothing
#install.packages("TTR")
#library("TTR")
#exp_smoothing = HoltWinters(selected_df[,2], beta=FALSE, gamma=FALSE)
#forecast_hw = forecast.HoltWinters(exp_smoothing, h = 12)
#plot.forecast(forecast_hw)
#
## Sum of Squared Residuals, pick the best by hand
#SSE_arima = sum((arima_auto$residuals)^2)
#SSE_linear = sum((linear$residuals)^2)
#SSE_exp_smoothing = exp_smoothing$SSE
#SSE_arima
#SSE_linear
#SSE_exp_smoothing
#
#
## predict one year
#test_data = data.frame(Date = seq(as.Date("2016/3/1"), as.Date("2017/2/1"), "months"))
#test_data$predict = NA
#test_data$predict = predict(arima_auto, newdata = test_data$Date)
#test_data
#
#names(selected_df) = c("Date", column)
#plot(selected_df$Date, selected_df[,2],type="l")  
#?append
#lines(test_data$Date, test_data$predict,col="green")
#names(test_data) = c("Date", column)
#old_and_predicted = rbind(selected_df, test_data)
#
#plot(old_and_predicted$Date, old_and_predicted[,2],xlab="Date",ylab="Variable of Choice", 
#     col = ifelse((old_and_predicted$Date < as.Date("2016/3/1")),'black','red'), type = 'b')
#
#
## all below this is practice/exploration
#old_and_predicted$old = NA
#old_and_predicted$old[1:74,] = old_and_predicted[1:74,2]
#plot(test_data, type = "l")
#
#library(ggplot2)
#ggplot(selected_df) +
#  geom_line(data = selected_df, aes(Date, selected_df[,2])) 
#   geom_line(data = test_data, aes(Date, test_data[,2]), colour = 'red', size = 3)
#
#ggplot(old_and_predicted) + 
#  geom_line(data = old_and_predicted, aes(Date, old_and_predicted[,2]))
#
