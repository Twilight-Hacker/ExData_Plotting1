data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")
data[,1]<-as.Date(data[,1], "%d/%m/%Y")
data.1<-data[grep("2007-02-01",data[,1]),]
data.2<-data[grep("2007-02-02",data[,1]),]
data.t<-rbind(data.1,data.2)
data.t[,3]<-as.numeric(as.character(data.t[,3]))
pgn("plot1.pgn")
hist(data.t[,3], col="RED", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off