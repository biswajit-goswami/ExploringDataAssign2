NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimoredata <- NEI[NEI$fips == "24510", ] 

total_emission_baltimore <- aggregate(baltimoredata$Emissions, list(baltimoredata$year), FUN = "sum")
plot(total_emission_baltimore, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore from 1999 to 2008", 
     ylab = "Total PM[2.5] Emission")

dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()