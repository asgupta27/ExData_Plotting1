#Read Data set
d1 <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
d1 <- mutate(d1, timestamp = paste( d1$Date, d1$Time ))
d1$Date <- as.Date(d1$Date, "%d/%m/%Y")
d1$Time <- strptime(d1$Time, "%H:%M:%S")

# Filter the data set based on date
d4 <- d1[(d1$Date == as.Date("2007-02-01")| d1$Date == as.Date("2007-02-02")), ]
d4$timestamp <- strptime(d4$timestamp, "%d/%m/%Y %H:%M:%S")
d4$Global_active_power = as.numeric(d4$Global_active_power)
d4$Sub_metering_1 <- as.numeric(d4$Sub_metering_1)
d4$Sub_metering_2 <- as.numeric(d4$Sub_metering_2)
d4$Sub_metering_3 <- as.numeric(d4$Sub_metering_3)
d4$Voltage <- as.numeric(d4$Voltage)
# setting the layout of graphs
par(mfrow=c(2,2))

# Plot1
plot( d4$timestamp, d4$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

# Plot2
plot(d4$timestamp, d4$Voltage,type = "l", xlab="DateTime", ylab = "Voltage")

# Plot3
plot( d4$timestamp, d4$Sub_metering_1 , ylab = "Energy Sub Metering", xlab="", type = "n")
lines(d4$timestamp, d4$Sub_metering_1, col="Black" )
lines(d4$timestamp, d4$Sub_metering_2, col="Red" )
lines(d4$timestamp, d4$Sub_metering_3, col="Blue" )
legend("topright", lty=1,lwd = 1,bty = "n",seg.len = 0.3, inset = c(-.47,0), cex = 0.72,pch=c(NA,NA,NA), col=c("Black","Red","Blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot 4

plot(d4$timestamp, d4$Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab = "DateTime")

# Save  the plot 
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()
