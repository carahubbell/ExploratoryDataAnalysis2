## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 4 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot2. Note that you must have the data files in your working
## directory first!

# Read the data into R.
require(dplyr)
nei<-readRDS("summarySCC_PM25.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot
# answering this question.
# ---------------------------------------------------------------------------------

#Take only data from Baltimore City
data<-filter(nei, fips=="24510")

#Calculate the mean of Emissions by year
x<-tapply(data$Emissions, data$year, mean)


#Create the plot in a png file
png("plot2.png", width=480, height=480, units="px")

barplot(x, col=rainbow(4, s = 1, v = 1, start = .21, end = .43, alpha = 1))

title(main="Baltimore City Mean PM2.5 Emissions (Tons)", xlab="Year", 
      ylab="Mean PM2.5 Emissions (Tons)")

dev.off()