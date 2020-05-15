## Getting and Setting working directory
getwd()
setwd("D:/R Course/Data Science Specialisation (JHU)/Data Science Specialisation/Exploratory Data Analysis/Assignment 1 Exploratory Data Analysis")

## Loading and Exploring household data
data_txt <- "./household_power_consumption.txt"
data <- read.table(data_txt, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
head(data_subset)
View(data_subset)
nrow(data_subset)
dim(data_subset)

## Read data as.Date()
data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
date_and_time <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Date_and_time <- as.POSIXct(date_and_time)

## Explore Variable Names
names(data_subset)


## Creating Plot 3
with(data_subset, plot(Sub_metering_1 ~Date_and_time, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines(data_subset$Sub_metering_2~data_subset$Date_and_time, type = "l", col = "red")
lines(data_subset$Sub_metering_3~data_subset$Date_and_time, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = 2, lty= 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Creating PNG file
png("plot3.png", width = 480, height = 480)
dev.off()
