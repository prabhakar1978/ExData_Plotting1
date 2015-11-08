file = "household_power_consumption.txt"

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip- the data originally came from this link - saved onto local hard drve as txt file above

elecdata = read.csv(file, header = TRUE, sep = ";", na.strings="?") # reading data to data frame
elecdata$Date = as.Date(elecdata$Date, "%d/%m/%Y") # converting Date column to date class
elecdataFeb = subset(elecdata, Date == "2007-02-01" | Date == "2007-02-02") #subseting for required 2 days of data

library(lubridate)
elecdataFeb$Time = ymd_hms(paste(elecdataFeb$Date, elecdataFeb$Time)) # converting time column to 'time' class

#plotting and sending to .png file format
# Good information about 'Saving Plots in R' in this webpage - http://www.stat.berkeley.edu/~s133/saving.html

png('plot3.png',width = 480, height = 480) # using png function to get the legend box sizing issue instead of dev,copy function

plot(elecdataFeb$Time, elecdataFeb$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
lines(elecdataFeb$Time, elecdataFeb$Sub_metering_2, type="l", col="red")
lines(elecdataFeb$Time, elecdataFeb$Sub_metering_3, type="l", col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1)

dev.off()

        