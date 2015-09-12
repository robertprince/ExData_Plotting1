## Creating Plot 2 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(subsetdata, plot(Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)"))
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()