consumption_data <- read.table("data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               stringsAsFactors = FALSE,
                               dec = ".")

plot_data <- consumption_data[consumption_data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
sub_metering1 <- as.numeric(plot_data$Sub_metering_1)
sub_metering2 <- as.numeric(plot_data$Sub_metering_2)
sub_metering3 <- as.numeric(plot_data$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(date_time, sub_metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
