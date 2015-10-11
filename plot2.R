# to read the data from table
dfElecPowCon<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE)

dfElecPowFeb<-dfElecPowCon[strptime(as.character(dfElecPowCon$Date),"%d/%m/%Y")  %in% c('2007-02-01', '2007-02-02'),]

#Open the .png file
png(filename="plot2.png",width=480,height=480)
#plotting global active power against time.
plot(strptime(as.character(paste(dfElecPowFeb$Date,dfElecPowFeb$Time)),"%d/%m/%Y %H:%M:%S"),as.numeric(as.character(dfElecPowFeb$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
