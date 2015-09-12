##      Exploratory Data Analysis Course Project 1 - Plot 4
##      
##      Goal: examine use of household energy for two days in Feb 2007 with
##      focus usage of global active power, voltage, sub metering and
##      global reactive power
##      Questions:
##      Do all the measures show a similar usage pattern over a day?
##      Does active power usage correlate with voltage useage?
##      Do reactive power increase correlate to a specific sub metering type?
##      What is the relationship of voltage to reactive power use in a day?
##
##      External files used: 
##       - GitHub repository: https://github.com/rdpeng/ExData_Plotting1
##       - UC Irvine Machine Learning Repository: 
##         “Individual household electric power consumption Data Set” 
##          Dataset: Electric power consumption [20Mb]
##
##      Descriptions of the 9 variables in the 
##       - Date: Date in format dd/mm/yyyy
##       - Time: time in format hh:mm:ss
##       - Global_active_power: HH global minute-averaged active power (kw)
##              - direct current (DC) power that does work
##       - Global_reactive_power: HH global minute-averaged reactive power (kw)
##              - essential for AC transmission and distribution systems,
##                motors, and many other types of customer loads
##       - Voltage: minute-averaged voltage (in volt)
##       - Global_intensity: HH global minute-averaged current intensity (amps)
##       - Sub_metering_1: kitchen with dishwasher, oven, microwave (active watt-hr) 
##       - Sub_metering_2: laundry room with washer, drier, firdge, light (active watt-hr)
##       - Sub_metering_3: electric water heater, air cond (active watt-hr)
##
##      The script does the following
##      1 - uses read.csv.sql to load data for Feb 1, 2007 and Feb 2, 2007
##              - the size of data requires ~150 MB memory
##              - header is true, sep is ;
##      2 - creates variable of date and time using lubridate
##      3 - changes missing values coded as "?" to NA
##      4 - Makes 4 different charts using the base plotting system
##               - line graph plot of Global Active Power over datetime  
##               - line graph plot of Voltage over datetime  
##               - line chart of the 3 Sub metering variables over datetime  
##               - line graph plot of Global Active Power over datetime  
##      5 - Plots to device: PNG file 480x480 named plot3.png
##      
##      
##      
##      Setting up work environment
        library(dplyr)
        library(readr)
        library(sqldf)
        library(lubridate)

##      Reading data in for 1/2/2007 and 2/2/2007

        febdata <- read.csv.sql("household_power_consumption.txt", 
                        sql = "select * from file
                        where date = '2/2/2007' or date = '1/2/2007' ",
                        header = TRUE, 
                        sep = ';')
##      Converting date and time to correct classs
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


##Create Line plot to png file

        png(file = "plot4.png", height = 480, width = 480, units = "px")
        
        
        par(mfrow = c( 2, 2))
        
        with(febdata, plot(mix,Global_active_power, type = "l", 
                           xlab = " ",
                           ylab = "Global Active Power"))
        with(febdata, plot(mix,Voltage, type = "l", 
                           xlab = "datetime ",
                           ylab = "Voltage"))
        
        plot (febdata$mix, febdata$Sub_metering_1, 
              xlab =" " ,
              ylab = "Energy sub metering", 
              type = "n"
        )
        lines(febdata$mix,febdata$Sub_metering_1)
        lines(febdata$mix,febdata$Sub_metering_2, col="red")
        lines(febdata$mix,febdata$Sub_metering_3, col="blue")
        legend("topright", 
               lty = 1, 
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               col = c("black", "red", "blue"))
        
        with(febdata, plot(mix,Global_reactive_power, type = "l", 
                           xlab = "datetime ",
                           ylab = "Global_reactive_power"))
        dev.off()

