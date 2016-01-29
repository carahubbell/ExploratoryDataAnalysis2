## This script creates Plot4. Note that you must have the data files in your working 
## directory first! 

# Read the data into R. 
require(dplyr) 
nei<-readRDS("summarySCC_PM25.rds") 
scc<-readRDS("Source_Classification_Code.rds") 

# The question this plot explores: 
# --------------------------------------------------------------------------------- 
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008? 
# --------------------------------------------------------------------------------- 

#Only consider data from coal combustion-related sources 
combustion <- grepl("comb", scc$SCC.Level.One, ignore.case=TRUE) 
coal <- grepl("coal", scc$SCC.Level.Four, ignore.case=TRUE) 
combcoal <- (combustion & coal) 
combcoalscc <- scc[combcoal,]$SCC 
combcoalnei <- nei[nei$SCC %in% combcoalscc,] 

#Separate the data by year 
cc99<-filter(combcoalnei,year==1999) 
cc02<-filter(combcoalnei,year==2002) 
cc05<-filter(combcoalnei,year==2005) 
cc08<-filter(combcoalnei,year==2008) 

#Calculate the sum for each year 
ccsums<-vector() 
ccsums[1]<-sum(cc99$Emissions) 
ccsums[2]<-sum(cc02$Emissions) 
ccsums[3]<-sum(cc05$Emissions) 
ccsums[4]<-sum(cc08$Emissions) 
years<-c("1999","2002","2005","2008") 

#Create the plot in a png file 
png("plot4.png", width=480, height=480, units="px") 

barplot(ccsums, names.arg=years, col=rainbow(4, start = 1, end = .15, alpha = 1)) 

title(main="Total PM2.5 Emissions from Coal Combustion Sources", 
      xlab="Year", ylab="Total PM2.5 Emissions (Tons)") 

dev.off()