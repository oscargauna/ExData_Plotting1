#Read raw data
data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#Subset data for 1/2/2007 and 2/2/2007 only
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
#Plot to PNG
png("plot1.png")
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()