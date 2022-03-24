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

# Plot histogram and create png
plot(hpc_2007$Global_active_power ~ hpc_2007$Date, type = "l", xlab = "", ylab = "GlobalActive Power (kilowats)")
dev.copy(png, file = "plot2.png")
dev.off()
