setwd("~/Documents/ProjectData")

library(class)
library(dplyr)
library(ggplot2)
library(partykit)

yearOne <- read.csv("2004 NFL Data-2.csv")
yearTwo<- read.csv("2005Data.csv")
yearThree <- read.csv("2006 data.csv")
##yearFour <- read.csv("NFL Data (2007).csv")
# will add the final year
## subset of training set just   

# adding the final year won't change any of this
combinedData <- list.files(pattern = '\\.csv')
tableData <- lapply(combinedData, read.csv, header = TRUE)
combined.df <- (do.call(rbind,tableData))


##train <- subset(combined.df, Partition=="Train")
##test <- subset(combined.df, Partition=="Test")

splitSample <- sample(1:2, size=nrow(combined.df),replace=TRUE, prob=c(0.5,0.5))
train <- combined.df[splitSample==1,]
test <- combined.df[splitSample==2,]

trainsmall <- select(train, Career.Length, Player, Pos, Pick, X40.Yard, Vert.Leap..in., NCAA.G, College.Univ)
testsmall <- select(test, Career.Length, Player, Pos, Pick, X40.Yard, Vert.Leap..in., NCAA.G, College.Univ)

## To subset WR's. Pos = WR wasnt working. so i did it for players with more than 10 receptions
## and less than 150 rush attempts in NCAA- so no running backs or quarter backs were included
## ** If you want to utilize NCAA Stats- used the subsetted data for your model- instead of combined.df
subsetWR <- subset(combined.df, NCAA.Rec > 10 & NCAA.Rush.Att < 150)
subsetQB <- subset(combined.df, NCAA.Cmp > 1)
subsetRB <- subset(combined.df, NCAA.Rush.Att > 100 & NCAA.Cmp < 50 )

model1 <- ctree(Career.Length ~ Pick + X40.Yard + Vert.Leap..in. + NCAA.G, data=train)
model1
plot(model1, main="Classification Tree for Career Length (train data)", gp=gpar(fontsize=8))

p <- ggplot(trainsmall, aes(x=Career.Length, y= Pick, color = College.Univ))+
  geom_point(size=1.5) 
p

##str(combined.df) not needed
plot(Pick ~ Career.Length, data = combined.df)
# now label points 
with(combined.df,text(Pick~ Career.Length, labels= College.Univ ,pos=3))

