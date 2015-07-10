
## common.R contains code to read and initialize data
if (!exists("mydata")) {
    source("common.R")
    mydata <- getdata()
}

png(file = "plot2.png", width = 480, height = 480, units = "px")
par(mar = c(5, 5, 2, 2))

## plot global active power vs time
with(subset(mydata, !is.na(Global_active_power)),
     plot(Time, Global_active_power, 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()


