library(readr)
library("data.table")
setwd('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course')

df<-read_csv2('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course/household_power_consumption.txt')

df[df == '?']<-NA

df <- subset(df,Date =="1/2/2007" | Date =="2/2/2007")

df$Global_active_power <- as.numeric(df$Global_active_power)

df$dateTime = as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2),mar = c(1,1,1,1),oma = c(2,2,2,2),mai = c(1, 0.65, 0.65, 0.65))
with(df,{
  plot(x = df$dateTime,y = df$Global_active_power, type="l",xlab = "",ylab="Global Active Power (kilowatts)")
  plot(x = df$dateTime,y = df$Voltage, type="l",ylab="Voltage",xlab = 'Datetime')
  plot(df$dateTime,df$Sub_metering_1,type = 'l',xlab = "",ylab = 'Energy Sub Metering')
  lines(df$dateTime,df$Sub_metering_2,col = 'red')
  lines(df$dateTime,df$Sub_metering_3,col = 'blue')
  legend("topright"
         , col=c("black","red","blue")
         , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
         ,lty=c(1,1), lwd=c(1,1),cex = 0.5)
  
  plot(df$dateTime, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()