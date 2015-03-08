#load data
big_data<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
date_time<-strptime(paste(big_data$Date,big_data$Time), "%d/%m/%Y %H:%M:%S")
gap<-big_data$Global_active_power

#choose data from the dates we want
good<-(year(date_time)==2007)&(month(date_time)==2)&(day(date_time)<=2)
date_time<-date_time[good]
gap<-gap[good]
gap<-as.numeric(as.character(gap))

#plot and output png file
plot(date_time,gap, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,"plot2.png",width=480, height=480)
dev.off()

