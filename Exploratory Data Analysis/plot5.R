#To load the file use the following script :- 
# source("plot5.R",print.eval=TRUE)

library(ggplot2)
library(plyr)

# Loading the given data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Create a subset of the yearly data

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# Creating a subset for the on-road data for baltimore.
onroad_data_bc <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

# Generating aggregate data for emissions and year.
aggregate_data <- aggregate(onroad_data_bc[, 'Emissions'], by=list(onroad_data_bc$year), sum)
colnames(aggregate_data) <- c('year', 'Emissions')

# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
png(filename='plot5.png')

barplot(aggregate_data$Emissions, names.arg=aggregate_data$year ,type = "n", ylab = expression("Total Emissions, PM"[2.5]), 
     xlab = "Year", main = "Total Emissions from Motor Vehicle Sources",col=("red"))
dev.off()