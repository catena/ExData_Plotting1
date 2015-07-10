
## the purpose of this function is to read and initialize the
## household power consumption data from the specified zip folder
## data will be returned as a data.frame object

getdata <- function() {
    ## read data from zip file
    zipfilename <- "../exdata_data_household_power_consumption.zip"
    datafilename <- "household_power_consumption.txt"
    
    file <- unz(zipfilename, datafilename)
    lines <- readLines(file)
    close.connection(file)
    
    ## select rows b/w the dates 1/2/2007 and 2/2/2007 (dd/mm/yy format)
    match <- grep("^0?[1|2]/0?2/2007", lines, value = TRUE)
    header <- lines[1]
    
    ## transform selected rows to data.frame
    mydata <- read.table(text = c(header, match), sep = ";", header = TRUE,
                         as.is = TRUE, na.strings = "?", comment.char = "",
                         colClasses = c("character", "character", rep("numeric", 7)))
    
    ## coerce Time from character to POSIXlt/POSIXct
    ## remove Date column
    within(mydata, {
        Time <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
        rm(Date)
    })
}

