# Read in columns as character 
mydata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses="character")
mydata[,1] <- as.Date(mydata[,1],format="%d/%m/%Y") 

# get relevant range of data
mysubset<- subset(mydata,(Date>='2007-02-01') & (Date<='2007-02-02'))

# convert relevant columns to numeric
for (i in 3:9) {
	mysubset[,i] <- as.numeric(mysubset[,i])	
}

# create time stamp column from Date and Time columns
timestamp <- format(as.POSIXlt(paste(mysubset$Date,mysubset$Time)),"%d/%m/%Y %H:%M:%S")
timestamp <- as.POSIXlt(timestamp, format="%d/%m/%Y %H:%M:%S")
mysubset <- cbind(mysubset,timestamp)

png(filename="plot2.png", width=480, height=480, units="px", pointsize=12)
plot(mysubset$timestamp,mysubset$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

