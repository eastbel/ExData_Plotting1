getplotdata <- function(date1="01/02/2007",date2="02/02/2007",color="Red")
  {
  
  install.packages("dplyr")
  library(dplyr)
  setwd("C:/Rtools")
  
  outcomedataframe <- read.delim("household_power_consumption.txt",header=TRUE,sep=";", quote="",dec=".",na.strings="?", colClasses = "character")
  f<-data.frame()
  f<-filter(outcomedataframe,as.Date(outcomedataframe$Date,"%d/%m/%Y")==as.Date(date2,"%d/%m/%Y")|as.Date(outcomedataframe$Date,"%d/%m/%Y")==as.Date(date1,"%d/%m/%Y"))
  dataset<-f
 ## hist(as.numeric(f$Global_active_power),col=color,main = paste("Histogram of" , xname),xlab=xaxisname)
 par(mfrow=c(1,1))
 dateTime            <- as.POSIXlt(paste(as.Date(dataset$Date, format="%d/%m/%Y"), dataset$Time, sep=" "))
 plot(dateTime, dataset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
 lines(dateTime, dataset$Sub_metering_2, type="l", col="Red")
 lines(dateTime, dataset$Sub_metering_3, type="l", col="Blue")
 legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = c(1,1, 1),col = c("Black","Red","Blue"))
 dev.copy(png,file="plot3.png",width=480,height=480,units="px")
 dev.off()
 
 ## return(f) 
}