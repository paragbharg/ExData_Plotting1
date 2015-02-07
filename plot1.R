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
png(file = "plot1.png", width = 480, height = 480)
hist(ndata$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main = paste("Global Active Power"))
dev.off()