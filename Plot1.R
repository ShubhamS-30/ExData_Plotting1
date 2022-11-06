library(readr)
setwd('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course')
df<-read_csv2('C:/Users/tapan/Desktop/STUDY MATERIAL/5TH SEM 22-23/DATA SCIENCE FUNDAMENTALS UCS538/LAB/John Hopkins Course/household_power_consumption.txt')


df<-subset(df,Date=="1/2/2007"| Date=="2/2/2007")

df[df == '?']<-NA

df$Global_active_power <- as.numeric(df$Global_active_power)

png(file= "plot1.png",width = 480,height = 480)

hist(df$Global_active_power,xlab = 'Global Active Power(kilowatts)',col = 'red',main = 'Global Active power')

dev.off()
