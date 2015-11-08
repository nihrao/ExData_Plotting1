##Plot3.R to create plot3.png
#Read the .txt file to a data frame
x <- read.table("household_power_consumption.txt", header = T
                ,sep = ';', na.strings = "?")

#Create a new column that stores the timestamp value in the below mentioned format
x$ts <- strptime(paste(x$Date,x$Time),
                 format="%d/%m/%Y %H:%M:%S")

#Converting all values to R numeric
x$Global_active_power <- as.numeric(x$Global_active_power)

#Subset the specified date range
y <- subset(x, as.Date(x$ts) >= '2007-02-01' & as.Date(x$ts) < '2007-02-03')
na.omit(y)

#Open the png()
png(filename = 'plot3.png', height = 480, width = 480, bg = 'transparent')

# Plot the second sub-metering
plot(y$ts,
     y$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

# Plot the second sub-metering
lines(y$ts,
      y$Sub_metering_2,
      type="l",
      col="red")

# Plot the third sub-metering
lines(y$ts,
      y$Sub_metering_3,
      type="l",
      col="blue")

# Add the legend
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),lwd=2,col=c("black","red","blue"))

#Close
dev.off()