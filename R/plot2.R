## Directory Structure
# ExData_Plotting1  household_power_consumption.txt exdata-data-household_power_consumption.zip  
# R (place of scripts plot1.R etc.)   README.md	figure		plots (place of plots plot1.png etc.)

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

# Variable Global_active_power needs to be numeric, not a factor
elecon_f$Global_active_power <- as.numeric(as.character(elecon_f$Global_active_power))
gap <- elecon_f$Global_active_power

# Combine days and time
daytime <- as.POSIXct(paste(elecon_f$Date, elecon_f$Time), format="%Y-%m-%d %H:%M:%S")

## Draw plot
par(mar = c(5, 5, 4, 2))
plot(daytime, gap, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Copy plot2 to a PNG file
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file = "../plots/plot2.png", width = 480, height = 480)  
dev.off() 

