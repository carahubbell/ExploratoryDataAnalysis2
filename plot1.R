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
#require(dplyr)
#nei<-readRDS("summarySCC_PM25.rds")
#scc<-readRDS("Source_Classification_Code.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.
# ---------------------------------------------------------------------------------

#Separate the data by year
data1999<-filter(nei,year==1999)
data2002<-filter(nei,year==2002)
data2005<-filter(nei,year==2005)
data2008<-filter(nei,year==2008)

#Calculate the mean for each year
means<-vector()
means[1]<-mean(data1999$Emissions)
means[2]<-mean(data2002$Emissions)
means[3]<-mean(data2005$Emissions)
means[4]<-mean(data2008$Emissions)

years<-c("1999","2002","2005","2008")

#Create the plot in a png file
png("plot1.png", width=480, height=480, units="px")

barplot(means, names.arg=years, 
        col=rainbow(4, s = 1, v = 1, start = .5, end = .7, alpha = 1))

title(main="U.S. Mean PM2.5 Emissions by Year (Tons)", xlab="Year", 
      ylab="Mean PM2.5 Emissions (Tons)")

dev.off()