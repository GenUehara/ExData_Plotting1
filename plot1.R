# read file and create data frame
dataWk1 <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

# convert Date to Date type
dataWk1$Date <- as.Date(dataWk1$Date, "%d/%m/%Y")

# Subset only the date range needed
dataNeeded <- subset(dataWk1, Date == '2007-02-01' | Date == '2007-02-02')

# convert Time 
dataNeeded$Time <- strptime(dataNeeded$Time, "%H:%M:%OS")

# now plot!
#plot(Frequency, dataNeeded$Global_active_power, main = "Global Active Power")
barplot(table(dataNeeded$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.copy(png, 'plot1.png', width = 480, height = 480)
dev.off()

#rm(datawk1)
#memory.size(Global.Active.Power,)
#typeof(dataWk1$Date)