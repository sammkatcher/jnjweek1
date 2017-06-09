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

# change date column from factor variable to an actual graphable date
selected_df$endomech.Date <- as.Date(selected_df$endomech.Date
                                          , format = "%m/%d/%Y")

plot(selected_df)

#m1 <- lm(selected_df$endomech.Date ~ selected_df[,2])
#summary(m1) 
## Notes from talking:
## Column variable, run the script for any column
## figure out rows with NAs
## figure out how to clean up
## best fit graph: each one needs a different "best fit"
## index into the summary to get the correlation coefficient to figure out the best one