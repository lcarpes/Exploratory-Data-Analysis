library(dplyr)

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot2<-filter(data, Date %in% "2/2/2007" | Date %in% "1/2/2007")
plot2$Date<-strptime(paste(plot2$Date, plot2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(plot2$Date, as.numeric(plot2$Global_active_power), type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

