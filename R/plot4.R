## Directory Structure
# ExData_Plotting1  household_power_consumption.txt exdata-data-household_power_consumption.zip  
# R (place of scripts plot1.R etc.)   README.md  figure  	plots (place of plots plot1.png etc.)

## Setting the Working Directory
# rm(list=ls())
# setwd("/Users/rogerfischer/datasciencecoursera/explora/ExData_Plotting1/R")

## Read the whole table, when enough memory
elecon <- read.table("../../household_power_consumption.txt", header = TRUE, sep = ";")

## As Date, then subset (elecon$Date: 16/12/2006)
elecon$Date <- as.Date(elecon$Date, "%d/%m/%Y")
feb1 = as.Date("01/02/2007", "%d/%m/%Y")
feb2 = as.Date("02/02/2007", "%d/%m/%Y")
elecon_f <- subset(elecon, Date >= feb1 & Date <= feb2)

## Combine days and time
daytime <- as.POSIXct(paste(elecon_f$Date, elecon_f$Time), format="%Y-%m-%d %H:%M:%S")

## Variable Global_active_power needs to be numeric, not a factor
gap <- as.numeric(as.character(elecon_f$Global_active_power))

## Variable Voltage needs to be numeric, not a factor
volt <- as.numeric(as.character(elecon_f$Voltage))

## Variables Sub_metering_1, Sub_metering_2, Sub_metering_3 need to be numeric 
Sub_metering_1 <- as.numeric(as.character(elecon_f$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(elecon_f$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(elecon_f$Sub_metering_3))

## Variable Global_reactive_power needs to be numeric, not a factor
grp <- as.numeric(as.character(elecon_f$Global_reactive_power))


## Draw 4 plots
par(mfrow = c(2, 2)) # , mar = c(4, 4, 2, 1) , oma = c(0, 0, 2, 0)

## Draw plot 1 (= plot2.R)
plot(daytime, gap, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Draw plot 2, voltage
plot(daytime, volt, type="l", xlab = "datetime", ylab = "Voltage")

## Draw plot 3 (= plot3.R)
plot(daytime, Sub_metering_1, col="black" type="l", xlab = "", ylab = "Energy sub metering")
#lines(daytime, Sub_metering_1, col="black")
lines(daytime, Sub_metering_2, col="red")
lines(daytime, Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

## Draw plot 4, Global_reactive_power
plot(daytime, grp, type="l", xlab = "datetime", ylab = "Global_reactive_power")


## Copy plot2 to a PNG file
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file = "../plots/plot4.png", width = 480, height = 480)  
dev.off() 