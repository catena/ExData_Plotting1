
## common.R contains code to read and initialize data
if (!exists("mydata")) {
    source("common.R")
    mydata <- getdata()
}

png(file = "plot3.png", width = 480, height = 480, units = "px")
par(mar = c(5, 5, 2, 2))

## plot energy sub metering vs time
plot(mydata$Time, mydata$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Energy sub metering")
points(mydata$Time, mydata$Sub_metering_2, type = "l", col = "red")
points(mydata$Time, mydata$Sub_metering_3, type = "l", col = "purple")
legend("topright", col = c("black", "red", "purple"), lty = c(1, 1, 1),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
