## Creating Plot 3 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset the data for the dates 1/2/2007 and 2/2/2007 only
subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

# Create a new variable with the Date and Time combined
subsetdata$DateTime <- with(subsetdata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Select the png plotting device and size of image
# Create the plot
# Close the png plotting device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
with(subsetdata, {
  plot(Sub_metering_1 ~ DateTime, type = "l", col =  "black", xlab = "", ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ DateTime, type = "l", col =  "red", ylab = NULL)
  lines(Sub_metering_3 ~ DateTime, type = "l", col =  "blue", ylab = NULL)
    })
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()