# to read the data from table
dfElecPowCon<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE)

dfElecPowFeb<-dfElecPowCon[strptime(as.character(dfElecPowCon$Date),"%d/%m/%Y")  %in% c('2007-02-01', '2007-02-02'),]

#Open the file
png(filename="plot3.png",width=480,height=480)
# Plotting sub metering 1
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="")
# adding sub metering 2 line to the existing plot
lines(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_2)),type="l",col="Red")
# adding sub metering 3 line to the existing plot
lines(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Sub_metering_3)),type="l",col="Blue")
# to add the legends
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , lty=1, col=c('black', 'Red', 'Blue'))
dev.off()
