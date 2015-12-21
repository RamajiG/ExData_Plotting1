library(lubridate)
library(ggplot2)
library(grid)
library(gridExtra)
library(data.table)
#
# Execute extractData.R to download needed file
#
dirPath<-"C:/Downloads/Courses/JohnHopkins/ExploratoryDataAnalysis/Week3/Project"
if (!file.exists(dirPath)){
    stop(paste("Folder",dirPath,"not accessible. Job aborted"))
}

setwd(dirPath)
#
# Read necessary data into table
#
neiFile <- paste(dirPath,"/summarySCC_PM25.rds",sep="")
##
nei <- data.table(readRDS(neiFile ))
#
####################
## Question
#
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
#
# Get emission data for Baltimore(FIPS=24510) with source of type=ON-ROAD
#
plot.new()
#

neiBaltimore<-nei[(fips=="24510" & type=="ON-ROAD"),.(year,Emissions)]
#
# Aggregate over year
#
annualTotal<-neiBaltimore[,sum(Emissions),by="year"]
#
# set up the plot 
#
g<-ggplot(annualTotal,aes(year,V1))

#
# Plot bar charts to see the level of emission changes over year
#
png("plot5.png", height=480, width=680)  # Save graph to PNG file
#
g+geom_bar(stat="identity",width=0.75)+
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    labs(title="Emissions from ON-ROAD sources\n(Baltimore)") +
    theme(plot.title = element_text( face="bold", colour="blue", size=14,hjust=0.5))
#
# Add other details
#
grid.text(unit(0.1,"npc"),0.95,label = "PLOT-5",gp=gpar(fontsize=9,font=2,col="black"))
grid.text(unit(0.9,"npc"),0.95,label = today(),gp=gpar(fontsize=9,font=2,col="black"))
##
# Save the displayed graph to a file of PNG type
dev.off()
#
############
