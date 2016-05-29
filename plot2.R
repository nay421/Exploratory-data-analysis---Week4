#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI_Baltimore <- subset(NEI, fips == '24510')

TotalPerYear_Baltimore <- aggregate(Emissions ~ year, NEI_Baltimore, sum)

png ('plot2.png', width = 480, height = 480)

barplot(height = TotalPerYear_Baltimore$Emissions, xlab = 'Year', ylab = 'Total PM 2.5 Emission Per Year (Tons)', main = 'Emission per year for Baltimore City')

dev.off()
