
png(filename="plot4.png", width=480,height=480)
## Load Data
f <- "household_power_consumption.txt"
out <- read.table(f, header = TRUE, sep = ";")
out$Date <- as.Date(out$Date, format = "%m/%d/%Y")
out2<- subset(out,out$Date=="2007-01-02" | out$Date=="2007-02-02")
out2[,3] <- as.numeric(as.character(out2[,3]))
out2[,4] <- as.numeric(as.character(out2[,4]))
out2[,5] <- as.numeric(as.character(out2[,5]))
out2[,6] <- as.numeric(as.character(out2[,6]))
out2[,7] <- as.numeric(as.character(out2[,7]))
out2[,8] <- as.numeric(as.character(out2[,8]))
out2[,9] <- as.numeric(as.character(out2[,9]))

par(mfrow=c(2,2))


## Top Left Table

plot(out2[,3], type="l", col="black", ylim=range(out2[,3]), 
     axes=FALSE, ann=FALSE)
box()
title(ylab="Global Active Power (kilowatts)")
axis(2)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))



## Top Right Table

plot(out2[,5], type="l", col="black", ylim=range(out2[,5]), 
     axes=FALSE, ann=FALSE)
box()
title(ylab="Voltage",xlab="datetime")
axis(2)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))


## Bot Left Table

with(out2,plot(out2[,7],col="black",type="l",xlab="",labels=FALSE, 
               axes=FALSE,ann=FALSE))
with(out2, lines((out2[,8]), col = "red"))
with(out2, lines(out2[,9], col = "blue"))
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend("topright",title="", c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
box()
title(ylab="Energy sub metering")
axis(2,at=c(0,10,20,30),labels=c("0","10","20","30"))





## Bottom Right Table
plot(out2[,4], type="l", col="black", ylim=range(out2[,4]), 
     axes=FALSE, ann=FALSE)
box()
title(ylab="Global_reactive_power",xlab="datetime")
axis(2)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off()
