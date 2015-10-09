
# Plot 2. Global Active Power / Time

#read data stored in working directory
data<-read.table('household_power_consumption.txt', 
                 header = TRUE, sep=";",
                 na.strings="?",
                 col.names = c("Date", "Time", "Global_active_power",
                               "Global_reactive_power", "Voltage", "Global_intensity",
                               "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 colClasses = c( "character", "character", "numeric",
                                 "numeric", "numeric", "numeric", "numeric",
                                 "numeric", "numeric"))

#convert Date and Time variables to date and time classes
data$Time <- strptime(paste(data$Date,data$Time), '%d/%m/%Y %H:%M:%S')
data$Date <- as.Date(data$Date, '%d/%m/%Y')

#subset data to include the spesific dates only 
subdata<-subset(data, Date == '2007-02-01' | Date == '2007-02-02')


#open png device
png('plot2.png', width = 480, height = 480)

#create plot / use line type / add x and y labels
with(subdata,{
       plot(Time, Global_active_power, type = 'l', 
            xlab = '',ylab = 'Global Active Power (kilowatts)')
})

#close device
dev.off()

#the file is created in working directory
