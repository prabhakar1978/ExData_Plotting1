file = "household_power_consumption.txt"

#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip- the data originally came from this link - saved onto local hard drve as txt file above

elecdata = read.csv(file, header = TRUE, sep = ";", na.strings="?") # reading data to data frame
elecdata$Date = as.Date(elecdata$Date, "%d/%m/%Y") # converting Date column to date class
elecdataFeb = subset(elecdata, Date == "2007-02-01" | Date == "2007-02-02") #subseting for required 2 days of data

library(lubridate)
elecdataFeb$Time = ymd_hms(paste(elecdataFeb$Date, elecdataFeb$Time)) # converting time column to 'time' class

#plottong and sending to .png file format

plot(elecdataFeb$Time, elecdataFeb$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.copy(png,'plot2.png', width = 480, height = 480)
dev.off()

        