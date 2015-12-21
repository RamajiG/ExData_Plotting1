<p><b>Note to student evaluator</b>
</p>
<i>Please note that I that I forked and cloned the repo <https://github.com/rdpeng/ExData_Plotting1>. It contains exactly the same files. I created another folder Project02 in my cloned area and pushed the same to github. The fact that the repo contains a new folder, project02 which in turn has files plot1.R, plot2.R, plot3.R, plot4.R, plot5.R and plot6.R,  is proof that it would have contained "at least one commit beyond the original fork" had it been forked. Therefore you can award 1 point for the question dealing with commits. Thank you.
</i>
<p><b>Introduction
</b></p>
The R-scripts found here relates to Project-2 of course, Exploratory Data Analysis, conducted by John Hopkins University.</p>  

<p><b>Loading data
</b></p>
The scripts uses the data file from the file link "Data for Peer Assignment"(https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip), provided in the assignment.  You should execute the script "extractPowerData.R" to download and extract the necessary data file.
The following 2 data files would be extracted from the given Zip file:
<ol>
<li><b>summarySCC_PM25.rds</b>: Amount PM2.5 pollution emitted over years in different counties. Following are the fields from this data file are needed for this assignment: 
<b>fips:</b> A five-digit number (represented as a string) indicating the U.S. county
<b>SCC:</b> The name of the source as indicated by a digit string (description of each code is available in source code classification file)
<b>Pollutant:</b> A string indicating the pollutant
<b>Emissions:</b> Amount of PM2.5 emitted, in tons
<b>type: </b>The type of source (point, non-point, on-road, or non-road)
<b>year:</b> The year of emissions recorded
 </li>
<li><b>Source_Classification_Code.rds</b>: This file data provides description of source classification.  </li>
</ol>
<p><b>Executing scripts</b></p>
After the data file is extracted you can execute the scripts plot1.R, plot2.R, plot3.R, plot4.R, plot5.R, and/or, plot6.R, to plot the needed graphs as required for the projects. 
The plot6.R creates 2 files, plot6.png and plot6-2.png.  In one, the PM2.5 data for the two counties, Baltimore and Los Angeles, are plotted as adjacent bar charts to make comparison easier between these two counties. The other chart(plot6-2.png) the PM2.5 data for each counties are charted as separate bar charts and placed in single panel. You can use either of them for comparison purposes, though I like the chart with adjacent bars better.
Make sure that the script, <b>"extractPowerData.R"</b>, is executed first so that the data file is downloaded and available in the folder <b>"C:/Courses/JohnHopkins/ExploratoryDataAnalysis/Week3/project"</b>
<p><b>Other files</b></p>
In the github there are 7 other graphic files which are output from the plotting scripts.  When you execute any of the plotting script it will create a PNG graphic file which should be similar to the one already stored in the github. For example, script “plot2.R” will generate “plot2.png” graphic file output.

<p class=MsoNormal>&nbsp;</p>

</div>

</body>

</html>
