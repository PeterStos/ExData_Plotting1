library(dplyr)
library(lubridate)
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileURL, filename, method="curl") 

# Load  dataset
hpc_table <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";")

# Convert Date column to date d-m-y
hpc_table$Date <- dmy(hpc_table$Date)

# Filter two days
hpc_2007 <- filter(hpc_table, (hpc_table$Date >= as.Date("2007-2-1") & hpc_table$Date <= as.Date("2007-2-2")))
head(hpc_2007)
str(hpc_2007)

str(as.POSIXct(paste(hpc_2007$Date, hpc_2007$Time), format="%Y-%m-%d %A %H:%M:%S"))
hpc_2007$Date <- as.POSIXct(paste(hpc_2007$Date, hpc_2007$Time), format="%Y-%m-%d %H:%M:%S ")

# Ploting plot3
png("plot3.png", width = 480, height = 480, units = "px")
plot(hpc_2007$Sub_metering_1 ~ hpc_2007$Date, type = "l", xlab = "", col = "black", ylab = "Energy Sub metering")
lines(hpc_2007$Sub_metering_2 ~ hpc_2007$Date, type = "l", xlab = "", col = "red")
lines(hpc_2007$Sub_metering_3 ~ hpc_2007$Date, type = "l", xlab = "", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1:1, cex = 1)

dev.off()

# Reference
# Plot multiple plots in one graph
# http://www.countbio.com/web_pages/left_object/R_for_biology/R_fundamentals/multiple_curves_R.html