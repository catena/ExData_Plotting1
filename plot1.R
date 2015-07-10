
## common.R contains code to read and initialize data
if (!exists("mydata")) {
    source("common.R")
    mydata <- getdata()
}

png(file = "plot1.png", width = 480, height = 480, units = "px")
par(mar = c(5, 5, 2, 2))

## global activer power frequency histogram
hist(mydata$Global_active_power, main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()
