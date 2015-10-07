# Import required libraries
library(lubridate)

# See if cached data exists, if not, download it
if (!file.exists("myCachedData.rds")) {
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                 method = "curl", destfile = "household_power_consumption.zip")
    unzip("household_power_consumption.zip")
    # Read in data
    h <- read.table('household_power_consumption.txt', header=TRUE,
                    sep=';', na.strings='?',
                    colClasses=c(rep('character', 2), rep('numeric', 7)))
    
    # Convert dates and time to R objects
    h$Date <- dmy(h$Date)
    h$Time <- hms(h$Time)
    
    # Remove rows with NA value, and keep only rows between 2007-02-01 
    # and 2007-02-02.
    dat <- subset(h, Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02"))
    # Create a single object to have both Date and Time
    dat$Date.Time <- dat$Date + dat$Time
    saveRDS(dat, file = "myCachedData.rds")
} else {
    dat <- readRDS("myCachedData.rds")
}