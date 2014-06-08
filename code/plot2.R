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

##Plot 2 creation 
class(sub_table$Global_active_power) = "numeric"
sub_table$Day <- as.POSIXct(paste(sub_table$Date, sub_table$Time, format = "%d/%m/%Y %H:%M:%S"))

#plotting
with(sub_table, plot(Day, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))

# Save as PNG
dev.copy(png, file = "plot2.png")
dev.off()