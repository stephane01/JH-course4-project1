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


# creates the plot
png(filename = "plot1.png")
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()

