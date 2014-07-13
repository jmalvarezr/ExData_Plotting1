#Reading data, specify numeric classes
data<-read.table("~/Coursera/Exploratory Data Analysis/Projects/Project1/data/household_power_consumption.txt",sep=";",header=TRUE,na.strings="?", colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#head(data)
#Subset on desired dates
dat1<-subset(data,data$Date=="2/2/2007" | data$Date=="1/2/2007")
#Create histogram on first plot
png(filename="plot1.png", height=480,width=480)
hist(dat1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
