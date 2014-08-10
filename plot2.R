data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
data.1<-data[grep("2007-02-01",data[,1]),]
data.2<-data[grep("2007-02-02",data[,1]),]
data.t<-rbind(data.1,data.2)
data.t[,3]<-as.numeric(as.character(data.t[,3]))
dates<-format(as.POSIXct(paste(data.t[,1], data.t[,2])), "%d/%m/%Y %H:%M:%S")
dates<-strptime(dates, "%d/%m/%Y %H:%M:%S")
png("plot2.png")
plot(dates, data.t[,3],type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()