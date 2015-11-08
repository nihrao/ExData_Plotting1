##Plot2.R to create plot2.png
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
png(filename = 'plot2.png', height = 480, width = 480, bg = 'transparent')


plot(y$ts,
     y$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

#Close
dev.off()
