library(dplyr)
library(lubridate)
library(dplyr)

fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
download.file(fileURL, filename, method="curl") 

# Load  
hpc_table <- read.table("household_power_consumption.txt", header = TRUE,  sep = ";")
#head(hpc_table)
#names(hpc_table)
#str(hpc_table)

# Convert Date column to date d-m-y
hpc_table$Date <- dmy(hpc_table$Date)

# Filter two days
hpc_2007 <- filter(hpc_table, (hpc_table$Date >= as.Date("2007-2-1") & hpc_table$Date <= as.Date("2007-2-2")))
#head(hpc_2007)
#tail(hpc_2007)

hist(as.numeric(hpc_2007$Global_active_power), col = "red", breaks = 12, main = "Global Active Power", xlab = "GlobalActive Power (kilowats)" )
dev.copy(png, file = "plot1.png")
dev.off()

# Reference:
# https://blog.exploratory.io/filter-with-date-function-ce8e84be680