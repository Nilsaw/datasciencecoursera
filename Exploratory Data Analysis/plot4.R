#To load the file use the following script :- 
# source("plot3.R",print.eval=TRUE)

library(ggplot2)
library(plyr)

# Loading the given data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Coal data
coal_data = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

#Merge NEI and SCC

merged_data <- merge(x=NEI, y=coal_data, by='SCC')

sum_merged_data <- aggregate(merged_data[, 'Emissions'], by=list(merged_data$year), sum)
names(sum_merged_data)<-c("Year","Emissions")
# Across the United States, how have emissions from coal combustion-related sources 
# changed from 1999-2008?
png(filename='plot4.png')
ggplot(data=sum_merged_data, aes(x=Year, y=Emissions/1000)) + 
  geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
  ggtitle(expression('Total Emissions of PM'[2.5])) + 
  ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
  geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
  theme(legend.position='none') + scale_colour_gradient(low='black', high='blue')
dev.off()