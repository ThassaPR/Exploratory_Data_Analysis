Data_Source <- "./household_power_consumption.txt"
The_Data <- read.table(Data_Source, header = TRUE, sep = ";",  stringsAsFactors = FALSE, dec = ".")

The_Data$Date <-as.Date(The_Data$Date, format = "%d/%m/%Y")

Sub_Data <- subset(The_Data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Sub_Data$Date <-as.Date(Sub_Data$Date,"%d/%m/%Y")



#the data for plotting
GAP <- as.numeric(Sub_Data$Global_active_power)
TIME <- as.POSIXlt(paste(Sub_Data$Date ,Sub_Data$Time))
VOLTAGE<-Sub_Data$Voltage
Sub_Metering_1 <- Sub_Data$Sub_metering_1
Sub_Metering_2 <- Sub_Data$Sub_metering_2
Sub_Metering_3 <- Sub_Data$Sub_metering_3
GRP <- as.numeric(Sub_Data$Global_reactive_power)

hist(GAP, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(Sub_Data,{
        #plot 1
        hist(GAP, main="Global Active Power", 
             xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
        #plot 2
        plot(TIME,VOLTAGE,xlab = "datetime",ylab = "Voltage",type = "l")
        
        #plot 3

        plot(TIME,Sub_Metering_1,xlab = "",ylab = "Energy sub metering",type = "l")
        lines(TIME, Sub_Metering_2, col="Red")
        lines(TIME, Sub_Metering_3, col="Blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
                legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        #Plot 4
        plot(TIME,GRP, type ="l",ylab="Global_Rective_Power",xlab="datetime")
        
        
        })


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
