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
##
neiFile <- paste(dirPath,"/summarySCC_PM25.rds",sep="")
##
NEI <- data.table(readRDS(neiFile ))
#
###
####################
## Question
#
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
#   variable, which of these four sources have seen decreases in emissions from 
#   1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
#   Use the ggplot2 plotting system to make a plot answer this question.
#
# Set number of plots
plot.new()

#
# Get baltimore data
#
baltimore<-nei[(fips=="24510"),]

#
# set up the plot 
#
g<-ggplot(baltimore,aes(fill=type,x=factor(year),y=Emissions))

#
# The facets are over 'type' and plot a line, instead of points, to see the trend visually
#
png("plot3.png", height=480, width=680)  # Save graph to PNG file

g+geom_bar(stat="identity")+facet_grid(.~type) +
   labs(title="Compare changes in Emission Type\n (Baltimore)") +
   xlab("year")+ylab(expression("total PM"[2.5]*" emissions")) +
   theme(plot.title = element_text( face="bold", colour="blue", size=14,hjust=0.5))
#
# Add other details
#
grid.text(unit(0.1,"npc"),0.95,label = "PLOT-3",gp=gpar(fontsize=9,font=2,col="black"))
grid.text(unit(0.9,"npc"),0.95,label = today(),gp=gpar(fontsize=9,font=2,col="black"))
#
# Save the displayed graph to a file of PNG type
dev.off()
#
############
