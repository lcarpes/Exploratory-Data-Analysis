library(dplyr)

data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot1<-filter(data, Date %in% "2/2/2007" | Date %in% "1/2/2007")
png("plot1.png", width=480, height=480)
hist(as.numeric(plot1$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

