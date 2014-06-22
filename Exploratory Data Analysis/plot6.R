#To load the file use the following script :- 
# source("plot6.R",print.eval=TRUE)

library(ggplot2)
library(plyr)

# Loading the given data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Create a subset of the yearly data

NEI$year <- factor(NEI$year, levels=c('1999', '2002', '2005', '2008'))

# subset for onroad data of Baltimore City, Maryland
# subset for onroad data of Los Angeles County, California
onroad_data_MD <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
onroad_data_CA <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

# Aggregate data generated.
aggregate_data_MD <- aggregate(onroad_data_MD[, 'Emissions'], by=list(onroad_data_MD$year), sum)
colnames(aggregate_data_MD) <- c('year', 'Emissions')
aggregate_data_MD$City <- paste(rep('MD', 4))

aggregate_data_CA <- aggregate(onroad_data_CA[, 'Emissions'], by=list(onroad_data_CA$year), sum)
colnames(aggregate_data_CA) <- c('year', 'Emissions')
aggregate_data_CA$City <- paste(rep('CA', 4))

final_data <- as.data.frame(rbind(aggregate_data_MD, aggregate_data_CA))
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources 
# in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time 
# in motor vehicle emissions?
png('plot6.png')
qplot(year, Emissions, data = final_data, group = City, color = City, 
      geom = c("point", "line"), ylab = expression("Total Emissions, PM"[2.5]), 
      xlab = "Year", main = "Comparison of Total Emissions by County")
dev.off()