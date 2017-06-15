#load in data
endomech <- read.csv("endomech.csv", header = TRUE, strip.white = TRUE)
head(endomech)

## How to access names
head(names(endomech))
str(endomech)

# making a variable column and then a dataframe with that column and Date
# Working example: ## column <- "Circular.Stapler.Circular.Stapler.Stryker.Sustainability.Circular.Stapler.excl.PPH"
# factor example Circular.Stapler.Circular.Stapler.Ethicon.Circular.Stapler.excl.PPH
column <- readline('Enter column name: ')

selected_df <- data.frame(endomech$Date, endomech[column])
##as.numeric(as.character(selected_df[,2]))

as.num = function(x, na.strings = "NA") {
  stopifnot(is.character(x))
  na = x %in% na.strings
  x[na] = 0
  x = as.numeric(x)
  x[na] = NA_real_
  x
}
as.num(c("1", "2", "X"), na.strings="X")
#[1]  1  2 NA

as.num(c(as.character(selected_df[,2])))

test1 <- as.numeric(test)

