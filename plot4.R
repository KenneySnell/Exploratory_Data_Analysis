# read Electric Power Consumption
# 4 plots 2 X 2

#We will only be using data from the dates 2007-02-01 and 2007-02-02.
#One alternative is to read the data from just those dates rather than reading in the entire dataset and 
# subsetting to those dates.

library(dplyr)

setwd("C:\\Users\\app1kms\\Documents\\Training\\2017\\DataScience_Downloads\\Exploratory_Data_Analysis")
hpower <- read.csv2(file="household_power_consumption.txt", sep=";",header=TRUE,dec = ".",stringsAsFactors=FALSE  )
# place in a table
    hpower <- tbl_df(hpower)



#filter dates

hpower <- filter(hpower, hpower$Date == "2/2/2007" | hpower$Date == "1/2/2007")


# remove any

hpower$Global_active_power <- sub(",",".",hpower$Global_active_power)
# Change to numeric
hpower$Global_active_power <- as.numeric(hpower$Global_active_power)



# Change the time



x_date_time <- paste(hpower$Date, hpower$Time)
hpower$Date_Time <- strptime(x_date_time, "%d/%m/%Y %H:%M:%S")

hpower$Time <-   strptime(hpower$Time, "%H:%M:%S")


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


# chnage 2 rooms to numeric

# remove any ","
hpower$Sub_metering_1 <- sub(",",".",hpower$Sub_metering_1)
# Change to numeric
hpower$Sub_metering_1 <- as.numeric(hpower$Sub_metering_1)


# remove any ","
hpower$Sub_metering_2 <- sub(",",".",hpower$Sub_metering_2)
# Change to numeric
hpower$Sub_metering_2 <- as.numeric(hpower$Sub_metering_2)



# Rename  3 rooms

hpower <- rename(hpower, Kitchen = Sub_metering_1,
                  Laundry_room = Sub_metering_2, Water_heater_AC = Sub_metering_3)




# set up 2 X 2 for the plots

par(mfrow = c(2,2))
plot(hpower$Date_Time, hpower$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

plot(hpower$Date_Time, hpower$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(hpower$Date_Time, hpower$Kitchen, type = "l", ylab = "Energy sub metering", xlab = "")
points(hpower$Date_Time, hpower$Laundry_room, type = "l", col = "red")
points(hpower$Date_Time, hpower$Water_heater_AC, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), lwd = c(2,2,2), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.75)

plot(hpower$Date_Time, hpower$Global_reactive_power,
     type = "l", ylab = "Global reactive power", xlab = "datetime")



#create PNG file

dev.copy(png,file = "plot4.png" )


