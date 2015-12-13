library(plyr)
library(dplyr)
library(quantmod)
library(lubridate)
library(sqldf)
#
# Execute extractData.R to download needed file
#
dir<-"C:/Courses/JohnHopkins/ExploratoryDataAnalysis/Week1/project"
if (!file.exists(dir)){
      stop(paste("Folder",dir,"not accessible. Job aborted"))
   }

setwd(dir)

pwrConsFile <- paste(dir,"/household_power_consumption.txt",sep="")

# Read the Power Data for 1st and 2nd of Feb,2007
pwrDat <- read.csv.sql(pwrConsFile, sql = "select * from file WHERE Date in ('1/2/2007','2/2/2007')", header = TRUE, sep = ";")

# Create date & Time column
pwrDat$DateTime<-as.POSIXct(paste(pwrDat$Date, pwrDat$Time), format="%d/%m/%Y %H:%M:%S")

#==========================================================
# PLOT-2

# Create Line Chart

# Set number of plots
par(mfrow=c(1,1))

# get the range for the x and y axis 
xrange <- range(pwrDat$DateTime) 
yrange <- range(pwrDat$Global_active_power) 

# set up the plot 
plot(xrange, yrange, type="n", xlab="Days",ylab="Global Active Power (kilowatts)" ) 

# add lines 
lines(pwrDat$DateTime, pwrDat$Global_active_power, type="l", lwd=1.5,lty=1, col="black", pch=18) 

# Add page title
par(adj=0); title("PLOT-2");par(adj=0.5)

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot2.png")
dev.off()

