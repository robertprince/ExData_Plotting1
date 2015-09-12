## Creating Plot 3 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
with(subsetdata, {
  plot(Sub_metering_1, type = "l", col =  "black", xaxt = "n", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2, type = "l", col =  "red", ylab = NULL)
  lines(Sub_metering_3, type = "l", col =  "blue", ylab = NULL)
  axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
  })
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()