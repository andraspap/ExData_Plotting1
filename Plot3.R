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
	# Plot 3
	# Assure that the right plot layout is set (needed for repeated calls of the assignment scripts)
	par(mfrow = c(1,1))
	
	# Plot the three sub metering data set versus time in the same plot
	with(data, plot(Time,Sub_metering_1, xlab = "", ylab = "Energy sub metering", col="black", type="l"))
	with(data, points(Time,Sub_metering_2, col="red", type="l"))
	with(data, points(Time,Sub_metering_3, col="blue", type="l"))
	# Add legend with the required parameters
	legend("topright",lty = 1, seg.len = 2, xjust = 20, col=c("blue","red","black"),
	       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
}

# dev.copy function has problems so let's plot twice
# Plot on the screen
myplot(data)

# Plot into png
png(file = "Plot3.png", width=480, height=480)
myplot(data)
dev.off()


