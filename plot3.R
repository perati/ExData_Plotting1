
# Plot 3. Energy Sub Metering / Time

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
png('plot3.png', width = 480, height = 480)

#create empty plot with type 'n' / replace x and y label
#add Sub Metering 1, 2, and 3 line points in the plot with different color
#add a legend with the respective plot data
with(subdata,{
       plot(Time, Sub_metering_1, type = 'n', xlab = '', ylab = 'Energy sub metering')
       points(Time, Sub_metering_1, type = 'l')
       points(Time, Sub_metering_2, type = 'l', col = 'red')
       points(Time, Sub_metering_3, type = 'l', col = 'blue')
       legend('topright', col = c('black','red','blue'), lty = c(1,1,1),
              legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
})

#close devic
dev.off()

#the file is created in working directory