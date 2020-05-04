df <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df <- df[complete.cases(df),]
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()