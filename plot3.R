setwd("C:/Users/AndreinaDeJ/Documents/Andreina Torres/coursera/cursos y cursera/Coursera/data scientits specialization/4-exploratory data analysis/week 1/assigment 1")

#Read data form Website to R
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".", na.strings = "?")
unlink(temp)

#subset data
data2<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
head(data2)

#Plot3
png("plot3.png",width = 480, height = 480 )
par(mar=c(4,4,4,4))
plot(datetime, data2$Sub_metering_1,
     ylab="Energy sub metering",
     xlab="",
     type="n")
points(datetime, data2$Sub_metering_1,type="l")
points(datetime, data2$Sub_metering_2,col="red",type="l")
points(datetime, data2$Sub_metering_3,col="blue",type="l")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("Black","red","blue"),
       lty=1)
dev.off()
