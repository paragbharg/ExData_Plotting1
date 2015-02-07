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


# Create and save the plot
opts = "l"
png(file = "plot3.png", width = 480, height = 480)
plot(ndata$dateTime, ndata$Sub_metering_1, type="n", main="", col = "black", xlab = "",
     ylab = "Energy sub metering"  ) 
lines(ndata$dateTime, ndata$Sub_metering_1, type=opts, col = "black") 
lines(ndata$dateTime, ndata$Sub_metering_2, type=opts, col = "red") 
lines(ndata$dateTime, ndata$Sub_metering_3, type=opts, col = "blue") 
legend("topright", pch = NA, col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), lwd = 1) 

dev.off()
