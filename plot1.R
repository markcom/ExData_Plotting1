#Get all data
#Get the subset
#Get the vector as numeric
graphData <- fread("household_power_consumption.txt")
dates <- c("1/2/2007", "2/2/2007")
selectedGraphData <- subset(graphData, graphData$Date %in% dates)
globalActivePower <- as.numeric(selectedGraphData$Global_active_power)


#Plot the graph
hist(globalActivePower, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")


#Save the graph to PNG
dev.copy(png, filename="plot1.png")
dev.off ()