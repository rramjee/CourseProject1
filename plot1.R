# to read the data from table
dfElecPowCon<-read.table("./data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=TRUE)

# to subset the data to select data only for the required date range
dfElecPowFeb<-dfElecPowCon[strptime(as.character(dfElecPowCon$Date),"%d/%m/%Y")  %in% c('2007-02-01', '2007-02-02'),]

# to create the graph
png(filename="plot1.png",width=480,height=480)
hist(as.numeric(as.character(dfElecPowFeb$Global_active_power)),main = "Global Active Power",freq=TRUE,col="Red",xlab="Global Active Power (kilowatts)")
dev.off()
