df <- read.table("household_power_consumption.txt", header = T,sep = ";", na.strings = "?")
head(df)
class(df$Date)
df$Date <- as.Date(df$Date, format = '%d/%m/%Y')
df$Date
beginning <- as.Date("2007-02-01", format = '%Y-%m-%d')
ending <- as.Date("2007-02-02", format = '%Y-%m-%d')
df <- subset(df, subset = (Date >= beginning & Date <= ending))
names(df)

hist(df$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()