#corr.R

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
corr <- function(directory, threshold = 0) {
  id<-1:332
  tmp<- c()
  id_count<-1
  reqData<-c()
  k <- 1
  cr <- c() 
   for(id_count in id)
    {
    raw_name<-id[id_count]
    
    #Padding Zeros.
    fileID <- sprintf("%03d", raw_name)
    
    #Generating the file name
    idName <- paste(fileID, ".csv", sep="")
    reqFile <- paste(directory,idName,sep="/")
	
	#Reading the File
    readFile <- read.csv(reqFile)
    
    readFile <- readFile[complete.cases(readFile),]
    
    #Getting the number of rows in each file and comparing it with the threshold.
    if ( nrow(readFile) > threshold ) {
      cr <- c(cr, cor(readFile$sulfate, readFile$nitrate) ) # append corralations
    }
  }
    
	#Final correlated value
	return( cr )
}