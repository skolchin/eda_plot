#
# Coursera Explanatory Data Analysis week 1 assignment
# Plot 4. Global Active Power by date time, Voltage by date time
#         Energy by date time by sum metering, Global reactive power by date time
#         All plots on one page
#
library(readr)

# Load the dataset
rdata <- read_delim(
  "data/household_power_consumption.zip", 
  delim = ";",
  col_types = cols(
    col_date(format = "%d/%m/%Y"),
    col_time(format = "%H:%M:%S"),
    col_double(), 
    col_double(),
    col_double(),
    col_double(),
    col_double(),
    col_double(),
    col_double()
  ),
  na = c("", "NA", "?")
  )

# Subset the data and add date/time column
dd <- subset(rdata, Date >= "2007/02/01" & Date <= "2007/02/02")
dd$DateTime <- as.POSIXct(
  paste(dd$Date, dd$Time),
  format = "%Y-%m-%d %H:%M:%S"
)

# Open up a PNG file
png(filename = "plot4.png", width = 480, height = 480)

# Set up plot parameters
par(mfrow = c(2,2))

# 1st plot (Global active pover by date/time)
with(
  dd,
  plot(DateTime, Global_active_power, 
       xlab = "",
       ylab = "Global active power (kilowatts)",
       type = "l"
  )
)

# 2nd plot (Voltage by date/time)
with(
  dd,
  plot(DateTime, Voltage, 
       xlab = "datetime",
       ylab = "Voltage",
       type = "l"
  )
)

# 3rd plot (Energy by date/time by sub-metering)
with(
  dd,
  plot(DateTime, Sub_metering_1, 
       xlab = "",
       ylab = "Energy sub metering",
       type = "l",
       col = "dark gray"
       )
)
with(
  dd,
  points(DateTime, Sub_metering_2, 
       type = "l",
       col = "red"
  )
)
with(
  dd,
  points(DateTime, Sub_metering_3, 
       type = "l",
       col = "blue"
  )
)
legend("topright",
       lty = 1,
       col = c("dark gray", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th plot (Global reactive power by date/time)
with(
  dd,
  plot(DateTime, Global_reactive_power, 
       xlab = "datetime",
       ylab = "Global reactive power (kilowatts)",
       type = "l"
  )
)

# Close the device
dev.off()
