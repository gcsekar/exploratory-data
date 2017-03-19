NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

baltimore.city <- NEI[NEI$fips == "24510",]
agg.baltimore.emissions <- aggregate(Emissions ~ year, baltimore.city,sum)

# Chart it

barplot(agg.baltimore.emissions$Emissions, 
        names.arg = agg.baltimore.emissions$year, 
        xlab = "Year", ylab = "PM 2.5 Emissions", 
        main = "Total PM2.5 Emission from Baltimore City" )

dev.copy(png, "final-assignment/plot2.png")
dev.off()

