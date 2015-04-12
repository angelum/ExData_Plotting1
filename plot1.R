### Plot 1

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

## Open png device, creating "plot1.png" file in the working directory and close png device
png(file = "plot1.png") 
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
