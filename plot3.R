library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoredata <- NEI[NEI$fips == "24510", ] 

g <- ggplot(baltimoredata, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") + 
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore from 1999 to 2008");
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

#All the types,except point type,have decreased.