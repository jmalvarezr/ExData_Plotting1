#Reading data, specify numeric classes
data<-read.table("~/Coursera/Exploratory Data Analysis/Projects/Project1/data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#head(data)
#Subset on desired dates
dat1<-subset(data,data$Date=="2/2/2007" | data$Date=="1/2/2007")

#Convert dates loaded as factors by default, first to character vectors
#Then strptime and then to POSIXct format in order to plot
chardate<-as.character(dat1[,1])
chartime<-as.character(dat1[,2])
chardattime<-paste(chardate, chartime, sep=" ")
#head(chardattime)
dadate<-strptime(chardattime, "%d/%m/%Y %H:%M")
newdate<-as.POSIXct(dadate)
#create plot in png file
png(filename="plot4.png", height=480,width=480)
par(mfrow=c(2,2))
par(mar=c(4,4,2,2), oma=c(0,0,1,0))

plot(newdate,dat1$Global_active_power,type="n", ylab="Global Active Power")
lines(newdate,dat1$Global_active_power)

plot(newdate,dat1$Voltage, type="n", ylab="Voltage")
lines(newdate,dat1$Voltage)

plot(newdate,dat1$Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")
lines(newdate,dat1$Sub_metering_1,col="black")
lines(newdate,dat1$Sub_metering_2,col="red")
lines(newdate,dat1$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))

plot(newdate,dat1$Global_reactive_power, type="n", ylab="Global reactive power")
lines(newdate,dat1$Global_reactive_power)

