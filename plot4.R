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

#creating multiple figures in a window
par(mfrow=c(2,2))

#calling the basic plot function
with(subData,{
  plot(subData$DateTime,as.numeric((subData$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subData$DateTime,as.numeric((subData$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subData$DateTime,subData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subData,lines(DateTime,as.numeric(as.character(Sub_metering_1))))
  with(subData,lines(DateTime,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subData,lines(DateTime,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subData$DateTime,as.numeric(as.character(subData$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
#saving

dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()
