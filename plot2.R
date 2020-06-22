library(lubridate)
library(plyr)
#Read raw data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Subset data for 1/2/2007 and 2/2/2007 only and convert date and time values to Date class
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data <- mutate(data, timestamp = dmy_hms(paste(Date,Time)))
#Plot to PNG
png("plot2.png")
plot(data$timestamp, data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowats)")
dev.off()