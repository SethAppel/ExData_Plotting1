png(filename="plot2.png", width=480,height=480)
f <- "household_power_consumption.txt"
out <- read.table(f, header = TRUE, sep = ";")
out$Date <- as.Date(out$Date, format = "%m/%d/%Y")
out2<- subset(out,out$Date=="2007-01-02" | out$Date=="2007-02-02")
out2[,3] <- as.numeric(as.character(out2[,3]))
plot(out2[,3], type="l", col="black", ylim=range(out2[,3]), 
     axes=FALSE, ann=FALSE)
box()
title(ylab="Global Active Power (kilowatts)")
axis(2)
axis(1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()
