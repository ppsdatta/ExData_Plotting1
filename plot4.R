consumption_data <- read.table("data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               stringsAsFactors = FALSE,
                               dec = ".")

plot_data <- consumption_data[consumption_data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(plot_data)
date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(plot_data$Global_active_power)
global_reactive_power <- as.numeric(plot_data$Global_reactive_power)
voltage <- as.numeric(plot_data$Voltage)
sub_metering1 <- as.numeric(plot_data$Sub_metering_1)
sub_metering2 <- as.numeric(plot_data$Sub_metering_2)
sub_metering3 <- as.numeric(plot_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="date_time", ylab="Voltage")

plot(date_time, sub_metering1, type="l", ylab="Energy sub_metering", xlab="")
lines(date_time, sub_metering2, type="l", col="red")
lines(date_time, sub_metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, global_reactive_power, type="l", xlab="date_time", ylab="Global_reactive_power")

dev.off()