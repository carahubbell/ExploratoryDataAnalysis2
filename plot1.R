## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 4 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot1. Note that you must have the data files in your working
## directory first!

# Read the data into R.
require(dplyr)
nei<-readRDS("summarySCC_PM25.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.
# ---------------------------------------------------------------------------------

#Calculate means of Emissions by year
x<-tapply(nei$Emissions, nei$year, mean)

#Create the plot in a png file
png("plot1efficient.png", width=480, height=480, units="px")

barplot(x, col=rainbow(4, s = 1, v = 1, start = .5, end = .7, alpha = 1))

title(main="U.S. Mean PM2.5 Emissions by Year (Tons)", xlab="Year", 
      ylab="Mean PM2.5 Emissions (Tons)")

dev.off()