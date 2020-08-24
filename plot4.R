#Setting the working directory
setwd("C:/Users/ap21859/Documents/Exploratory Data Analysis")  
rm(list = ls())
elecpower <- read.table("household_power_consumption.txt", header = T, 
                        sep = ";", na.strings = "?")
# convert the date variable to Date class
elecpower$Date <- as.Date(elecpower$Date, format = "%d/%m/%Y")

# Subset the data
filteredpower <- subset(elecpower, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

filteredpower$datetime <- strptime(paste(filteredpower$Date, filteredpower$Time), "%Y-%m-%d %H:%M:%S")

# Plot 4
filteredpower$datetime <- as.POSIXct(filteredpower$datetime)


attach(filteredpower)
png("C:/Users/ap21859/Documents/Exploratory Data Analysis/plot4.png",width=480, height=480)  
par(mfrow = c(2, 2))

#plot 1
hist(as.numeric(as.character(filteredpower$Global_active_power)),xlab="Global Active Power(kilowatts)",col="red",main="Global Active Power")

#plot_2
plot(datetime,as.numeric(filteredpower$Global_active_power),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time") 

#plot_3
plot(Sub_metering_1 ~ datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot_4
plot(Global_reactive_power ~ datetime, type = "l")
dev.off()

detach(filteredpower)
