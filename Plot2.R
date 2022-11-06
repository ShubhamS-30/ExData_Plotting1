library(readr)
library("data.table")

df<-read_csv2('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course/household_power_consumption.txt')

df[df == '?']<-NA

df$Global_active_power <- as.numeric(df$Global_active_power)

df <- subset(df,Date=="1/2/2007"| Date=="2/2/2007")

df$dateTime = as.POSIXct(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
png(file = 'Plot2.png',width = 480,height = 480)
plot(x = df$dateTime,y = df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
