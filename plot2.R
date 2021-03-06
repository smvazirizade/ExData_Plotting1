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
plot(subData$DateTime,as.numeric((subData$Global_active_power)), type="l",col="black",main="Global Active Power",ylab="Global Active Power(kilowatts)",xlab="")

#saving
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()
