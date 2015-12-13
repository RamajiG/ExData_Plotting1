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

# ========================================================
# PLOT-4
# SUB-PLOT - Global_active_Power

# Set number of plots
par(mfrow=c(2,2))

# Create Line Chart

# get the range for the x and y axis 
xrange <- range(pwrDat$DateTime) 
yrange <- range(pwrDat$Global_active_power) 

# set up the plot 
plot(xrange, yrange, type="n",xlab="", ylab="Global active power" ) 

# add lines 
lines(pwrDat$DateTime, pwrDat$Global_active_power, type="l", lwd=1.5,lty=1, col="black", pch=18) 
#==========================================================================
# PLOT-4
# SUB-PLOT - Voltage

# Create Line Chart

# get the range for the x and y axis 
xrange <- range(pwrDat$DateTime) 
yrange <- range(pwrDat$Voltage) 

# set up the plot 
plot(xrange, yrange, type="n", xlab="datetime",ylab="Voltage" ) 

# add lines 
lines(pwrDat$DateTime, pwrDat$Voltage, type="l", lwd=1.5,lty=1, col="black", pch=18) 

#==========================================================================
# PLOT-4
# SUB-PLOT - Energy Sub Metering

# get the range for the x and y axis 
xrange <- range(pwrDat$DateTime) 
yrange <- yrange <- range(pwrDat$Sub_metering_1,pwrDat$Sub_metering_2,pwrDat$Sub_metering_3,na.rm=TRUE) 

# set up the plot 
plot(xrange, yrange, type="n",xlab="",ylab="Energy Sub Metering" ) 

# add lines 
lines(pwrDat$DateTime, pwrDat$Sub_metering_1, type="l", lwd=1.5,lty=1, col="black", pch=18) 
lines(pwrDat$DateTime, pwrDat$Sub_metering_2, type="l", lwd=1.5,lty=1, col="red", pch=18) 
lines(pwrDat$DateTime, pwrDat$Sub_metering_3, type="l", lwd=1.5,lty=1, col="blue", pch=18) 

# add a legend 
legend("topright", pch = -1, col = c("black","blue", "red"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lty=1,lwd=1.5,seg.len=1,text.font=1,yjust=0,cex=0.75,bg="white",bty="n")
#===========================================================================
# PLOT-4
# SUB-PLOT - Global_reactive_Power

# Create Line Chart

# get the range for the x and y axis 
xrange <- range(pwrDat$DateTime) 
yrange <- range(pwrDat$Global_reactive_power) 

# set up the plot 
plot(xrange, yrange, type="n", xlab="datetime",ylab="Global_reactive_power" ) 

# add lines 
lines(pwrDat$DateTime, pwrDat$Global_reactive_power, type="l", lwd=1.5,lty=1, col="black", pch=18) 
#==========================================================================

# Add page title
par(adj=0); title("PLOT-4",outer=TRUE,line=-2);par(adj=0.5)
#==========================================================================
# Reset plotting space
par(mfrow=c(1,1))

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot4.png")
dev.off()
