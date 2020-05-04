df <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE, na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"),]
df <- df[complete.cases(df),]
df$DateTime <- as.POSIXct(paste(df$Date,df$Time))
with(df, { plot(Sub_metering_1 ~ DateTime, type = "l", xlab = "", ylab = "Energy sub metering") 
  lines(Sub_metering_2 ~ DateTime, col = 'Red')
  lines(Sub_metering_3 ~ DateTime, col = 'Blue')})
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = c(1,1,1))
dev.copy(png,"plot3.png", width = 480, height = 480)
dev.off()