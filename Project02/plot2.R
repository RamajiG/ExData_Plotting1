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
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999
#   to 2008? Use the base plotting system to make a plot answering this question.
####################
#
# Set number of plots
plot.new()
par(mfrow=c(1,1),adj=0.5,cex=1,col.main="black")

# Aggregate over year
# 
annualTotalBM<-nei[(fips=="24510"),sum(Emissions),by="year"]
#
# Order them by year
#
annualTotalBM<-annualTotalBM[order(year),]

#
# get the range for the x and y axis 
xrangeBM <- range(annualTotalBM$year) 
yrangeBM <- range(annualTotalBM$V1,na.rm=TRUE) 

# set up the plot 
par(adj=0.5,cex=0.75,mar=c(5,5,4,2))

plot(xrangeBM, yrangeBM, type="n",xlab="year",ylab=expression("Total PM"[2.5]*" emissions") ) 

# add lines 
lines(annualTotalBM$year,annualTotalBM$V1, type="l", lwd=5,lty=1, col="green", pch=18) 

# Add page title
par(adj=0,cex=0.5); title("PLOT-2");
par(adj=0.5,cex=0.60,col.main="blue"); title(expression("Total PM"[2.5]*" emissions from all sources in Baltimore"));
par(adj=1,cex=0.5,col.main="black");title(today());

############

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot2.png")
dev.off()

############
