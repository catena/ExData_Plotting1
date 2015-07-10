
## common.R contains code to read and initialize data
if (!exists("mydata")) {
    source("common.R")
    mydata <- getdata()
}

## set graphics params, init png device
png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4.5, 4.5, 3, 1), cex = 0.85)

## global active power vs time
plot(mydata$Time, mydata$Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power")


## voltage vs time
plot(mydata$Time, mydata$Voltage, 
     type = "l", xlab = "datetime", ylab = "Voltage")


## energy sub metering vs time
plot(mydata$Time, mydata$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
points(mydata$Time, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$Time, mydata$Sub_metering_3, type = "l", col = "purple")
legend("topright", col = c("black", "red", "purple"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## global reactive power vs time
plot(mydata$Time, mydata$Global_reactive_power, 
     type = "l", xlab = "datetime", ylab = "Global_reactive_power")


## close png device
dev.off()



