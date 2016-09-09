setwd("C:/Users/AndreinaDeJ/Documents/Andreina Torres/coursera/cursos y cursera/Coursera/data scientits specialization/4-exploratory data analysis/week 1/assigment 1")

#Read data form Website to R
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".", na.strings = "?")
unlink(temp)

#subset data
data2<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
head(data2)

#plot4
png("plot4.png",width = 480, height = 480)
par(mfcol=c(2,2),mar=c(4,4,4,4))

#4.1
datetime<-strptime(paste(data2$Date, data2$Time,sep=" "),"%d/%m/%Y %H:%M:%S ")
Sys.setlocale("LC_TIME", "English") 


plot(datetime, data2$Global_active_power, 
     ylab="Global active power",
     xlab="",
     type="l"
)

#4.2
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
       cex = 0.8,
       lty=1)

#4.3

plot(datetime, data2$Voltage, 
     ylab="Voltage",
     xlab="datetime",
     type="l"
)


#4.4
plot(datetime, data2$Global_reactive_power, 
     ylab="Global_reactive_power",
     xlab="datetime",
     type="l"
)
dev.off()