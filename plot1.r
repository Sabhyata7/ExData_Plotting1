
data <- read.csv("household_power_consumption.txt",
                 stringsAsFactors = F,
                 sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

require(lubridate)
data <- data[year(data$Date) == 2007 & month(data$Date) == 2 & day(data$Date) <= 2,]

data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png",width = 480, height = 480)
hist(data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()


