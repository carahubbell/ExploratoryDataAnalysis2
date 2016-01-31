## ---------------------------------------------------------------------------------
## Exploratory Data Analysis
## Week 4 Project
## Cara Hubbell
## January 2016
## ---------------------------------------------------------------------------------
##
## This script creates Plot3. Note that you must have the data files in your working
## directory first!

# Read the data into R.
require(dplyr)
require(ggplot2)
nei<-readRDS("summarySCC_PM25.rds")
scc<-readRDS("Source_Classification_Code.rds")

# The question this plot explores:
# ---------------------------------------------------------------------------------
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions 
# from 1999-2008 for Baltimore City? Which have seen increases in emissions from 
# 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
# ---------------------------------------------------------------------------------

#Only consider data from Baltimore City, MD
data<-filter(nei, fips=="24510")

#Create the plot in a png file
png("plot3.png", width=480, height=480, units="px")

g<-ggplot(data,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  scale_fill_manual(values=c("#330006", "#660033", "#660066", "#990033")) +
  theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + 
  xlab("Year") +
  ylab("Total PM2.5 Emission (Tons)") + 
  ggtitle("PM2.5 Emissions in Baltimore City by Source Type")

print(g)

dev.off()