if (!file.exists('plots')) {
    dir.create('plots')
}

source('read_data.R')

png(filename='plots/plot3.png',width=480,height=480,units='px')

color<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=color[1],xlab='',ylab='Energy sub metering')
lines(power.consumption$DateTime,power.consumption$SubMetering2,col=color[2])
lines(power.consumption$DateTime,power.consumption$SubMetering3,col=color[3])
legend('topright',legend=lbls,col=color,lty='solid')

x<-dev.off()