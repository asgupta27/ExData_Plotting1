# Read the Data Set
d1 <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
d1 <- mutate(d1, timestamp = paste( d1$Date, d1$Time ))
d1$Date <- as.Date(d1$Date, "%d/%m/%Y")
d1$Time <- strptime(d1$Time, "%H:%M:%S")

# Filter the Data
d4 <- d1[(d1$Date == as.Date("2007-02-01")| d1$Date == as.Date("2007-02-02")), ]
d4$timestamp <- strptime(d4$timestamp, "%d/%m/%Y %H:%M:%S")
d4$Global_active_power = as.numeric(d4$Global_active_power)

# Plot the Data 
plot( d4$timestamp, d4$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

# Save the Plot in png File
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()