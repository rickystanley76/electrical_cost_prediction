# electrical_cost_prediction

<BR><font size="16">Home Electrical bill(in SEK) and it's Forecasting using Neural Network </font> </BR>
I have collected data from MälarEnergi of my home electrical usage and it's cost. Using those data I have used Neural Network on Time series data to find out the forecast of my cost for next 12 months, where we also tested the model with last 4 months original data.  
I have used R programming Language and it's different packages, like tidyr, dplyr, forecast and dygraphs for visualization and published the visualtization using rpubs.com


## Import Data myelData.csv file as myelData
## myelData.csv must be in the working directory
myelData <- read.csv(file = 'myelData.csv')
head(myelData)
## Results
## 0  390;2016.06.08;1
## 1  411;2016-07-07;2
## 2  408;2016-08-05;3
## 3  424;2016-09-07;4
## 4  408;2016-10-07;5
## 5  484;2016-11-07;6
## 6  672;2016-12-07;7
## 1st column is the cost of EL, 2nd is the month and 3rd is the serial number
