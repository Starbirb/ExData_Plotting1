if (!file.exists('plots')) {
    dir.create('plots')
}
source('read_data.R')

png(filename='plots/plot2.png',width=480,height=480,units='px')

plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power (kilowatts)', type='l')

x<-dev.off()