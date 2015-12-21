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
###
####################
## Question
#
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#   vehicle sources in Los Angeles County, California (fips == "06037"). Which city has
#   seen greater changes over time in motor vehicle emissions?
#
####################
#
plot.new()
#
# Get emission data for Baltimore(FIPS=24510) and LA (FIPS=06037) with source of type=ON-ROAD
#
neiBM<-nei[(fips=="24510" & type=="ON-ROAD"),.(year,Emissions)][,county:="BM"]
neiLA<-nei[(fips=="06037" & type=="ON-ROAD"),.(year,Emissions)][,county:="LA"]
#
# Bind
#
dt<-rbind(neiBM,neiLA)
#
# Aggregate
#
annualTotal<-dt[,sum(Emissions),by=c("year","county")]
#
# Reset County labels
#
annualTotal$county <- factor(annualTotal$county, levels=c("BM", "LA"), labels=c("Baltimore", "Los Angeles"))
#
# set up the plot 
#
g<-ggplot(annualTotal,aes(x=year,fill=county))
#
# Plot bar charts to see the level of emission changes over year
#
png("plot6.png", height=480, width=680)  # Save graph to PNG file
#
g+geom_bar(stat="identity",ymin=0,aes(y=V1,ymax=V1),width=1.5,position="dodge")+
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    labs(title="Emissions from ON-ROAD sources\n(Baltimore & Los Angles)") +
    theme(plot.title = element_text( face="bold", colour="blue", size=14,hjust=0.5))
#
# Add other details
#
grid.text(unit(0.1,"npc"),0.95,label = "PLOT-6",gp=gpar(fontsize=9,font=2,col="black"))
grid.text(unit(0.9,"npc"),0.95,label = today(),gp=gpar(fontsize=9,font=2,col="black"))
##
# Save the displayed graph to a file of PNG type
dev.off()
#
############
#
# The following provides a grid of 2 charts one for each county
# The y-axis scales are changed depending on the range of annual emission values in each county
#
# set up the plot 
#
g<-ggplot(annualTotal,aes(x=factor(year),fill=county))+facet_grid(county~.,scales="free_y")

#
# Plot bar charts to see the level of emission changes over year
#
png("plot6-2.png", height=480, width=680)  # Save graph to PNG file
#
g+geom_bar(stat="identity",ymin=0,aes(y=V1,ymax=V1),width=0.75,position="dodge")+
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions")) +
    labs(title="Emissions from ON-ROAD sources\n(Baltimore & Los Angles)") +
    theme(plot.title = element_text( face="bold", colour="blue", size=14,hjust=0.5))
#
# Add other details
#
grid.text(unit(0.1,"npc"),0.95,label = "PLOT-6-2",gp=gpar(fontsize=9,font=2,col="black"))
grid.text(unit(0.9,"npc"),0.95,label = today(),gp=gpar(fontsize=9,font=2,col="black"))
##
# Save the displayed graph to a file of PNG type
dev.off()
#