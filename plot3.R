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
DateTime <- selectedGraphData$DateTime


#Set graph margin and plot the graph
par(mar = c(2,4,4,2))

plot(range(DateTime), range(metering_1, metering_2, metering_3),
     type = "n",  ylab = "Energy sub metering")

lines(DateTime, metering_1, col = "black")
lines(DateTime, metering_2, col = "red")
lines(DateTime, metering_3, col = "blue")

legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#Save the graph to PNG
dev.copy(png, filename="plot3.png")
dev.off ()