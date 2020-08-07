# Exploratory Data Analysis Project: Plot1
# Mohsen Azimi, Aug, 2020

rm(list=ls()) 

# Load packages
library(dplyr)

# Load dataset

datafile <- "data.zip"

if (!file.exists(datafile)){
  dataurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(dataurl, datafile, method="curl")
}  

if (!file.exists("household_power_consumption")) { 
  unzip(datafile) 
}


# Read dataset
data<- read.table("household_power_consumption.txt", sep=";", header = T,
                  stringsAsFactors = FALSE, dec = ".")


data<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

data$Global_active_power<- as.numeric(data$Global_active_power)

png("Plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")
dev.off()