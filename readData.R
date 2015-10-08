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
    dat <- h %>% 
           # Combine Date and Time to a single R object and 
           mutate(Date.Time = dmy_hms(paste(Date, Time))) %>%
           # Remove original columns Date and Time
           select(-Date, -Time) %>%
           # Keep only rows for 2007-02-01 and 2007-02-02
           filter(Date.Time >= ymd("2007-02-01") & Date.Time < ymd("2007-02-03")) 
    # Cache data
    saveRDS(dat, file = "myCachedData.rds")
} else {
    dat <- readRDS("myCachedData.rds")
}