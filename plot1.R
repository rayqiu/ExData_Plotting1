# Read in data through readData.R
source("readData.R")

# Plot to png file
png("plot1.png", width=480, height=480)
hist(dat$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main  = "Global Active Power", 
     xlim = c(0, 6), ylim = c(0, 1200))
dev.off()
