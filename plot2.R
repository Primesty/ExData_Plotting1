

### Exploratory Data Analysis - Project 1 - Plot 2

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

## Plot 2 (lineplot)

plot(energy_data$Global_active_power~energy_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")


## Save plot2 to file

png("plot2.png", width=480, height=480)
plot(energy_data$Global_active_power~energy_data$Date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()