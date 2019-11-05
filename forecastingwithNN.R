##Project El Cost Forecasting Script

## Import Data myelData.csv file as myelData
##Upload the data included with in the folder


# check the quotes while importing to get 2 columns
class(myelData$V1)

# chopping off the useless quotes at 2 positions
library(tidyr)
# total <- separate(myelData, col = V2, 
#                     sep = c(2, -3), 
#                     into = c("rest", "data", "rest2"))

library(dplyr)
# Drop the columns of the dataframe
myneweldata<-select (myelData,-c(V2))


# all the relevant data is in column "data"
tail(myneweldata)

# class is still a character (with some missing data)
class(myneweldata$V1)

# conversion to time series
myts <- ts(as.numeric(myneweldata$V1),
           start = c(2016,6), frequency = 12)

# data is still not clean (outliers and NAs)
summary(myts)

# all in one cleaning tool
library(forecast)
myts <- tsclean(myts)
myts
# check the data
summary(myts)

plot(myts)

# set up a Neural Network model
mynnetar <- nnetar(window(myts,end=c(2019,2), lambda="auto"))
##mynnetar <- nnetar(myts)

# forecasting 1.5 years with the model
nnetforecast <- forecast(mynnetar, h = 18,
                         PI = T)
library(ggplot2)
autoplot(nnetforecast)

## interactive dygraph

# data we need for the graph
OrgCost<-myts
data <- nnetforecast$x
lower <- nnetforecast$lower[,2]
upper <- nnetforecast$upper[,2]
pforecast <- nnetforecast$mean

mydata <- cbind(data, lower, upper,
                pforecast, OrgCost)

library(dygraphs)

dygraph(mydata, main = "Rickys home EL bill forecasting") %>% 
  dyRangeSelector() %>% 
  dySeries(name = "data", label = "El Bill in SEK") %>%
  dySeries(c("lower","pforecast","upper"), label = "El bill Forecast") %>%
  dyLegend(show = "always", hideOnMouseOut = FALSE) %>%
  dyAxis("y", label = "Monthly Bill in SEK") %>%
  dyHighlight(highlightCircleSize = 5,
              highlightSeriesOpts = list(strokeWidth = 2)) %>%
  dyOptions(axisLineColor = "navy", gridLineColor = "grey") 
  ##dyAnnotation("2010-8-1", text = "CF", tooltip = "City festival", attachAtBottom = T)
