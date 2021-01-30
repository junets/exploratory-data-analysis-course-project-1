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


par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(df, {
    plot(Global_active_power ~ DateTime, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    plot(Voltage ~ DateTime, type = "l", 
         ylab = "Voltage (volt)", xlab = "")
    plot(Sub_metering_1 ~ DateTime, type = "l", 
         ylab = "Global Active Power (kilowatts)", xlab = "")
    lines(Sub_metering_2 ~ DateTime,col = 'Red')
    lines(Sub_metering_3 ~ DateTime,col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ DateTime, type = "l", 
         ylab = "Global Rective Power (kilowatts)",xlab = "")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()