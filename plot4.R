# initiates the working directory and reads the file
# if you want to run this program, please change with your own WD and dataset location
WD <- "C:/Users/paccaudp/Dropbox/coursera/John Hopkins - the data scientist toolbox/Session 4 - Exploratory data analysis/Project 1"
setwd(WD)
DataLocation <- "exdata_data_household_power_consumption/household_power_consumption.txt"
OutputFormat <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.table(DataLocation, header = TRUE, sep = ";", na.strings = "?", colClasses = OutputFormat)

# keeps only the relevant lines
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# adds a column with the right date / time format
DateTime <- paste(data$Date, data$Time)
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
data$DateTime <- DateTime

# creating the plot
png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(6,5,2,1))
with(data, {plot(DateTime, Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
            lines(DateTime, Global_active_power)})
with(data,{plot(DateTime, Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
           lines(DateTime, Voltage)})
with(data, {plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
            lines(DateTime, Sub_metering_1, col = "red")
            lines(DateTime, Sub_metering_2, col = "green")
            lines(DateTime, Sub_metering_3, col = "blue")})
legend("topright", col = c("red", "green", "blue"), lty = c(1, 1, 1), bty = "n", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, {plot(DateTime, Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
            lines(DateTime, Global_reactive_power)})
dev.off()
