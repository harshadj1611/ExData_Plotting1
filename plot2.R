##Reading data (household power consumption)
data <- read.table("M:/Harshad R/R/R Cousera Courses/R Course_4_Exploratory Analysis/Week_1/Assignment Week_1/household_power_consumption.txt",skip=1,sep=";")
colnames(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


##Subsetting and changing the class of variables

library(lubridate)
data$Date <- dmy(data$Date)

daterange1 <- subset(data, Date == "2007-2-1")
daterange2 <- subset(data, Date == "2007-2-2")

final <- rbind(daterange1, daterange2)


final$Time <- strptime(final$Time, format="%H:%M:%S")
final[1:1440,"Time"] <- format(final[1:1440,"Time"],"2007-02-01 %H:%M:%S")
final[1441:2880,"Time"] <- format(final[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

final$Global_active_power <- as.numeric(final$Global_active_power)

##Plotting
png("plot2.png", width=480, height=480)

with(final, plot(Time, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
