NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
total_emissions <- aggregate(NEI$Emissions, list(NEI$year), FUN = "sum")
plot(total_emissions, type = "l", xlab = "Year", 
     main = "Total Emissions from 1999 to 2008", 
     ylab = "Total PM[2.5] Emission")
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()