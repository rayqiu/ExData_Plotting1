# Read in data through readData.R
source("readData.R")

# Plot to png file
png("plot2.png", width=480, height=480)
plot(dat$Date.Time, dat$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
