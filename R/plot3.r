#
# Coursera Explanatory Data Analysis week 1 assignment
# Plot 3. Energy by date time divided by sub metering
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

# Make a plot and save it to a PNG file
png(filename = "figure/plot3.png", width = 480, height = 480)
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
dev.off()
