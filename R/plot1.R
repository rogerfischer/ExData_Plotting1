## Directory Structure
# ExData_Plotting1  household_power_consumption.txt exdata-data-household_power_consumption.zip  
# R (place of scripts plot1.R etc.) 	README.md	figure		plots (place of plots plot1.png etc.)

## Setting the Working Directory
# rm(list=ls())
# setwd("/Users/rogerfischer/datasciencecoursera/explora/ExData_Plotting1/R")

## Read the whole table, when enough memory
# The dataset has 2,075,259 rows and 9 columns
elecon <- read.table("../../household_power_consumption.txt", header = TRUE, sep = ";")
# dim(elecon)

## As Date, then subset (elecon$Date: 16/12/2006)
elecon$Date <- as.Date(elecon$Date, "%d/%m/%Y")
feb1 = as.Date("01/02/2007", "%d/%m/%Y")
feb2 = as.Date("02/02/2007", "%d/%m/%Y")

elecon_f <- subset(elecon, Date >= feb1 & Date <= feb2)

# Note that in this dataset missing values are coded as ?.

## Plotting plot1.png
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Plot: Histogram, Color: red
# Variable: Global_active_power: household global minute-averaged active power (in kilowatt)
# Variable Global_active_power needs to be numeric, not a factor
elecon_f$Global_active_power <- as.numeric(as.character(elecon_f$Global_active_power))

## Create Histogram
par(mar = c(5, 7, 4, 2))
hist(elecon_f$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
## Copy plot1 to a PNG file
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
dev.copy(png, file = "../plots/plot1.png", width = 480, height = 480)  
dev.off() 

