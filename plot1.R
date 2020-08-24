# Peer-Review Assignment 1
# Name : Amogh Patnaik
# Date : 08/24/20

#Setting the working directory
setwd("C:/Users/ap21859/Documents/Exploratory Data Analysis")  

#Plot1

#Filtering the dataset for specific date
elec_power <- read.table("household_power_consumption.txt",sep=";")
names(elec_power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
filtered_power <- subset(elec_power,elec_power$Date=="1/2/2007" | elec_power$Date =="2/2/2007")

#Creating the histogram and exporting as png
png("C:/Users/ap21859/Documents/Exploratory Data Analysis/plot1.png",width=480, height=480)  
hist(as.numeric(as.character(filtered_power$Global_active_power)),xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")
dev.off()
