df <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
head(df)
class(df$Date)
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df$Date
beginning <- as.Date("2007-02-01", format = '%Y-%m-%d')
ending <- as.Date("2007-02-02", format = '%Y-%m-%d')
df <- subset(df, subset = (Date >= beginning & Date <= ending))
names(df)
df$Time
class(df$Time)
DateTime <- paste0(df$Date,df$Time)
class(DateTime)
df$DateTime <- as.POSIXct(DateTime)

with(df, {
    plot(Sub_metering_1 ~ DateTime, type = "l",
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DateTime, col = 'Red')
    lines(Sub_metering_3 ~ DateTime, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()