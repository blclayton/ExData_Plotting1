##      Exploratory Data Analysis Course Project 1 - Plot 1
##      
##      Goal and questions: examine use of household energy for two days 
##      in Feb 2007 to understand the Global active power usage.  
##      Which kilowatt level is most frequent?  
##      Which kilowatt level is the next most frequent?
##      How frequent is the use of kilowatt level above 4?
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
##       - Global_reactive_power: HHglobal minute-averaged reactive power (kw)
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
##      3 - change missing values coded as "?" to NA
##      4 - Makes hitogram of Global Active Power using the base plotting system
##      5 - Plots to device: PNG file 480x480 named plot1.png
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
##      Creating datetime variable for use in charts. 
##      keep Date and Time as char to allow paste and then use 
##      lubridate fuction 'parse_date_time' to create variable
        febdata$mix <- paste(febdata$Date, febdata$Time)
        febdata$mix <- parse_date_time(febdata$mix, 'dmY HMS')
##      Setting ? to 'NA' 
        febdata$Global_active_power[febdata$Global_active_power == "?"] <- NA
        febdata$Global_reactive_power[febdata$Global_reactive_power == "?"] <- NA
        febdata$Global_intensity[febdata$Global_intensity == "?"] <- NA
        febdata$Voltage[febdata$Voltage == "?"] <- NA
        febdata$Sub_metering_1[febdata$Sub_metering_1 == "?"] <- NA 
        febdata$Sub_metering_2[febdata$Sub_metering_2 == "?"] <- NA
        febdata$Sub_metering_3[febdata$Sub_metering_3 == "?"] <- NA

##      Create histogram of Global Active Power plot to png file
        png(file = "plot1.png", height = 480, width = 480, units = "px")
        hist(febdata$Global_active_power, 
             col = "red", 
             breaks = 12, 
             main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
             ylab = "Frequency"
        
        
        dev.off()
