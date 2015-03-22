NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoredata <- NEI[NEI$fips == "24510", ] 

pollutant_motor <- SCC[grep("highway veh", SCC$Short.Name, ignore.case = TRUE), ]
emission_motor <- baltimoredata[baltimoredata$SCC %in% pollutant_motor$SCC, ]

total_emission_motor_baltimore <- aggregate(emission_motor$Emissions, list(emission_motor$year), FUN = "sum")
plot(total_emission_motor_baltimore, type = "l", xlab = "Year", 
     main = "Total Emissions From motor vehicle related Sources in Baltimore", 
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.copy(png,file="plot5.png",height=480,width=480)
dev.off()
