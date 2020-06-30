setwd("C:/Users/dongj/Desktop/R_data_Desk/Exploratory_Data_Analysis")

#Note that in this dataset missing values are coded as ?.
data <- read.table("./exdata_data_household_power_consumption/household_power_consumption.txt",header=T, sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
data <- subset(data, subset=(Date == "2007-02-01" | Date == "2007-02-02"))

#You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#
#Plot4
png("plot4.png", width=480, height=480)
#plot
par(mfrow=c(2,2))
with(data, {
  #plot1
  plot(Global_active_power~Datetime, type="l", 
       xlab="", ylab="Global Active Power")
  #plot2
  plot(Voltage~Datetime, type="l", 
       xlab="datetime", ylab="Voltage ")
  #plot3
  plot(Sub_metering_1~Datetime, type="l", 
       xlab="", ylab="Global Active Power ")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright"
         , col=c("black","red","blue")
         , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
         ,lty=c(1,1), lwd=c(1,1), bty = "n")
  #plot4
  plot(Global_reactive_power~Datetime, type="l", 
       xlab="datetime", ylab="Global_reactive_power")
})

dev.off()