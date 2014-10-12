
# Load the Data used

energyData<-read.table("../household_power_consumption.txt",sep=";",header=TRUE)
filteredData<-subset(energyData,Date=="1/2/2007"|Date=="2/2/2007")

tickMark=sum(filteredData$Date=="1/2/2007");

sub_1<-as.numeric(as.character(filteredData$Sub_metering_1))
sub_2<-as.numeric(as.character(filteredData$Sub_metering_2))
sub_3<-as.numeric(as.character(filteredData$Sub_metering_3))

# Plot

png(file="plot3.png", width=480, height=480)

plot(sub_1,type="l", col="black",axes=FALSE, ann=FALSE)
points(sub_2,type="l",col="red")
points(sub_3,type="l",col="blue")

axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=c(0,10,20,30))
box()

title(ylab="Energy sub metering")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), 
       lwd=1)

dev.off()
