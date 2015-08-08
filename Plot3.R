png(filename="plot3.png", width=480,height=480)
f <- "household_power_consumption.txt"
out <- read.table(f, header = TRUE, sep = ";")
out$Date <- as.Date(out$Date, format = "%m/%d/%Y")
out2<- subset(out,out$Date=="2007-01-02" | out$Date=="2007-02-02")
out2[,7] <- as.numeric(as.character(out2[,7]))
out2[,8] <- as.numeric(as.character(out2[,8]))
out2[,9] <- as.numeric(as.character(out2[,9]))
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
dev.off()
