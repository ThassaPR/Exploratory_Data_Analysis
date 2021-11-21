Data_Source <- "./household_power_consumption.txt"
The_Data <- read.table(Data_Source, header = TRUE, sep = ";",  stringsAsFactors = FALSE, dec = ".")

The_Data$Date <-as.Date(The_Data$Date, format = "%d/%m/%Y")
Sub_Data <- subset(The_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


GAP <- as.numeric(Sub_Data$Global_active_power)
#GAP means Global_active_power


hist(GAP, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")


dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()





