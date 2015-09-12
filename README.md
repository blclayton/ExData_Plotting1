## Introduction 

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

When loading the dataset into R, the following should be considered:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. The following 
plots were used in this analysis, all of which were constructed
using the base plotting system.


In this repository: 

* 4 plots constructed to spec and saved to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* R code file (`plot1.R`, `plot2.R`, etc.) that constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. The code file includes code for reading the data and so that the plot can be fully reproduced. 
Each R file includes the code that creates the PNG file.





Static images of the four plots constructed as well as the goal and questions
from the analysis are shown below. 

### Plot 1 - Histogram of Global Active Power usage

Goal: examine use of household energy for two days in Feb 2007 to understand the Global active power usage.  
Questions:
* Which kilowatt level is most frequent?  

* Which kilowatt level is the next most frequent?

* How frequent is the use of kilowatt level above 4?

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 


### Plot 2 - Global Active Power over date/time

Goal: examine use of household energy for two days in Feb 2007 with a focus on usage of the global active power over date/time.

Questions:

* How often does global active power usage spike over 6kw in a day?

* Is global active power usage similiar over the 2 days?

* How often is global active power under 2kw in a day?

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 


### Plot 3 - Sub metering 1,2,3 over date/time

Goal: examine use of household energy for two days in Feb 2007 with focus on the sub metering.  

Questions:

* Which of the 3 types of household components has the highest usage over a day?

* Is the usage of the 3 types of household components similar over both days?

* Which of the 3 types has the most variability?  Which has the least?

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 


### Plot 4 - Global Active Power, Voltage, Sub Metering 1,2,3 and Global Reactive Power over date/time
Goal: examine use of household energy for two days in Feb 2007 with focus usage of global active power, voltage, sub metering and
global reactive power.  Active power is power that does work and is voltage  times current measured in watts. Our measures should show 
a relationship between active power and voltage. Reactive power does not provide useful work, but it is essential for AC transmission
and distribution systems, motors, and many other types of customer loads. Measures should show that HH items with motors consume use 
more reactive power.

Questions:

* Do all the measures show a similar usage pattern over a day?

* Does active power usage correlate with voltage useage?

* Does reactive power usage match usage for a specific sub metering type?

* What is the relationship of voltage to reactive power use in a day?


![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 
