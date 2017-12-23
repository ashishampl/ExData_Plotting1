library(datasets)
householdPC.data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
householdPC.data["Date"] <- as.Date(a[["Date"]], "%d/%m/%Y")
householdPC.data.Filtered <- householdPC.data[householdPC.data[["Date"]] == "2007-02-01" | householdPC.data[["Date"]] == "2007-02-02", ]
householdPC.data.Filtered <- as.numeric(householdPC.data.Filtered$Global_active_power)
png("plot1.png", width=480, height=480)
hist(householdPC.data.Filtered, col="Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main="Global Active Power")
dev.off()