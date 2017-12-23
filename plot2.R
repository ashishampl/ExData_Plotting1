library(datasets)

# reading csv data
householdPC.data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

#Converting date and filtering for two days
householdPC.data["Date"] <- as.Date(a[["Date"]], "%d/%m/%Y")
householdPC.data.Filtered <- householdPC.data[householdPC.data[["Date"]] == "2007-02-01" | householdPC.data[["Date"]] == "2007-02-02", ]
householdPC.data.Filtered$Global_active_power <- as.numeric(householdPC.data.Filtered$Global_active_power)
datetime <- strptime(paste(householdPC.data.Filtered$Date, householdPC.data.Filtered$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

#plotting graph
png("plot2.png", width=480, height=480)
plot(datetime, householdPC.data.Filtered$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
