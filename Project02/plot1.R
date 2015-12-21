library(plyr)
library(dplyr)
library(quantmod)
library(lubridate)
library(data.table)
#
# Execute extractData.R to download needed file
#
dirPath<-"C:/Downloads/Courses/JohnHopkins/ExploratoryDataAnalysis/Week3/Project"
if (!file.exists(dirPath)){
    stop(paste("Folder",dirPath,"not accessible. Job aborted"))
}

setwd(dirPath)

neiFile <- paste(dirPath,"/summarySCC_PM25.rds",sep="")
##
nei <- data.table(readRDS(neiFile ))
##
####################
## Question
#
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
#   Using the base plotting system, make a plot showing the total PM2.5 emission from
#   all sources for each of the years 1999, 2002, 2005, and 2008.
####################
#
# Set number of plots
par(mfrow=c(1,1),adj=0.5,cex=1,col.main="black")

# Aggregate over year
# 
annualTotal<-nei[,sum(Emissions),by="year"]
#
# get the range for the x and y axis 
xrange <- range(annualTotal$year) 
yrange <- range(annualTotal$V1,na.rm=TRUE) 
yrange[1]<-0

# set up the plot 
plot(xrange, yrange, type="n",xlab="year",ylab=expression("total PM"[2.5]*" emissions") ) 

# add lines 
lines(annualTotal$year,annualTotal$V1, type="l", lwd=5,lty=1, col="black", pch=18) 

# Add page title
par(adj=0,cex=0.5); title("PLOT-1");
par(adj=0.5,cex=0.75,col.main="blue"); title(expression("Total PM"[2.5]*" emissions from all sources"));
par(adj=1,cex=0.5,col.main="black");title(today());

############

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot1.png")
dev.off()

############
