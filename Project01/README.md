<html>

<p class=MsoNormal><b><span style='font-size:12.0pt;line-height:107%'>Introduction</span></b></p>

<p class=MsoNormal>The R-scripts found here relates to Project-1 of course, <b>Exploratory
Data Analysis</b>, conducted by John Hopkins University.  </p>

<p class=MsoNormal><b><span style='font-size:12.0pt;line-height:107%'>Loading
data</span></b></p>

<p class=MsoNormal>The scripts uses the data file from the file link <b>“Electric
power consumption</b>”, provided in the assignment.  You should execute the
script <b>“extractPowerData.R”</b> to download and extract the necessary data file.</p>

<p class=MsoNormal style='margin-left:18.75pt;text-indent:-.25in;line-height:
15.75pt;background:white'><span style='color:#333333'>The following
descriptions of the 9 variables in the dataset are taken from the&nbsp;given<span
class=apple-converted-space>&nbsp;</span></span></span><span style='color:black'><span
style='orphans: auto;text-align:start;widows: 1;-webkit-text-stroke-width: 0px;
word-spacing:0px'>assigment</span><span style='color:#333333'>:</span></span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>1.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Date</span></b><span style='color:#333333'>: Date in
format&nbsp;dd/mm/yyyy</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>2.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Time</span></b><span style='color:#333333'>: time in
format&nbsp;hh:mm:ss</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>3.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Global_active_power</span></b><span style='color:#333333'>:
household global minute-averaged active power (in kilowatt)</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>4.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Global_reactive_power</span></b><span style='color:#333333'>:
household global minute-averaged reactive power (in kilowatt)</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>5.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Voltage</span></b><span style='color:#333333'>:
minute-averaged voltage (in volt)</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>6.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Global_intensity</span></b><span style='color:#333333'>:
household global minute-averaged current intensity (in ampere)</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>7.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Sub_metering_1</span></b><span style='color:#333333'>:
energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to
the kitchen, containing mainly a dishwasher, an oven and a microwave (hot
plates are not electric but gas powered).</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>8.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Sub_metering_2</span></b><span style='color:#333333'>:
energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to
the laundry room, containing a washing-machine, a tumble-drier, a refrigerator
and a light.</span></p>

<p class=MsoNormal style='margin-top:0in;margin-right:0in;margin-bottom:6.0pt;
margin-left:18.7pt;text-indent:-.25in;line-height:normal;background:white'><span
style='color:#333333'>9.</span><span style='font-size:7.0pt;font-family:"Times New Roman",serif;
color:#333333'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><b><span
style='color:#333333'>Sub_metering_3</span></b><span style='color:#333333'>:
energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an
electric water-heater and an air-conditioner.</span></p>

<p class=MsoNormal><b><span style='font-size:14.0pt;line-height:107%'>Executing
scripts</span></b></p>

<p class=MsoNormal>After the data file is extracted you can execute the scripts
<b>plot1.R, plot2.R, plot3.R, and, plot4.R</b>, to plot the needed graphs as
required for the projects. </p>

<p class=MsoNormal>Make sure that the script, “<b>extractPowerData.R”,</b> is
executed first so that the data file is downloaded and available in the folder <b>&quot;C:/Courses/JohnHopkins/ExploratoryDataAnalysis/Week1/project&quot;</b></p>

<p class=MsoNormal><b><span style='font-size:14.0pt;line-height:107%'>Other files</span></b></p>

<p class=MsoNormal>In the github there are 4 other graphic files which are
output from the plotting scripts.  When you execute any of the plotting script
it will create a PNG graphic file which should be similar to the one already
stored in the github. For example, script “plot2.R” will generate “plot2.png”
graphic file output.</p>

</html>
