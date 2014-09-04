#### NOTE: Since R-console is not coverting the image properly into 480 X 480
#### I have copied the code into R-console and ran the code. 

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

#### telling to store in png format with 480 x 480

png(filename = "plot3.png",width=480,height=480)

#### plotting

plot(data$DT,data$Sub_metering_1,type="n",xlab=" ",
     ylab="Energy sub meeting")
lines(data$DT,data$Sub_metering_1)
lines(data$DT,data$Sub_metering_2,col="Red")
lines(data$DT,data$Sub_metering_3,col="blue")

#### creating the legend

legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=1, col=c('black','orangered','blue'))

dev.off()
