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

# Plotting function, called twice once to plot to the screen once to plot to png
myplot <- function(data)
{
	# Assure that the right plot layout is set
	par(mfrow = c(2,2))	
	# Display the 4 plots
	with(data, {
	     plot(Time,Global_active_power, ylab = "Global Active Power", xlab="", type="l")
	     plot(Time,Voltage, ylab = "Voltage", xlab="datetime", type="l")
	     plot(Time,Sub_metering_1, col="blue", xlab="", ylab="Energy sub metering", type="l")
	     with(data, points(Time,Sub_metering_2, col="red", type="l"))
	     with(data, points(Time,Sub_metering_3, col="black", type="l"))
	     # Add legend to the 3rd plot
	     legend("topright",border = "", lty = 1, seg.len = 3, bty = "n", col=c("blue","red","black"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))     
	     plot(Time,Global_reactive_power, ylab = "Global Reactive Power", xlab="datetime", type="l")
	})
}

# Plot 4
# dev.copy function has problems so let's plot twice
# Plot on the screen
myplot(data)

# Plot into png
png(file = "Plot4.png", width=480, height=480)
myplot(data)
dev.off()
