# Peer-Review Assignment 1
# Name : Amogh Patnaik
# Date : 08/24/20

#Setting the working directory
setwd("C:/Users/ap21859/Documents/Exploratory Data Analysis")  
rm(list = ls())
elecpower <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
# convert the date variable to Date class
elecpower$Date <- as.Date(elecpower$Date, format = "%d/%m/%Y")

# Subset the data
filteredpower <- subset(elecpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
filteredpower$datetime <- strptime(paste(filteredpower$Date, filteredpower$Time), "%Y-%m-%d %H:%M:%S")

# Plot 3
filteredpower$datetime <- as.POSIXct(filteredpower$datetime)

attach(filteredpower)
png("C:/Users/ap21859/Documents/Exploratory Data Analysis/plot3.png",width=480, height=480)  
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
detach(filteredpower)

