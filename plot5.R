##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

if(!exists('NEI')){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists('SCC')){
    SCC <- readRDS("Source_Classification_Code.rds")
}

NEI_motor <- NEI[NEI$fips == '24510' & NEI$type=='ON-ROAD',]

Total_motor_Baltimore <- aggregate(Emissions~year, NEI_motor, sum)

library(ggplot2)

g <- ggplot(data = Total_motor_Baltimore, aes(factor(year), Emissions))+geom_line(aes(group = 1,col =Emissions))
g <- g +  xlab("Year") +
    ylab(expression('Total PM 2.5 Emission Per Year (Tons)')) +
    ggtitle('Emission from motor vehicle sources per year in Baltimore City')
ggsave(g, file = 'plot5.png')
