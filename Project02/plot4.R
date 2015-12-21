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
sccFile <- paste(dirPath,"/Source_Classification_Code.rds",sep="")
scc <- data.table(readRDS(sccFile ))
###
####################
## Question
#
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999–2008?
#
# Get SCC code for coal combustion from SCC table
#
coalSCC<-scc[grep(("fuel comb.*coal"),EI.Sector,ignore.case=T),.(SCC)]
#
# Set key in NEI on SCC
setkey(nei,SCC)
#
# Join nei and coalSCC and get the related emissions
#
coalNEI<-nei[coalSCC,.(SCC,Emissions,year)]
#
# Aggregate over year
#
annualTotal<-coalNEI[,sum(Emissions),by="year"]
#
# set up the plot 
#
g<-ggplot(annualTotal,aes(year,V1))

#
# Plot bar charts to see the level of emission changes over year
#
png("plot4.png", height=480, width=680)  # Save graph to PNG file
#
g+geom_bar(stat="identity",width=0.75)+
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    labs(title="Emissions from coal combustion") +
    theme(plot.title = element_text( face="bold", colour="blue", size=14,hjust=0.5))
#
# Add other details
#
grid.text(unit(0.1,"npc"),0.95,label = "PLOT-4",gp=gpar(fontsize=9,font=2,col="black"))
grid.text(unit(0.9,"npc"),0.95,label = today(),gp=gpar(fontsize=9,font=2,col="black"))
##
# Save the displayed graph to a file of PNG type
dev.off()
#
############
