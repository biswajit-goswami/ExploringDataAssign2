NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
baltimoredata <- NEI[NEI$fips == "24510", ] 
LAdata <- NEI[NEI$fips == "06037", ] 
emission_motor_baltimore <- baltimoredata[baltimoredata$SCC %in% pollutant_motor$SCC, ]
emission_motor_LA <- LAdata[LAdata$SCC %in% pollutant_motor$SCC, ]

total_emission_motor_baltimore <- aggregate(emission_motor_baltimore$Emissions, list(emission_motor_baltimore$year), FUN = "sum")
total_emission_motor_LA <- aggregate(emission_motor_LA$Emissions, list(emission_motor_LA$year), FUN = "sum")
par(mfrow=c(2,1))
plot(total_emission_motor_baltimore$Group.1,total_emission_motor_baltimore$x,type="l",ylab="emissions baltimore",xlab="year")
plot(total_emission_motor_LA$Group.1,total_emission_motor_LA$x,type="l",ylab="emissions LA",xlab="year")
dev.copy(png,file="plot6.png",height=480,width=480)
dev.off()
#for baltimore,there is a decrease,while for LA there is a slight increase in the emmisions due to motor pollutants