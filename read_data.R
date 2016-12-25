library(data.table)
library(lubridate)

setwd("C:\\Users\\user\\Dropbox\\Coursera\\ExData_Plotting1")

if (!file.exists('source_data')) {
    dir.create('source_data')
}

if (!file.exists('source_data\\power_consumption.txt')) {
    
    url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    download.file(url,destfile='source_data\\power_consumption.zip')
    unzip('source_data/power_consumption.zip',exdir='source_data',overwrite=TRUE)
    
    variable.class<-c(rep('character',2),rep('numeric',7))
    power.consumption<-read.table('source_data/household_power_consumption.txt',header=TRUE,
                                  sep=';',na.strings='?',colClasses=variable.class)
    power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',]
    
    cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
            'SubMetering1','SubMetering2','SubMetering3')
    colnames(power.consumption)<-cols
    power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time)
    power.consumption<-power.consumption[,c(10,3:9)]
    
    write.table(power.consumption,file='source_data/power_consumption.txt',sep='|',row.names=FALSE)
} else {
    
    power.consumption<-read.table('source_data/power_consumption.txt',header=TRUE,sep='|')
    power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime)
}

if (file.exists('source_data/household_power_consumption.txt')) {
    x<-file.remove('source_data/household_power_consumption.txt')
}