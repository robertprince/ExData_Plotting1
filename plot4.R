## Creating Plot 4 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset the data for the dates 1/2/2007 and 2/2/2007 only
subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

# Select the png plotting device and size of image
# Create the 2 by 2 matrix for plotting the four plots into
# Create the four plots 
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
with(subsetdata, {
  plot(Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  plot(Sub_metering_1, type = "l", col =  "black", xaxt = "n", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2, type = "l", col =  "red", ylab = NULL)
  lines(Sub_metering_3, type = "l", col =  "blue", ylab = NULL)
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Voltage, type = "l", xaxt = "n", xlab = "datetime", ylab = "Voltage")
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  plot(Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", ylab = "Global_reactive_power")
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
})
# Close the png plotting device
dev.off()