
setwd('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course')
library(readr)
library("data.table")

df<-read_csv2('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course/household_power_consumption.txt')

df[df == '?']<-NA

df <- subset(df,Date =="1/2/2007" | Date =="2/2/2007")

df$dateTime = as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)
plot(df$dateTime,df$Sub_metering_1,type = 'l',xlab = "",ylab = 'Energy Sub Metering')
lines(df$dateTime,df$Sub_metering_2,col = 'red')
lines(df$dateTime,df$Sub_metering_3,col = 'blue')
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1),cex = 1.3)
dev.off()

