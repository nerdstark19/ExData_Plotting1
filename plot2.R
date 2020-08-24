# Peer-Review Assignment 1
# Name : Amogh Patnaik
# Date : 08/24/20

#Setting the working directory
setwd("C:/Users/ap21859/Documents/Exploratory Data Analysis")  
library(ggplot2)

#Plot2

#Filtering the dataset for specific date
elec_power <- read.table("household_power_consumption.txt",sep=";",na.strings="?")
names(elec_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
filtered_power <- subset(elec_power,elec_power$Date=="1/2/2007" | elec_power$Date =="2/2/2007")

#Converting data and time variables to date and time classes
datetime <- strptime(paste(filtered_power$Date, filtered_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creating the plot and exporting as png
png("C:/Users/ap21859/Documents/Exploratory Data Analysis/plot2.png",width=480, height=480)  
plot(datetime,as.numeric(filtered_power$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time") 
dev.off()


