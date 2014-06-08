library(datasets)

# Load data file and specify NA characters
setwd("~/Documents/Coursera/Exploratory Analysis/Week 1/")
household_power_consumption <- read.table("~/Documents/Coursera/Exploratory Analysis/Week 1/household_power_consumption.txt", sep=";", header=TRUE, quote="\"", na.strings = "?")

##Reformat Date 
date <- household_power_consumption$Date
dates <- as.Date(date, format = "%d/%m/%Y")
household_power_consumption$Date <- dates

# Select only specified data range and subset for the dates needed
date_a <- as.Date("2007-02-01")
date_b <- as.Date("2007-02-02")

select_dates <- household_power_consumption$Date == date_a | household_power_consumption$Date == date_b
sub_table <- household_power_consumption[select_dates,]

##Plot 3 creation and save as PNG 
class(sub_table$Global_active_power) = "numeric"
sub_table$Day <- as.POSIXct(paste(sub_table$Date, sub_table$Time, format = "%d/%m/%Y %H:%M:%S"))

png(filename = "plot3.png")

with(sub_table, plot(Day, Sub_metering_1, type = "l", ylab = "Energy sub metering" ))
lines(sub_table$Day, sub_table$Sub_metering_2, col = "red")
lines(subdatetable$Day, subdatetable$Sub_metering_3, col = "blue")
legend("topright", cex = 0.95, c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1,col = c("black", "red", "blue"))

dev.off()