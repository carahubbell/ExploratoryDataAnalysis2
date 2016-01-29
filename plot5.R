## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 4 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot5. Note that you must have the data files in your working
## directory first!

# Read the data into R.
require(dplyr)
#nei<-readRDS("summarySCC_PM25.rds")
#scc<-readRDS("Source_Classification_Code.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore 
# City?
# ---------------------------------------------------------------------------------

#Only consider Baltimore City, MD
baltimore<-filter(nei, fips=="24510")

#Consider all motor vehicle sources in Baltimore City
vehicle <- grepl("vehicle", scc$SCC.Level.Two, ignore.case=TRUE)
vehiclescc <- scc[vehicle,]$SCC
vehiclebc <- baltimore[baltimore$SCC %in% vehiclescc,]

#Calculate the total for each year
sumvbc<-vector()
sumvbc[1]<-sum(vehiclebc$Emissions[vehiclebc$year==1999])
sumvbc[2]<-sum(vehiclebc$Emissions[vehiclebc$year==2002])
sumvbc[3]<-sum(vehiclebc$Emissions[vehiclebc$year==2005])
sumvbc[4]<-sum(vehiclebc$Emissions[vehiclebc$year==2008])

years<-c("1999","2002","2005","2008")

#Create the plot in a png file
png("plot5.png", width=480, height=480, units="px")

barplot(sumvbc, names.arg=years, 
        col=rainbow(4, s = 1, v = 1, start = .98, end = .08, alpha = 1))

title(main="Baltimore City Total PM2.5 Emissions from Vehicles (Tons)", xlab="Year", 
      ylab="Total Vehicle PM2.5 Emissions (Tons)")

dev.off()