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
png(filename="plot2.png", height=480,width=480)
plot(newdate,dat1$Global_active_power,type="n", ylab="Global Active Power (kilowatts)")
lines(newdate,dat1$Global_active_power)