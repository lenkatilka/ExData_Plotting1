#load data
big_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date_time<-strptime(paste(big_data$Date,big_data$Time), "%d/%m/%Y %H:%M:%S")

#choose data from the dates we want
good<-(year(date_time)==2007)&(month(date_time)==2)&(day(date_time)<=2)
date_time<-date_time[good]

#make new vectors with data to plot
sm_1<-as.numeric(as.character(big_data$Sub_metering_1[good]))
sm_2<-as.numeric(as.character(big_data$Sub_metering_2[good]))
sm_3<-as.numeric(as.character(big_data$Sub_metering_3[good]))

#output png file
png(file="plot3.png",height=480,width=480)

plot(date_time,sm_1,type="n",xlab="",ylab="Energy sub metering")
points(date_time,sm_1,col="black",type="l")
points(date_time,sm_2,col="red",type="l")
points(date_time,sm_3,col="blue",type="l")
legend("topright",names(big_data[7:9]),col=c("black","red","blue"),pch="-",lwd=3)

dev.off()