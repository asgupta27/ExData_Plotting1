# Read the Data Set
d1 <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep=";", header = TRUE)
d1$Date <- as.Date(d1$Date, "%d/%m/%Y")
d1$Time <- strptime(d1$Time, "%H:%M:%S")

# Filter the data set based on date
d3 <- d1[(d1$Date == as.Date("2007-02-01")| d1$Date == as.Date("2007-02-02")), ]

#plot the histogram
hist(as.numeric(d3$Global_active_power), xlab="Global Active Power (kilowatts)", ylab = "Frequency",main = "Global Active Power",  col="Red")
# Save  the plot 
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
