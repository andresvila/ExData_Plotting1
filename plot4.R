
# Load the Data used

energyData<-read.table("../household_power_consumption.txt",sep=";",header=TRUE)
filteredData<-subset(energyData,Date=="1/2/2007"|Date=="2/2/2007")

tickMark=sum(filteredData$Date=="1/2/2007");

sub_1<-as.numeric(as.character(filteredData$Sub_metering_1))
sub_2<-as.numeric(as.character(filteredData$Sub_metering_2))
sub_3<-as.numeric(as.character(filteredData$Sub_metering_3))

volt<-as.numeric(as.character(filteredData$Voltage))


gRP<-as.numeric(as.character(filteredData$Global_reactive_power))

# Plot

png(file="plot4.png", width=480, height=480)

par(mfcol=c(2,2))

# first Plot


plot(numericData,type="l", col="black",axes=FALSE, ann=FALSE)
axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=c(0,2,4,6))
box()

title(ylab="Global Active Power")

# Second Plot

plot(sub_1,type="l", col="black",axes=FALSE, ann=FALSE)
points(sub_2,type="l",col="red")
points(sub_3,type="l",col="blue")

axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=c(0,10,20,30))
box()

title(ylab="Energy sub metering")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), 
       lwd=1,bty="n")

# third Plot


plot(volt,type="l", col="black",axes=FALSE, ann=FALSE)
axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=seq(234,246,2),lab=c("234","","238","","242","","246"))
box()

title(ylab="Voltage")

title(xlab="datetime")

# fourth Plot



plot(gRP,type="l", col="black",axes=FALSE, ann=FALSE)
axis(1, at=c(1,tickMark+1,length(numericData)), lab=c("Thu","Fri","Sat"))
axis(2, las=1, at=seq(0.0,0.5,.1))
box()

title(ylab="Global_reactive_power")

title(xlab="datetime")


dev.off()
