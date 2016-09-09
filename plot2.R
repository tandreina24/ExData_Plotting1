setwd("C:/Users/AndreinaDeJ/Documents/Andreina Torres/coursera/cursos y cursera/Coursera/data scientits specialization/4-exploratory data analysis/week 1/assigment 1")

#Read data form Website to R
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),header = TRUE,sep=";",stringsAsFactors = FALSE,dec=".", na.strings = "?")
unlink(temp)

#subset data
data2<- subset(data, Date %in% c("1/2/2007","2/2/2007"))
head(data2)

#plot2
png("plot2.png",width = 480, height = 480 )
par(mar=c(4,4,4,4))
datetime<-strptime(paste(data2$Date, data2$Time,sep=" "),"%d/%m/%Y %H:%M:%S ")

#set english language to plot datetime
Sys.setlocale("LC_TIME", "English") 

plot(datetime, data2$Global_active_power, 
     ylab="Global active power (kilowatts)",
     xlab="",
     type="l"
)
dev.off()
