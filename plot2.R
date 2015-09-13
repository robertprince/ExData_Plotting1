## Creating Plot 2 for Exploratory Data Anaylesis Course Project 1

# Load the data
plotdata <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

subsetdata <- subset(plotdata, Date == "1/2/2007" | Date == "2/2/2007")

subsetdata$DateTime <- with(subsetdata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(subsetdata, plot(Global_active_power ~ DateTime, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()