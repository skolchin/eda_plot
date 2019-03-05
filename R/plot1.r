#
# Coursera Explanatory Data Analysis week 1 assignment
# Plot 1. Global active power vs Frequence histogramm
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

# Make a histogram and save it to a PNG file
png(filename = "figure/plot1.png", width = 480, height = 480)
with(
  subset(rdata, Date >= "2007/02/01" & Date <= "2007/02/02"),
  hist(Global_active_power, 
       xlab = "Global active power (kilowatts)",
       main = "Global Active Power",
       col = "red"
       )
)
dev.off()
