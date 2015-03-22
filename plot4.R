NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

head(SCC$Short.Name)

pollutant_coal <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE), ]
emission_coal <- NEI[NEI$SCC %in% pollutant_coal$SCC, ]

total_emission_coal <- aggregate(emission_coal$Emissions, list(emission_coal$year), FUN = "sum")
plot(total_emission_coal, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal related Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.copy(png,file="plot4.png",height=480,width=480)
dev.off()
#Thus,the coal related emmissions have reduced