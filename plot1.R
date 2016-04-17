# Needed libraries
require(dplyr)

# Reading data and discarding unwanted data by subseting
data <- read.csv("./household_power_consumption.txt", na.strings = "?", sep = ";")

# Discarding unwanted data by subseting
data       <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

# Using data from two columns to generate a full date
fullDate   <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Keeping the full date and discarding the two other columns
data       <- select(cbind(fullDate,data), -c(2,3))

png(filename="./plot2.png", width=480, height=480, units="px")

hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()
