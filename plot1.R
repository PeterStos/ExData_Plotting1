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

# Plot histogram and create png
png("plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(hpc_2007$Global_active_power), col = "red", breaks = 12, main = "Global Active Power", xlab = "GlobalActive Power (kilowats)" )
dev.off()
