##generate a linegraph

#declare strings
dataURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
datafilename = "data.zip"
gap_txt="Global Active Power"


#retrive zip file and unzip to working directory
download.file(dataURL, datafilename, "internal", quiet=TRUE)
unzip(datafilename)

#use the package chron to combine date & time
library(chron)

#read datafile, create datetime and produce subset
fulldata <- read.table("household_power_consumption.txt", header = TRUE, colClasses=c(rep("character",2),rep("numeric", 7)),sep = ";",na.strings=c("?"))
fulldata[,2] = chron(dates= fulldata[,1],times= fulldata[,2], format=c('d/m/Y','h:m:s'))
fulldata[,1] = as.Date(fulldata[,1],format='%d/%m/%Y')
names(fulldata)[names(fulldata) == 'Time'] <- 'datetime'
projdata <- subset(fulldata, Date >= as.Date("01/02/2007", "%d/%m/%Y") &  Date <= as.Date("02/02/2007", "%d/%m/%Y"),2:9)
field_names <- names(projdata)


#open png file as graphics device
png("plot2.png", width=480, height=480)

#generate plot
plot( projdata$Global_active_power ~ projdata$datetime, type="n", ylab=gap_txt, xlab="", xaxt="n")
lines(projdata$datetime, projdata$Global_active_power)
axis.Date(1,at=seq(projdata$datetime[1],max(projdata$datetime)+1, by= "day"), format("%d"))

#close device
dev.off()


#cleanup
rm(list=ls())
