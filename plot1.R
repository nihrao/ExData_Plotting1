##Plot1.R to create plot1.png
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
png(filename = 'plot1.png', height = 480, width = 480, bg = 'transparent')
hist(y$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
#Close
dev.off()
