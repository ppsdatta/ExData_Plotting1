consumption_data <- read.table("data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               stringsAsFactors = FALSE,
                               dec = ".")

consumption_data$Date <- as.Date(consumption_data$Date, format = "%d/%m/%Y")
consumption_data$Time <- strptime(consumption_data$Time, "%H:%M:%S")
plot_data <- subset(consumption_data, Date %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), 
                                                  as.Date("2007-02-02", format = "%Y-%m-%d")))


png("plot1.png", width = 480, height = 480)

hist(plot_data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
  