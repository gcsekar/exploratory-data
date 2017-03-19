NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

vehicle.type <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicle.scc <- SCC[vehicle.type,]$SCC
vehicles <- NEI[NEI$SCC %in% vehicle.scc & NEI$fips %in% c("24510","06037"), ]
vehicles$city <- NA
vehicles[vehicles$fips == "06037",]$city <- "Los Angeles County"
vehicles[vehicles$fips == "24510",]$city <- "Baltimore City"

#Chart it

g <- ggplot(vehicles, aes(factor(year), Emissions, fill=city))
g <- g + geom_bar(aes(as.factor(year), fill=city), stat="identity", show.legend = FALSE) 
g <- g + labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (Tons)"))
g <- g + ggtitle(expression("PM"[2.5]*" Emission (Tons) between Baltimore & LA County from 1999-2008"))
g <- g + facet_grid(.~ city)
g

dev.copy(png, "final-assignment/plot6.png")
dev.off()
