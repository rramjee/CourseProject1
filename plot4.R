# to read the data from table
dfElecPowCon<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE)

dfElecPowFeb<-dfElecPowCon[strptime(as.character(dfElecPowCon$Date),"%d/%m/%Y")  %in% c('2007-02-01', '2007-02-02'),]

#setting up 2 rows and 2 columns
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

# plotting all 4 graphs in 2 rows and 2 columns
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Voltage)),type="l",ylab="Voltage",xlab="datetime")
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
lines(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_2)),type="l",col="Red")
lines(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_3)),type="l",col="Blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'Red', 'Blue'))
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()