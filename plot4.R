# Read the file
data <- read.delim("./household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE)

# ONly select for specific date
ndata<- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# or I could have also used the follwing code
# data$Date <- as.Date(data$Date, "%d/%m/%Y")
# ndata<- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")), ]

# remove all NA 
ndata <- ndata[complete.cases(data),]

#create datetime and date
ndata$dateTime <- strptime(paste(ndata$Date, ndata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Create and save the plot
opts = "l"
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(ndata$dateTime, ndata$Global_active_power, type="n", main="", col = "black", xlab = "",
     ylab = "Global Active Power"  ) 
lines(ndata$dateTime, ndata$Global_active_power, type=opts, col = "black") 

plot(ndata$dateTime, ndata$Voltage, type="n", main="", col = "black", xlab = "datetime",
     ylab = "Voltage"  ) 
lines(ndata$dateTime, ndata$Voltage, type=opts, col = "black") 

plot(ndata$dateTime, ndata$Sub_metering_1, type="n", main="", col = "black", xlab = "",
     ylab = "Energy sub metering"  ) 
lines(ndata$dateTime, ndata$Sub_metering_1, type=opts, col = "black") 
lines(ndata$dateTime, ndata$Sub_metering_2, type=opts, col = "red") 
lines(ndata$dateTime, ndata$Sub_metering_3, type=opts, col = "blue") 
legend("topright", pch = NA, lty = c(1,1,1), lwd = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty =  "n") 

plot(ndata$dateTime, ndata$Global_reactive_power, type="n", main="", col = "black", 
     xlab = "datetime", ylab = "Global_reactive_power" ) 
lines(ndata$dateTime, ndata$Global_reactive_power, type=opts, col = "black") 
dev.off()