getplotdata <- function(date1="02/01/2007",date2="02/02/2007",color="Red")
  {
  install.packages("dplyr")
  library(dplyr)
  setwd("C:/Rtools")
  
  outcomedataframe <- read.delim("household_power_consumption.txt",header=TRUE,sep=";", quote="",dec=".",na.strings="?", colClasses = "character")
  f<-data.frame()
  f<-filter(outcomedataframe,as.Date(outcomedataframe$Date,"%d/%m/%Y")==as.Date(date2,"%m/%d/%Y")|as.Date(outcomedataframe$Date,"%d/%m/%Y")==as.Date(date1,"%m/%d/%Y"))
  xname<-"Global Active Power"
  xaxisname<-"Global Active Power (kilowatts)"
  ##hist(as.numeric(f$Global_active_power),col=color,main = paste("Histogram of" , xname),xlab=xaxisname)
  ##plot(as.numeric(f$Global_active_power),col=color,main = paste("Histogram of" , xname),xlab=xaxisname,type="h")
  par(mfrow=c(1,1))
  hist(as.numeric(f$Global_active_power),col="Red",main="Global Active Power",xlab=xaxisname,plot=TRUE)
  
 dev.copy(png,file="plot1.png",width=480,height=480,units="px")
  dev.off()
  
  ##return(f) 
}
