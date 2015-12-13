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
pwrDat$DateTime<-as.POSIXct(paste(pwrDat$Date, pwrDat$Time), format="%d/%m/%Y %H:%M:%S"
# ========================================================
# PLOT-1

# Set number of plots
par(mfrow=c(1,1))

# Create histogram
hist(pwrDat$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Power Activity",col="Red",freq=TRUE)

# Add page title
par(adj=0); title("PLOT-1");par(adj=0.5)

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot1.png")
dev.off()

