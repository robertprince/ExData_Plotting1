## Creating Plot 4 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset the data for the dates 1/2/2007 and 2/2/2007 only
subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new variable with the Date and Time combined
subsetdata$DateTime <- with(subsetdata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Select the png plotting device and size of image
# Create the 2 by 2 matrix for plotting the four plots into
# Create the four plots
# Close the png plotting device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfcol = c(2, 2))
with(subsetdata, {
  plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  plot(Sub_metering_1 ~ DateTime, type = "l", col =  "black", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ DateTime, type = "l", col =  "red", ylab = NULL)
  lines(Sub_metering_3 ~ DateTime, type = "l", col =  "blue", ylab = NULL)
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Voltage ~ DateTime, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(Global_reactive_power ~ DateTime, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
  })
dev.off()