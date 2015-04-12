### Plot 3

## Put the household_power_consumption.txt file in your working directory

## Reading the data
new <- read.table("household_power_consumption.txt", header=T, sep=";", colClasses=c("character", "character", 
      "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings="?")

## Subsetting to requiered dates
sub <- subset(new, new$Date == "1/2/2007" | new$Date == "2/2/2007")

## Creating variable Date.time 
sub$Date.time <- with(sub, paste(sub[,1], sub[,2]))

## Changing variable Date.time from class "character" to class "POSIXlt"
sub$Date.time <- strptime(sub[,10], "%d/%m/%Y %H:%M:%S")

## Removing NA values if any from "sub" and renaming the final data set to "data"
data <- na.omit(sub)

## Changing locally the language to english
Sys.setlocale("LC_ALL","C")

## Open png device, creating "plot3.png" file in the working directory and close png device
png(file = "plot3.png") 
with(data, {
      plot(Date.time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
      lines(Date.time, Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col="red")
      lines(Date.time, Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col="blue")
})
legend("topright", lwd=1.5 , col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
