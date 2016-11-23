setwd("~/ProjectData")

yearOne <- read.csv("2004 NFL Data-2.csv")
yearTwo<- read.csv("2005Data.csv")
yearThree <- read.csv("2006 data.csv")
# will add the final year


# adding the final year won't change any of this
combinedData <- list.files(pattern = '\\.csv')
tableData <- lapply(combinedData, read.csv, header = TRUE)
combined.df <- (do.call(rbind,tableData))
