png(filename="plot1.png", width=480,height=480)
f <- "household_power_consumption.txt"
out <- read.table(f, header = TRUE, sep = ";")
out$Date <- as.Date(out$Date, format = "%m/%d/%Y")
out2<- subset(out,out$Date=="2007-01-02" | out$Date=="2007-02-02")
out2[,3] <- as.numeric(as.character(out2[,3]))
hist(out2[,3],col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()
