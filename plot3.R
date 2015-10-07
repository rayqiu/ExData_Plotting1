# Read in data through readData.R
source("readData.R")

# Plot to png file
png("plot3.png", width=480, height=480)
plot(dat$Date.Time, dat$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(dat$Date.Time, dat$Sub_metering_2, col = "red")
lines(dat$Date.Time, dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1)
dev.off()
