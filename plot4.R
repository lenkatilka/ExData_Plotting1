big_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date_time<-strptime(paste(big_data$Date,big_data$Time), "%d/%m/%Y %H:%M:%S")

good<-(year(date_time)==2007)&(month(date_time)==2)&(day(date_time)<=2)
date_time<-date_time[good]

sm_1<-as.numeric(as.character(big_data$Sub_metering_1[good]))
sm_2<-as.numeric(as.character(big_data$Sub_metering_2[good]))
sm_3<-as.numeric(as.character(big_data$Sub_metering_3[good]))

grp<-as.numeric(as.character(big_data$Global_reactive_power[good]))
gap<-as.numeric(as.character(big_data$Global_active_power[good]))
voltage<-as.numeric(as.character(big_data$Voltage[good]))

par(mfcol=c(2,2))

plot(date_time,gap,type="l",xlab="",ylab="Global Active Power")

plot(date_time,sm_1,type="n",xlab="",ylab="Energy sub metering")
points(date_time,sm_1,col="black",type="l")
points(date_time,sm_2,col="red",type="l")
points(date_time,sm_3,col="blue",type="l")
legend("topright",names(big_data[7:9]),col=c("black","red","blue"),pch="-",lwd=3,bty="n")
plot(date_time,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(date_time,grp,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.copy(png,"plot4.png",width=480, height=480)
dev.off()