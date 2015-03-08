# Read in columns as character 
mydata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", colClasses="character")
mydata[,1] <- as.Date(mydata[,1],format="%d/%m/%Y") 

# get relevant range of data
mysubset<- subset(mydata,(Date>='2007-02-01') & (Date<='2007-02-02'))

# convert relevant columns to numeric
for (i in 3:9) {
	mysubset[,i] <- as.numeric(mysubset[,i])	
}

png(filename="plot1.png", width=480, height=480, units="px", pointsize=12)
hist(mysubset$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power")
dev.off()