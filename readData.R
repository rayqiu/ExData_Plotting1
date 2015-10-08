# Import required libraries
library(lubridate)
library(readr)

# Check if cached data exists
if (!file.exists("myCachedData.rds")) {
    # Cached data doesn't exist, check whether zip data file exists
    if (!file.exists("household_power_consumption.zip")) {
      # Zip file does not exist, download from web
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                   method = "curl", destfile = "household_power_consumption.zip")
    }
    unzip("household_power_consumption.zip")
    # Read in data
    h <- read_delim("household_power_consumption.txt", ";", col_names = TRUE,
                    na = '?', col_types = "ccnnnnnnn")
    # Combine Date and Time to a single R object
    h$Date.Time <- dmy_hms(paste(h$Date, h$Time))
    # Keep only rows for 2007-02-01 and 2007-02-02, and remove columns Date and Time.
    dat <- h %>% 
           filter(Date.Time >= ymd("2007-02-01") & Date.Time < ymd("2007-02-03")) %>%
           select(-Date, -Time)
    # Cache data
    saveRDS(dat, file = "myCachedData.rds")
} else {
    dat <- readRDS("myCachedData.rds")
}