# Set my working directory
setwd("F:/Andras_work/Courses/Coursera/2013-14/B_SP-DS_05-05_ExploratoryDataAnalysis/Assignment1")
# Read the names in first since next only certain lines will be read (not heathers)
names <- read.table("household_power_consumption.txt",header=T,nrows=1,sep=";")
# Read the required data
data <- read.table("household_power_consumption.txt",skip=66637,nrows=2880,sep=";",na.strings = "?")
# Set the names to data frame just read
names(data) <- names(names)
# Convert time with the proper date into a Time object
data$Time <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
# Not need but let's convert the date to into a Date object
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Plot 1
# Assure that the right plot layout is set (needed for repeated calls of the assignment scripts)
par(mfrow = c(1,1))

# Display the histogram of the global active power with the required parameters
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , ylab = "Frequency", col="red")

# Export into a 480x480 png file
dev.copy(png,"Plot1.png", width=480, height=480)
dev.off()