## Creating Plot 1 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
with(subsetdata, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col =  "red"))
dev.off()