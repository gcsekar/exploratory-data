NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

agg.emissions <- aggregate(Emissions ~ year, NEI, sum)
agg.emissions$Emissions <- agg.emissions$Emissions/1000000

#png("plot1.png", width = 600,height=600, units = "px", bg="transparent")

barplot(agg.emissions$Emissions, xlab="Year", 
        ylab="PM2.5 Emissions (million tons)", 
        main = "Total PM2.5 Emissions From US Sources by Year", 
        names.arg = agg.emissions$year)
dev.copy(png, "final-assignment/plot1.png")
dev.off()

