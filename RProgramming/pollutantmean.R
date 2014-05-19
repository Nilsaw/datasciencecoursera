#pollutantmean.R :- 

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

pollutantmean <- function(directory, pollutant, id = 1:332) {

  #Initializing the vector
  final<- c();
  for(i in id){
    
    #Padding zeros.
    fileID <- sprintf("%03d", i)
    
    #Generating filenames.
    idName <- paste(fileID, ".csv", sep="")
    reqFile <- paste(directory,idName,sep="/")
    readFile <- read.csv(reqFile)
    x<-readFile[,c(pollutant)]
    
    #Removinv 'na' values
    x <- x[!is.na(x)]
    
    #Appending data to the final vector.
    final<-c(final,x)
  }
  mean(final)
}

