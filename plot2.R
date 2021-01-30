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

png("plot2.png", width=480, height=480)


plot(df$Global_active_power ~ df$DateTime, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

dev.off()