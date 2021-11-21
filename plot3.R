Data_Source <- "./household_power_consumption.txt"
The_Data <- read.table(Data_Source, header = TRUE, sep = ";",  stringsAsFactors = FALSE, dec = ".")

The_Data$Date <-as.Date(The_Data$Date, format = "%d/%m/%Y")
Sub_Data <- subset(The_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


Sub_Metering_1 <- Sub_Data$Sub_metering_1
Sub_Metering_2 <- Sub_Data$Sub_metering_2
Sub_Metering_3 <- Sub_Data$Sub_metering_3


TIME <- as.POSIXct(paste(Sub_Data$Date ,Sub_Data$Time))

with(Sub_Data,{
        plot(TIME,Sub_Metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
        lines(TIME, Sub_Metering_2, col="Red")
        lines(TIME, Sub_Metering_3, col="Blue")
              })

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()


