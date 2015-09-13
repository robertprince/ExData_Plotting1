## Creating Plot 1 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

# Subset the data for the dates 1/2/2007 and 2/2/2007 only
subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

# Select the png plotting device and size of image
# Create the plot
# Close the png plotting device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
with(subsetdata, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col =  "red"))
dev.off()