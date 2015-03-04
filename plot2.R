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
 plot(dateTime, dataset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
 dev.copy(png,file="plot2.png",width=480,height=480,units="px")
 dev.off()
 ## return(f) 
}
