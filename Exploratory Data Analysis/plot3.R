#To load the file use the following script :- 
# source("plot3.R",print.eval=TRUE)

library(ggplot2)
library(plyr)

# Loading the given data

NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Creating subsets
sub_bc <- subset(NEI, fips == 24510)
sub_bc$year <- factor(sub_bc$year, levels=c('1999', '2002', '2005', '2008'))

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
png('plot3.png', width=800, height=500, units='px')
ggplot(data=sub_bc, aes(x=year, y=log(Emissions))) + facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + stat_boxplot(geom ='errorbar') +
  ylab(expression(paste('Log', ' of PM'[2.5], ' Emissions'))) + xlab('Year') + 
  ggtitle('Emissions per Type in Baltimore City')
dev.off()