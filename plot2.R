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
#require(dplyr)
#nei<-readRDS("summarySCC_PM25.rds")
#scc<-readRDS("Source_Classification_Code.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot
# answering this question.
# ---------------------------------------------------------------------------------

#Separate the data by year, only considering Baltimore City, MD
data1999bc<-filter(nei,year==1999, fips=="24510")
data2002bc<-filter(nei,year==2002, fips=="24510")
data2005bc<-filter(nei,year==2005, fips=="24510")
data2008bc<-filter(nei,year==2008, fips=="24510")

#Calculate the mean for each year
meansbc<-vector()
meansbc[1]<-mean(data1999bc$Emissions)
meansbc[2]<-mean(data2002bc$Emissions)
meansbc[3]<-mean(data2005bc$Emissions)
meansbc[4]<-mean(data2008bc$Emissions)

years<-c("1999","2002","2005","2008")

#Create the plot in a png file
png("plot2.png", width=480, height=480, units="px")

barplot(meansbc, names.arg=years, 
        col=rainbow(4, s = 1, v = 1, start = .21, end = .43, alpha = 1))

title(main="Baltimore City Mean PM2.5 Emissions (Tons)", xlab="Year", 
      ylab="Mean PM2.5 Emissions (Tons)")

dev.off()