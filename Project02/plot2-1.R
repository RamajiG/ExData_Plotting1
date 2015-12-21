library(plyr)
library(dplyr)
library(quantmod)
library(lubridate)
library(ggplot2)
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
annualTotal<-nei[,mean(Emissions),by="year"]
annualTotalBM<-nei[(fips=="24510"),mean(Emissions),by="year"]
#
# Order them by year
#
annualTotal<-annualTotal[order(year),]
annualTotalBM<-annualTotalBM[order(year),]

#
# get the range for the x and y axis 
xrange <- range(annualTotal$year) 
yrange <- range(annualTotal$V1,na.rm=TRUE) 
yrangeBM <- range(annualTotalBM$V1,na.rm=TRUE) 

yrange[1]<-min(yrange[1],yrangeBM[1])
yrange[2]<-max(yrange[2],yrangeBM[2])

# set up the plot 
plot(xrange, yrange, type="n",xlab="year",ylab=expression("Avg PM"[2.5]*" emissions") ) 

# add lines 
lines(annualTotal$year,annualTotal$V1, type="l", lwd=2.5,lty=1, col="black", pch=18) 
lines(annualTotalBM$year,annualTotalBM$V1, type="l", lwd=5,lty=1, col="green", pch=18) 

# Add page title
par(adj=0,cex=0.5); title("PLOT-2");
par(adj=0.5,cex=0.75,col.main="blue"); title(expression("Average PM"[2.5]*" emissions from all sources"));
par(adj=1,cex=0.5,col.main="black");title(today());

# Add legend
legend("right",legend=c("Country","Baltimore"),col=c("black","green"),
	, pch = 1:2,lty = 1, merge = TRUE,title="Legend")
############

# Save the displayed graph to a file of PNG type
dev.copy(png,"plot2-1.png")
dev.off()

############
