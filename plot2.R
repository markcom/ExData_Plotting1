#Set locale - day names in English
#Get all data
#Get the subset
#Add a date/time column
#Convert Global_Active_Power to Numeric
Sys.setlocale("LC_ALL","English")
graphData <- fread("household_power_consumption.txt")
dates <- c("1/2/2007", "2/2/2007")
selectedGraphData <- subset(graphData, graphData$Date %in% dates)
selectedGraphData$DateTime <- as.POSIXct(paste(selectedGraphData$Date, selectedGraphData$Time), 
           format="%d/%m/%Y %H:%M:%S")
selectedGraphData$Global_active_power <- 
    as.numeric(selectedGraphData$Global_active_power)


#Set graph margin and plot the graph
par(mar = c(2,4,4,2))
with(selectedGraphData, plot(DateTime, Global_active_power, type="n", 
                             ylab = "Global Active Power (kilowatts)"))
with(selectedGraphData, lines(DateTime, Global_active_power))


#Save the graph to PNG
dev.copy(png, filename="plot2.png")
dev.off ()