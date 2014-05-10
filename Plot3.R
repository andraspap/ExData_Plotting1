setwd("F:/Andras_work/Courses/Coursera/2013-14/B_SP-DS_05-05_ExploratoryDataAnalysis/Assignment1")
names <- read.table("household_power_consumption.txt",header=T,nrows=1,sep=";")
data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings = "?")
names(data) <- names(names)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")


# Plot 3
par(mfrow = c(1,1))
with(data, plot(Time,Sub_metering_1, xlab = "", ylab = "Energy sub metering", col="black", type="l"))
with(data, points(Time,Sub_metering_2, col="red", type="l"))
with(data, points(Time,Sub_metering_3, col="blue", type="l"))
legend("topright",pch = "-", seg.len = 5, col=c("blue","red","black"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,"Plot3.png", width=480, height=480)
dev.off()