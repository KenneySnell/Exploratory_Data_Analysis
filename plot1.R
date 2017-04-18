# read Electric Power Consumption
# Red Histogram

library(dplyr)

setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Exploratory_Data_Analysis")
hpower <- read.csv2(file="household_power_consumption.txt", sep=";",header=TRUE,dec = ".",stringsAsFactors=FALSE  )
# place in a table
hpower <- tbl_df(hpower)


#filter dates

hpower <- filter(hpower, hpower$Date == "2/2/2007" | hpower$Date == "1/2/2007")




# remove any ","
hpower$Global_active_power <- sub(",",".",hpower$Global_active_power)
# Change to numeric
hpower$Global_active_power <- as.numeric(hpower$Global_active_power)



# Change the time

hpower$Time <-   strptime(hpower$Time, "%H:%M:%S")

x_date_time <- paste(hpower$Date, hpower$Time)
hpower$Date_Time <- strptime(x_date_time, "%d/%m/%Y %H:%M:%S")




# Change the date

hpower$Date <-as.Date(hpower$Date, "%d/%m/%y")




# remove any ","
hpower$Global_reactive_power <- sub(",",".",hpower$Global_reactive_power)
# Change to numeric
hpower$Global_reactive_power <- as.numeric(hpower$Global_reactive_power)




# remove any ","
hpower$Voltage <- sub(",",".",hpower$Voltage)
# Change to numeric
hpower$Voltage <- as.numeric(hpower$Voltage)





# remove any ","
hpower$Global_intensity <- sub(",",".",hpower$Global_intensity)
# Change to numeric
hpower$Global_intensity <- as.numeric(hpower$Global_intensity)


hist(hpower$Global_active_power,main ="Global Active Power", xlab = "Global Active Power(kilowats)",col="red",xlim = c(0,6) )


#create PNG file

dev.copy(png,file = "plot1.png" )



