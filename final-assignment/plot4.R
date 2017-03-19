source("final-assignment/downloadfile.R")

NEI <- readRDS("final-assignment/data/summarySCC_PM25.rds")
SCC <- readRDS("final-assignment/data/Source_Classification_Code.rds")

combutions.type <- grepl("comb", SCC$SCC.Level.One, ignore.case = TRUE)
coal.type <- grepl("coal", SCC$SCC.Level.Four, ignore.case = TRUE)

coal.combustion.scc <- SCC[coal.type & combutions.type,]$SCC
coal.combustion <- NEI[NEI$SCC %in% coal.combustion.scc,]

# Chart it

g <- ggplot(coal.combustion, aes(factor(year), Emissions/10^6))
g <- g + geom_bar(aes(as.factor(year), fill=year), stat="identity", show.legend = FALSE) 
g <- g + labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (Million Tons)"))
g <- g + ggtitle(expression("PM"[2.5]*" Emission (Million Tons) from Coal Combustion in US from 1999-2008"))
g

dev.copy(png, "final-assignment/plot4.png")
dev.off()

