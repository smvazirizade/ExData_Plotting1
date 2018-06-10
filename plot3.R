#cleaning Environment
m(list = setdiff(ls(), lsf.str()))
#cleaning COnsole
clc <- function() cat(rep("\n", 50))
clc()



#Reading and subsetting data
Data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(Data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subData <- Data[which(Data$Date=="1/2/2007" | Data$Date =="2/2/2007"),]
subData$DateTime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#calling the basic plot function
plot(subData$DateTime,as.numeric(as.character(subData$Sub_metering_1)), type="l",col="black",main="Global Active Power",ylab="Sub_metering",xlab="")
lines(subData$DateTime,as.numeric(as.character(subData$Sub_metering_2)), type="l",col="red",main="Global Active Power",ylab="Sub_metering",xlab="")
lines(subData$DateTime,as.numeric(as.character(subData$Sub_metering_3)), type="l",col="blue",main="Global Active Power",ylab="Sub_metering",xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
#saving
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()
