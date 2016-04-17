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

png(filename="./plot3.png", width=480, height=480, units="px")

with(data,plot(x=fullDate,  y=Sub_metering_1, ylab="Energy sub metering", xlab="", type="n") )
with(data,lines(x=fullDate, y=Sub_metering_1, col="black"))
with(data,lines(x=fullDate, y=Sub_metering_2, col="red"))
with(data,lines(x=fullDate, y=Sub_metering_3, col="blue"))
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lwd=1
)

dev.off()
