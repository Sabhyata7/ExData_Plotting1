
data <- read.csv("household_power_consumption.txt",
                 stringsAsFactors = F,
                 sep = ";")
data$my_date <- paste(as.character(data$Date),data$Time,sep = ":")
data$my_date <- strptime(data$my_date, format = "%d/%m/%Y:%H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

require(lubridate)
data <- data[year(data$Date) == 2007 & month(data$Date) == 2 & day(data$Date) <= 2,]

data$Global_active_power <- as.numeric(data$Global_active_power)



png("plot2.png",width = 480, height = 480)
par(mar = c(3,4,1,1))
plot(data$my_date, data$Global_active_power
     ,type = "l" 
     ,ylab = "Global Active Power (kilowatts)"
     ,xlab = NULL)
dev.off()


