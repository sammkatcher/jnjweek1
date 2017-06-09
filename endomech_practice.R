endomech <- read.csv("endomech.csv", header = TRUE)
head(endomech)

## How to access names
head(names(endomech))
str(endomech)

# making a variable column and then a dataframe with that column and Date
#### readline()
#### https://stackoverflow.com/questions/12550677/in-r-is-there-some-function-like-raw-input-in-python
column <- "Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH"
selected_df <- data.frame(endomech$Date, endomech[column])

# getting a mean from the 'non NA' data in the column
non_na_selected <- subset(selected_df, !is.na(selected_df[column]))
mean(non_na_selected[2:nrow(non_na_selected),2])

# changing all the NAs to the calculated mean
selected_df[is.na(selected_df)] <- mean(non_na_selected[2:nrow(non_na_selected),2])

plot(selected_df)

## Notes from talking:
## Column variable, run the script for any column
## figure out rows with NAs
## figure out how to clean up
## best fit graph: each one needs a different "best fit"
## index into the summary to get the correlation coefficient to figure out the best one