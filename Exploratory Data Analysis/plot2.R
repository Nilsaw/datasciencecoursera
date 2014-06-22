# Load the given data
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Subset data 
sub_bc <- subset(NEI, fips=='24510')

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
png(filename='plot2.png')
barplot(tapply(X=sub_bc$Emissions, INDEX=sub_bc$year, FUN=sum), 
        main='Total number of Emissions in Baltimore City, MD', xlab='Year', ylab=expression('PM'[2.5]),col=c("Blue"))
dev.off()