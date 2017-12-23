library(datasets)

# reading csv data
householdPC.data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#Converting date and filtering for two days
householdPC.data["Date"] <- as.Date(a[["Date"]], "%d/%m/%Y")
householdPC.data.Filtered <- householdPC.data[householdPC.data[["Date"]] == "2007-02-01" | householdPC.data[["Date"]] == "2007-02-02", ]
householdPC.data.Filtered$Global_active_power <- as.numeric(householdPC.data.Filtered$Global_active_power)
householdPC.data.Filtered$Voltage <- as.numeric(householdPC.data.Filtered$Voltage)
householdPC.data.Filtered$Global_reactive_power <- as.numeric(householdPC.data.Filtered$Global_reactive_power)

datetime <- strptime(paste(householdPC.data.Filtered$Date, householdPC.data.Filtered$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
sub.meter.1 <- as.numeric(householdPC.data.Filtered$Sub_metering_1)
sub.meter.2 <- as.numeric(householdPC.data.Filtered$Sub_metering_2)
sub.meter.3 <- as.numeric(householdPC.data.Filtered$Sub_metering_3)

#plotting graph
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
with(householdPC.data.Filtered,{
     plot(datetime, householdPC.data.Filtered$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
     plot(datetime, householdPC.data.Filtered$Voltage, type="l",xlab="datetime",ylab="Voltage")
     plot(datetime,  householdPC.data.Filtered$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
     with(householdPC.data.Filtered,lines(datetime,sub.meter.1))
     with(householdPC.data.Filtered,lines(datetime,sub.meter.2,col="red"))
     with(householdPC.data.Filtered,lines(datetime,sub.meter.3,col="blue"))
     legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     plot(datetime, householdPC.data.Filtered$Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
