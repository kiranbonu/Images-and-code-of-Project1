require(sqldf)
data <- read.csv.sql(file = 'household_power_consumption.txt',
                     sep = ";",
                     sql = "select * from file where Date = '1/2/2007'
                     or Date = '2/2/2007'",
                     header = TRUE)
png(filename = "plot1.png",width=480,height=480)
hist(data$Global_active_power,xlab = "Global Active Power (kilowatts)",
     col = "Red",main = "Global Active Power")
dev.off()