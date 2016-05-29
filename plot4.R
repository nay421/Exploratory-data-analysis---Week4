#Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge 2 files by SCC

NEI_SCC <- merge(NEI, SCC, by="SCC")



coal <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)

NEISCC_coal <- NEI_SCC[coal, ]



TotalPerYear_Coal <- aggregate(Emissions ~ year, NEISCC_coal, sum)


library(ggplot2)

g <- ggplot(TotalPerYear_Coal, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("Year") +
    ylab(expression('Total PM 2.5 Emission Per Year (Tons)')) +
    ggtitle('Emission due to Coal combustion per year in USA')
print(g)

ggsave(g, file = 'plot4.png')
