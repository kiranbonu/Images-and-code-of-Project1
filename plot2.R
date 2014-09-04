require(sqldf)
data <- read.csv.sql(file = 'household_power_consumption.txt',
                     sep = ";",
                     sql = "select * from file where Date = '1/2/2007'
                     or Date = '2/2/2007'",
                     header = TRUE)

#### pasting the date and time from the "data" dataset and converting it into
#### date type

sam1 <- as.POSIXct(paste(data$Date,data$Time), format = "%d/%m/%Y %H:%M:%S")
data$DT <- sam1

#### saving in png format with pixels

png(filename = "plot2.png",width=480,height=480)

##### basic plot 

plot(data$DT,data$Global_active_power,type="n",xlab=" ",
     ylab="Global Active Power (kilowatts)")

#### Line graph on top of the plot

lines(data$DT,data$Global_active_power)
dev.off()
