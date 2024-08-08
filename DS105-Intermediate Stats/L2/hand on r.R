install.packages("rcompanion")
install.packages("IDPmisc")
library(rcompanion)
library(IDPmisc)
Seattle_ParksnRec = read.csv("C:/Users/Lenovo/OneDrive/Desktop/Data-Science-Program/DATASETS/Seattle_ParksnRec.csv")
head(Seattle_ParksnRec)
colnames(Seattle_ParksnRec)
# Fall Trips

plotNormalHistogram(Seattle_ParksnRec$X..of.trips.Fall)
## positively skewed

Seattle_ParksnRec$X..of.trips.FallSQRT <- sqrt(Seattle_ParksnRec$X..of.trips.Fall)
plotNormalHistogram(Seattle_ParksnRec$X..of.trips.FallSQRT)
## looks a little more normal

# Fall Participants

plotNormalHistogram(Seattle_ParksnRec$X..of.participants.Fall)
## positively skewed
Seattle_ParksnRec$X..of.participants.FallSQRT <- sqrt(Seattle_ParksnRec$X..of.participants.Fall)
plotNormalHistogram(Seattle_ParksnRec$X..of.participants.FallSQRT)
##looks better more normal


# of trips per Year

plotNormalHistogram(Seattle_ParksnRec$X..of.trips.per.year)
## positivley Skewed
Seattle_ParksnRec$X..of.trips.per.yearSQRT <- sqrt(Seattle_ParksnRec$X..of.trips.per.year)
plotNormalHistogram(Seattle_ParksnRec$X..of.trips.per.yearSQRT)
## same no difference


# participants per Year


plotNormalHistogram(Seattle_ParksnRec$X..participants.per.year)
## +skewed
Seattle_ParksnRec$X..participants.per.yearSQRT <- sqrt(Seattle_ParksnRec$X..participants.per.year)
plotNormalHistogram(Seattle_ParksnRec$X..participants.per.yearSQRT)
## More normal


#increase/decrease of prior year

plotNormalHistogram(Seattle_ParksnRec$increase.decrease.of.prior.year)
## Normally distriduted

Seattle_ParksnRec$increase.decrease.of.prior.yearSQRT <- sqrt(Seattle_ParksnRec$increase.decrease.of.prior.year)
plotNormalHistogram(Seattle_ParksnRec$increase.decrease.of.prior.yearSQRT)
##look more positivley skewed previous is better

#Average # people per trip

plotNormalHistogram(Seattle_ParksnRec$Average...people.per.trip)
## Normally distributed leptokurtic
Seattle_ParksnRec$Average...people.per.tripSQRT <- sqrt(Seattle_ParksnRec$Average...people.per.trip)
plotNormalHistogram(Seattle_ParksnRec$Average...people.per.tripSQRT)
##more appealling