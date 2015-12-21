# Create working directory and change to it
dir<-"C:/Courses/JohnHopkins/ExploratoryDataAnalysis/Week3/project"
if (!file.exists(dir)){
   dir.create(paste(dir,"/data",sep=""),recursive=TRUE)
   }

setwd(dir)
#
# Download datafile (in zip format) and extract the file
#
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
		 destfile = "exdata-data-NEI_data.zip")
unzip("exdata-data-NEI_data.zip",exdir=".")

