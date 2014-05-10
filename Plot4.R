setwd("F:/Andras_work/Courses/Coursera/2013-14/B_SP-DS_05-05_ExploratoryDataAnalysis/Assignment1")
names <- read.table("household_power_consumption.txt",header=T,nrows=1,sep=";")
data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings = "?")
names(data) <- names(names)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Plot 4
par(mfrow = c(2,2))
with(data, {
     plot(Time,Global_active_power, ylab = "Global Active Power", xlab="", type="l")
     plot(Time,Voltage, ylab = "Voltage", xlab="datetime", type="l")
     plot(Time,Sub_metering_1, col="blue", xlab="", ylab="Energy sub metering", type="l")
     with(data, points(Time,Sub_metering_2, col="red", type="l"))
     with(data, points(Time,Sub_metering_3, col="black", type="l"))
     legend("topright",border = "", pch = "-", bty = "n", col=c("blue","red","black"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
     plot(Time,Global_reactive_power, ylab = "Global Reactive Power", xlab="datetime", type="l")
})


dev.copy(png,"Plot4.png", width=480, height=480)
dev.off()
