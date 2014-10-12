
# Load the Data used

energyData<-read.table("../household_power_consumption.txt",sep=";",header=TRUE)
filteredData<-subset(energyData,Date=="1/2/2007"|Date=="2/2/2007")

# Plot

png(file="plot1.png", width=480, height=480)
hist(as.numeric(as.character(filteredData$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power",bg="transparent")

dev.off()