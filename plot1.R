setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis")

#Histogram For Global Active Power
#Note that in this dataset missing values are coded as ?.
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=T, sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#plot1.png
png("plot1.png", width=480, height=480)

#plot
with(data,{
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
})
dev.off()