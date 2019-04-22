library(dplyr)

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot3<-filter(data, Date %in% "2/2/2007" | Date %in% "1/2/2007")
plot3$Date<-strptime(paste(plot3$Date, plot3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(plot3$Date, as.numeric(plot3$Sub_metering_1), type="l", ylab="Energy Sub Metering", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
lines(plot3$Date, as.numeric(plot3$Sub_metering_2), type="l", col = "red")
lines(plot3$Date, as.numeric(plot3$Sub_metering_3), type="l", col = "blue")
dev.off()
