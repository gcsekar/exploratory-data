NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

baltimore.city <- NEI[NEI$fips == "24510",]
agg.baltimore.emissions <- aggregate(Emissions ~ year, baltimore.city,sum)

# Chart it

library(ggplot2)
g <- ggplot(baltimore.city, aes(as.factor(year), Emissions, fill=type))
g <- g + geom_bar(stat="identity")
g <- g + facet_grid(. ~ type)
g <- g + labs(x = "Year", y = expression("PM"[2.5]*" Emissions"))
g <- g + ggtitle(expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Type"))
g

dev.copy(png, "final-assignment/plot3.png")
dev.off()

