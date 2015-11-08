file = "household_power_consumption.txt"

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip- the data originally came from this link - saved onto local hard drve as txt file above

elecdata = read.csv(file, header = TRUE, sep = ";", na.strings="?") # reading data to data frame
elecdata$Date = as.Date(elecdata$Date, "%d/%m/%Y") # converting Date column to date class
elecdataFeb = subset(elecdata, Date == "2007-02-01" | Date == "2007-02-02") #subseting for required 2 days of data

library(lubridate)
elecdataFeb$Time = ymd_hms(paste(elecdataFeb$Date, elecdataFeb$Time)) # converting time column to 'time' class

#plottong and sending to .png file format
png('plot4.png',width = 480, height = 480) # using png function to get the legend box sizing issue instead of dev.copy function

par(mfrow =c(2,2)) # setting global graphics parameters to print 4 charts in 2X2 matrix format

#plot 1 of 4
plot(elecdataFeb$Time, elecdataFeb$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

#plot 2 of 4
plot(elecdataFeb$Time, elecdataFeb$Voltage, type="l", xlab="datetime", ylab = "Voltage")

#plot 3 of 4
plot(elecdataFeb$Time, elecdataFeb$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(elecdataFeb$Time, elecdataFeb$Sub_metering_2, type="l", col="red")
lines(elecdataFeb$Time, elecdataFeb$Sub_metering_3, type="l", col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1, bty="n")

#plot 4 of 4
plot(elecdataFeb$Time, elecdataFeb$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")


dev.off()

        