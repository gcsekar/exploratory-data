source("final-assignment/downloadfile.R")

NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

vehicle.type <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicle.scc <- SCC[vehicle.type,]$SCC
baltimore.vehicles <- NEI[NEI$SCC %in% vehicle.scc & NEI$fips == 24510, ]

# Chart it

g <- ggplot(baltimore.vehicles, aes(factor(year), Emissions))
g <- g + geom_bar(aes(as.factor(year), fill=year), stat="identity", show.legend = FALSE) 
g <- g + labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (Tons)"))
g <- g + ggtitle(expression("PM"[2.5]*" Emission (Tons) from Coal Combustion in US from 1999-2008"))
g


dev.copy(png, "final-assignment/plot5.png")
dev.off()

