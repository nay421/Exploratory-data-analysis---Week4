##Exploratory Data Analysis Assignment - Week4 - Case 1

#Questions

#You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

str(NEI)

NEI$year <- as.factor(as.character(NEI$year))

TotalPerYear <- aggregate(Emissions ~ year, NEI, sum)

png ('plot1.png', width = 480, height = 480)

barplot(height = TotalPerYear$Emissions, xlab = 'Year', ylab = 'Total PM 2.5 Emission Per Year (Tons)', main = 'Emission per year')

dev.off()