#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?


if(!exists('NEI')){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists('SCC')){
    SCC <- readRDS("Source_Classification_Code.rds")
}

NEI_motor_2cities <- NEI[(NEI$fips == '24510'|NEI$fips == '06037') & NEI$type == 'ON-ROAD', ]

library(dplyr)
Total_motor_2cities <- NEI_motor_2cities %>% group_by (fips, year) %>% summarise(sum(Emissions))

#Rename Emission column
names(Total_motor_2cities)[names(Total_motor_2cities) == 'sum(Emissions)'] <- 'Emissions'
#Recode fips variables
library(car)

Total_motor_2cities$fips <- recode(Total_motor_2cities$fips, "24510 = 'Baltimore City'; else = 'Los Angeles County' ")

library(ggplot2)

g <- ggplot(data=Total_motor_2cities, aes(x= factor(year), y=Emissions, fill = factor(fips)))+geom_bar(stat='identity', position='dodge')+ xlab("Year") +
    ylab(expression('Total PM 2.5 Emission Per Year (Tons)')) + scale_fill_discrete(name='Location')+
    ggtitle('Emission from motor vehicle sources per year in Baltimore City and LA county')+theme(axis.title.x=element_text(size=7), axis.title.y=element_text(size=7))

h <- ggplot(data=Total_motor_2cities, aes(x= factor(year), y=Emissions, group = factor(fips)))+geom_line(aes(colour=factor(fips)))+ xlab("Year") +
    ylab(expression('Total PM 2.5 Emission Per Year (Tons)')) + scale_colour_discrete(name='Location')+
    ggtitle('Emission from motor vehicle sources per year in Baltimore City and LA county')+theme(axis.title.x=element_text(size=7), axis.title.y=element_text(size=7))

library(gridExtra)

i <- arrangeGrob(g,h, nrow=2)

ggsave(i, file = 'plot6.png')
