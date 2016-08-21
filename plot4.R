

### Exploratory Data Analysis - Project 1 - Plot 4

# Read in the data - household_power_consumption.txt

energy_data_full <- read.table(file.choose(), header = TRUE, sep = ";", na.strings = "?")

head(energy_data_full)
str(energy_data_full)

# Subset the data by date

energy_data_full$Date <- as.Date(energy_data_full$Date, format = "%d/%m/%Y")

energy_data <- subset(energy_data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## and convert dates to POSIXct

Date_time <- paste(as.Date(energy_data$Date), energy_data$Time)

energy_data$Date_time <- as.POSIXct(Date_time)

head(energy_data)

## Plot 4 (lineplot) with submetering

par(mfrow = c(2,2),  mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(energy_data$Global_active_power~energy_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(energy_data$Voltage~energy_data$Date_time, ylab = "Voltage", xlab = "datetime", type = "l")

with(energy_data, {
  plot(Sub_metering_1~Date_time, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(energy_data$Global_reactive_power~energy_data$Date_time, ylab = "Global_reactive_power", xlab = "datetime",
     type = "l")

## Save plot4 to file

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2),  mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

plot(energy_data$Global_active_power~energy_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

plot(energy_data$Voltage~energy_data$Date_time, ylab = "Voltage", xlab = "datetime", type = "l")

with(energy_data, {
  plot(Sub_metering_1~Date_time, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Date_time,col='Red')
  lines(Sub_metering_3~Date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(energy_data$Global_reactive_power~energy_data$Date_time, ylab = "Global_reactive_power", xlab = "datetime",
     type = "l")
dev.off()