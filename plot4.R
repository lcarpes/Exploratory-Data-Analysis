library(dplyr)

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot4<-filter(data, Date %in% "2/2/2007" | Date %in% "1/2/2007")
plot4$Date<-strptime(paste(plot4$Date, plot4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(plot4, {
  plot(plot4$Date, as.numeric(plot4$Global_active_power), type="l", ylab="Global Active Power", xlab="")
  plot(plot4$Date, as.numeric(plot4$Voltage), type="l", ylab="Voltage", xlab="datetime")
  plot(plot4$Date, as.numeric(plot4$Sub_metering_1), type="l", ylab="Energy Sub Metering", xlab="")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
  lines(plot4$Date, as.numeric(plot4$Sub_metering_2), type="l", col = "red")
  lines(plot4$Date, as.numeric(plot4$Sub_metering_3), type="l", col = "blue")
  plot(plot4$Date, as.numeric(plot4$Global_reactive_power), type="l", ylab="Global Reactive Power", xlab="datetime")
  
})
dev.off()
