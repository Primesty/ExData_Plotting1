

### Exploratory Data Analysis - Project 1 - Plot 1

# Read in the data - household_power_consumption.txt

energy_data_full <- read.table(file.choose(), header = TRUE, sep = ";", na.strings = "?")

head(energy_data_full)
str(energy_data_full)

# Subset the data by date

energy_data_full$Date <- as.Date(energy_data_full$Date, format = "%d/%m/%Y")

energy_data <- subset(energy_data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Plot 1 (histogram)

hist(energy_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")


## Save plot1 to file

png("plot1.png", width=480, height=480)
hist(energy_data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()