library(lubridate)
library(plyr)
#Read raw data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Subset data for 1/2/2007 and 2/2/2007 only and convert date and time values to Date class
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, timestamp = dmy_hms(paste(Date,Time)))
#Plot to PNG
png("plot3.png")
plot(data$timestamp, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
points(data$timestamp, data$Sub_metering_1, type="l")
points(data$timestamp, data$Sub_metering_2, type="l", col="red")
points(data$timestamp, data$Sub_metering_3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"))
dev.off()