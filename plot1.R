big_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
big_data$Date<-dmy(big_data$Date)
big_data$Time<-hms(big_data$Time)

data<-big_data[(year(big_data$Date)==2007)&(month(big_data$Date)==2)&(day(big_data$Date)<=2),]
big_data<-NULL

data$Global_active_power<-as.numeric(as.character((data$Global_active_power)))
hist(data$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png,"plot1.png",width=480, height=480)
dev.off()