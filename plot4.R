#Set locale - day names in English
#Get all data
#Get the subset
#Add a date/time column
#Get sub_metering_x + convert to Numeric
Sys.setlocale("LC_ALL","English")
graphData <- fread("household_power_consumption.txt")
dates <- c("1/2/2007", "2/2/2007")
selectedGraphData <- subset(graphData, graphData$Date %in% dates)
selectedGraphData$DateTime <- as.POSIXct(paste(selectedGraphData$Date, selectedGraphData$Time), 
                                         format="%d/%m/%Y %H:%M:%S")
metering_1 <- as.numeric(selectedGraphData$Sub_metering_1)
metering_2 <- as.numeric(selectedGraphData$Sub_metering_2)
metering_3 <- as.numeric(selectedGraphData$Sub_metering_3)
Global_active_power <- as.numeric(selectedGraphData$Global_active_power)
Voltage <- as.numeric(selectedGraphData$Voltage)
Global_reactive_power <- as.numeric(selectedGraphData$Global_reactive_power)
DateTime <- selectedGraphData$DateTime


#Set graph mfcol
png("plot4.png")
par(mfcol = c(2, 2), cex.axis=.8)

#Graph 1
plot(DateTime, Global_active_power, type="n", 
     ylab = "Global Active Power", xlab = "")
lines(DateTime, Global_active_power)


#Graph2
plot(range(DateTime), range(metering_1, metering_2, metering_3),
     type = "n",  ylab = "Energy sub metering", xlab = "")
lines(DateTime, metering_1, col = "black")
lines(DateTime, metering_2, col = "red")
lines(DateTime, metering_3, col = "blue")
legend("topright", lty = 1, bty="n", col = c("black", "blue", "red"), cex=0.7,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Graph 3
plot(DateTime, Voltage, type="n", 
     xlab = "datetime")
lines(DateTime, Voltage)


#Graph4
plot(DateTime, Global_reactive_power, type="n", 
     xlab = "datetime")
lines(DateTime, Global_reactive_power)


#Save the graph to PNG
#dev.copy(png, filename="plot4.png")
dev.off ()