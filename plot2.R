##      Exploratory Data Analysis Course Project 1
##      
##      Goal: examine use of household energy for two days in Feb 2007
##      External files used: 
##       - GitHub repository: https://github.com/rdpeng/ExData_Plotting1
##       - UC Irvine Machine Learning Repository: 
##         “Individual household electric power consumption Data Set” 
##      Descriptions of the 9 variables in the file 
##       - Date: Date in format dd/mm/yyyy
##       - Time: time in format hh:mm:ss
##       - Global_active_power: HH global minute-averaged active power (kw)
##       - Global_reactive_power: HHglobal minute-averaged reactive power (kw)
##       - Voltage: minute-averaged voltage (in volt)
##       - Global_intensity: HH global minute-averaged current intensity (amps)
##       - Sub_metering_1: kitchen with dishwasher, oven, microwave (active watt-hr) 
##       - Sub_metering_2: laundry room with washer, drier, firdge, light (active watt-hr)
##       - Sub_metering_3: electric water heater, air cond (active watt-hr)
##
##      The script does the following
##      1 - loads data taking into account
##              - the size of data requires ~150 MB memory
##              - we will only use data from 2007-02-01 and 2007-02-02.
##              - use colclasses to speed the read time
##              - header is true, sep is ;, comment.char="";
##              - missing values are coded at ? so change to NA
##      2 - create Date/Time variable with lubridate
##      2 - Make plot using the base plotting system and saves to PNG
##          file 480x480 (plot1.png, plot2.png, etc.)
##  
##      Setting up work environment
        library(dplyr)
        library(readr)
        library(sqldf)
        library(lattice)
        library(ggplot2)
        library(lubridate)

##      Reading data in for 1/2/2007 and 2/2/2007

        febdata <- read.csv.sql("household_power_consumption.txt", 
                        sql = "select * from file
                        where date = '2/2/2007' or date = '1/2/2007' ",
                        header = TRUE, 
                        sep = ';')
##      Create timedate field
        febdata$mix <- paste(febdata$Date, febdata$Time)
        febdata$mix <- parse_date_time(febdata$mix, 'dmY HMS')
##      Setting ? to 'NA'. Visial inspection shows we have none in file for selected days
        febdata$Global_active_power[febdata$Global_active_power == "?"] <- NA
        febdata$Global_reactive_power[febdata$Global_reactive_power == "?"] <- NA
        febdata$Global_intensity[febdata$Global_intensity == "?"] <- NA
        febdata$Voltage[febdata$Voltage == "?"] <- NA
        febdata$Sub_metering_1[febdata$Sub_metering_1 == "?"] <- NA 
        febdata$Sub_metering_2[febdata$Sub_metering_2 == "?"] <- NA
        febdata$Sub_metering_3[febdata$Sub_metering_3 == "?"] <- NA

##      Create Line plot to png file
     
        png(file = "plot2.png", height = 480, width = 480, units = "px")
        with(febdata, plot(mix,Global_active_power, type = "l", 
                           xlab = " ",
                           ylab = "Global Active Power (kilowatts)"))
        dev.off()
