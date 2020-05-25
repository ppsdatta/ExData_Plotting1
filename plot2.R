consumption_data <- read.table("data/household_power_consumption.txt",
                               header = TRUE,
                               sep = ";",
                               na.strings = c("?"),
                               stringsAsFactors = FALSE,
                               dec = ".")

plot_data <- subset(consumption_data, Date %in% c("1/2/2007","2/2/2007"))
date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)

with(plot_data,
     plot(date_time, plot_data$Global_active_power, 
          type="l", 
          xlab="", 
          ylab="Global Active Power (kilowatts)"))

dev.off()
