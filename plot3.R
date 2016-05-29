#Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- subset(NEI, fips == '24510')

TotalPerYearandtype_Baltimore <- aggregate(Emissions ~ year+type, NEI_Baltimore, sum)

TotalPerYearandtype_Baltimore$year <- as.numeric(as.character(TotalPerYearandtype_Baltimore$year))


library(ggplot2)

g <- ggplot(data = TotalPerYearandtype_Baltimore, aes( x = year, y = Emissions, color = type))+geom_line()+ggtitle('Emission per year in Baltimore city stratified by type')

ggsave(filename = 'plot3.png')