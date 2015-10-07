# Read in data through readData.R
source("readData.R")

# Open png file for plot
png("plot4.png", width=480, height=480)

# Set layout and draw by column
par(mfcol = c(2,2))

# Plot 
plot(dat$Date.Time, dat$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(dat$Date.Time, dat$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(dat$Date.Time, dat$Sub_metering_2, col = "red")
lines(dat$Date.Time, dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lwd=1, bty = "n")
plot(dat$Date.Time, dat$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(dat$Date.Time, dat$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")
dev.off()
