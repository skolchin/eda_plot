#
# Coursera Explanatory Data Analysis week 1 assignment
# Plot 2. Global active power by date/time
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
png(filename = "plot2.png", width = 480, height = 480)

# Make a plot
with(
  dd,
  plot(DateTime, Global_active_power, 
       xlab = "",
       ylab = "Global active power (kilowatts)",
       type = "l"
       )
)

# Close a file
dev.off()
