df <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df <- df[complete.cases(df),]
df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
with(df, plot(Global_active_power ~ DateTime, ylab = "Global Active Power (kilowatts)", xlab = "", type = "l", frame.plot = TRUE))
dev.copy(png,"plot2.png", width = 480, height = 480)
dev.off()