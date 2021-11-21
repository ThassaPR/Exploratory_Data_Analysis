Data_Source <- "./household_power_consumption.txt"
The_Data <- read.table(Data_Source, header = TRUE, sep = ";",  stringsAsFactors = FALSE, dec = ".")

The_Data$Date <-as.Date(The_Data$Date, format = "%d/%m/%Y")
Sub_Data <- subset(The_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

GAP <- as.numeric(Sub_Data$Global_active_power)

TIME <- as.POSIXct(paste(Sub_Data$Date ,Sub_Data$Time))


plot(TIME,GAP,xlab = "",ylab = "Global Active Power(kilowatts)",type = "l")


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


