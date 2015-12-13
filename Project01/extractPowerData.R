# Create working directory and change to it
dir<-"C:/Courses/JohnHopkins/ExploratoryDataAnalysis/Week1/project"
if (!file.exists(dir)){
   dir.create(paste(dir,"/data",sep=""),recursive=TRUE)
   }

setwd(dir)
#
# Download datafile (in zip format) and extract the file
#
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
		 destfile = "exdata-data-household_power_consumption.zip")
unzip("exdata-data-household_power_consumption.zip",exdir=".")

