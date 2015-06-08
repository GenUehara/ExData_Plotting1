# read file and create data frame
dataWk1 <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

# convert Date to Date type
dataWk1$Date <- as.Date(dataWk1$Date, "%d/%m/%Y")

# Subset only the date range needed
dataNeeded <- subset(dataWk1, Date == '2007-02-01' | Date == '2007-02-02')

# convert Time 
dataNeeded$Time <- strptime(dataNeeded$Time, "%H:%M:%OS")

# merge Date and Time
cbind(dateTime = format(as.POSIXct(paste(dataNeeded$Date,dataNeeded$Time)),"%d/%m/%Y %H:%M:%S"), dataNeeded)


# now plot!
plot(dataNeeded$Time, dataNeeded$Sub_metering_1, type = "l", col = "black", pch = 27,ylab = "Energy sub metering")
lines(dataNeeded$Time, dataNeeded$Sub_metering_2, col = "red")
lines(dataNeeded$Time, dataNeeded$Sub_metering_3, col = "blue")
dev.copy(png, 'plot3.png', width = 480, height = 480)
dev.off()