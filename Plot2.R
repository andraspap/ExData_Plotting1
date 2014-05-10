setwd("F:/Andras_work/Courses/Coursera/2013-14/B_SP-DS_05-05_ExploratoryDataAnalysis/Assignment1")
names <- read.table("household_power_consumption.txt",header=T,nrows=1,sep=";")
data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings = "?")
names(data) <- names(names)
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Plot 2
par(mfrow = c(1,1))
plot(data$Time,data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

dev.copy(png,"Plot2.png", width=480, height=480)
dev.off()