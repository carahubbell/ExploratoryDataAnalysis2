## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 4 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot6. Note that you must have the data files in your working
## directory first!

# Read the data into R.
require(dplyr)
require(RColorBrewer)
#nei<-readRDS("summarySCC_PM25.rds")
#scc<-readRDS("Source_Classification_Code.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == 06037). 
# Which city has seen greater changes over time in motor vehicle emissions?
# ---------------------------------------------------------------------------------

#Consider Baltimore City, MD and Los Angeles, CA
baltimore<-filter(nei, fips=="24510")
losangeles<-filter(nei, fips=="06037")

#Consider all motor vehicle sources only
vehicle <- grepl("vehicle", scc$SCC.Level.Two, ignore.case=TRUE)
vehiclescc <- scc[vehicle,]$SCC

vehiclebc <- baltimore[baltimore$SCC %in% vehiclescc,]
vehiclela <- losangeles[losangeles$SCC %in% vehiclescc,]

#Calculate the total for each year
sumvbc<-vector()
sumvbc[1]<-sum(vehiclebc$Emissions[vehiclebc$year==1999])
sumvbc[2]<-sum(vehiclebc$Emissions[vehiclebc$year==2002])
sumvbc[3]<-sum(vehiclebc$Emissions[vehiclebc$year==2005])
sumvbc[4]<-sum(vehiclebc$Emissions[vehiclebc$year==2008])

sumvla<-vector()
sumvla[1]<-sum(vehiclela$Emissions[vehiclela$year==1999])
sumvla[2]<-sum(vehiclela$Emissions[vehiclela$year==2002])
sumvla[3]<-sum(vehiclela$Emissions[vehiclela$year==2005])
sumvla[4]<-sum(vehiclela$Emissions[vehiclela$year==2008])

years<-c("1999","2002","2005","2008")

#Create the plot in a png file
png("plot6.png", width=480, height=480, units="px")

par(mfrow=c(1,2), mar=c(5, 4, 4, 2), oma=c(0, 0, 2, 0))

barplot(sumvbc, names.arg=years, col=brewer.pal(8,"PRGn"), ylim=c(0,7500))

title(main="Baltimore City", xlab="Year", 
      ylab="Total Vehicle PM2.5 Emissions (Tons)")

barplot(sumvla, names.arg=years, col=brewer.pal(8,"PRGn"), ylim=c(0,7500))

title(main="Los Angeles", xlab="Year", 
      ylab="Total Vehicle PM2.5 Emissions (Tons)")

mtext("Total Vehicle PM2.5 Emissions from 1999-2008", side=3, outer=TRUE, cex=1.5)

dev.off()