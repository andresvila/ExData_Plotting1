
# Load the Data used

energyData<-read.table("../household_power_consumption.txt",sep=";",header=TRUE)
filteredData<-subset(energyData,Date=="1/2/2007"|Date=="2/2/2007")

numericData<-as.numeric(as.character(filteredData$Global_active_power))


# Plot

tickMark=sum(filteredData$Date=="1/2/2007");


png(file="plot2.png", width=480, height=480)

plot(numericData,type="l", col="black",axes=FALSE, ann=FALSE)
axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=c(0,2,4,6))
box()

title(ylab="Global Active Power (kilowatts)")

dev.off()