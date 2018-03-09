# Read the Data Set
d1 <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
d1 <- mutate(d1, timestamp = paste( d1$Date, d1$Time ))
d1$Date <- as.Date(d1$Date, "%d/%m/%Y")
d1$Time <- strptime(d1$Time, "%H:%M:%S")

# Filter the Data
d4 <- d1[(d1$Date == as.Date("2007-02-01")| d1$Date == as.Date("2007-02-02")), ]
d4$Sub_metering_1 <- as.numeric(d4$Sub_metering_1)
d4$Sub_metering_2 <- as.numeric(d4$Sub_metering_2)
d4$Sub_metering_3 <- as.numeric(d4$Sub_metering_3)

# Plot the Data 
plot( d4$timestamp, d4$Sub_metering_1 , ylab = "Energy Sub Metering", xlab="", type = "n")
lines(d4$timestamp, d4$Sub_metering_1, col="Black" )
lines(d4$timestamp, d4$Sub_metering_2, col="Red" )
lines(d4$timestamp, d4$Sub_metering_3, col="Blue" )
legend("topright",lwd = 1, cex = 1,pch=c(NA,NA,NA), col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save the Plot in png File
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()