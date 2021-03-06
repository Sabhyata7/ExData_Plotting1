


data <- read.csv("household_power_consumption.txt",
                 stringsAsFactors = F,
                 sep = ";")
data$my_date <- paste(as.character(data$Date),data$Time,sep = ":")
data$my_date <- strptime(data$my_date, format = "%d/%m/%Y:%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

require(lubridate)
data <- data[year(data$Date) == 2007 & month(data$Date) == 2 & day(data$Date) <= 2,]

data$Global_active_power <- as.numeric(data$Global_active_power)

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data$Voltage <- as.numeric(data$Voltage)

data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

png("plot4.png",width = 480, height = 480)
par(mfcol = c(2,2))
{
    par(mar = c(4,4,2,2))
    plot(data$my_date, data$Global_active_power
     ,type = "l" 
     ,ylab = "Global Active Power"
     ,xlab = "")
}
{
    par(mar = c(4,4,2,2))
    plot(data$my_date, data$Sub_metering_1
         ,type = "l"
         ,col = "black"
         ,ylab = "Energy sub metering"
         ,xlab = "")
    lines(data$my_date,data$Sub_metering_2, col = "red")
    lines(data$my_date,data$Sub_metering_3, col = "blue")
    legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           col=c("black","red", "blue"), lty=1,
           bty = "n")
}
{
    par(mar = c(4,4,2,2))
    plot(data$my_date, data$Voltage
         ,type = "l"
         ,ylab = "Voltage"
         ,xlab = "datetime")
}
{
    par(mar = c(4,4,2,2))
    plot(data$my_date, data$Global_reactive_power
         ,type = "l"
         ,ylab = "Global_reactive_power"
         ,xlab = "datetime")
}
dev.off()
