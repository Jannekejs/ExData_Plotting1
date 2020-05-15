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

## Explore Variable Names
names(data_subset)

## Creating Plot 1
hist(as.numeric(data_subset$Global_active_power), main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Creating PNG file of Plot 1
png("plot1.png", width = 480, height = 480)
dev.off()
