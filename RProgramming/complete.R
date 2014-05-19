#Complete.R

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
complete <- function(directory, id = 1:332) {

  tmp<- c()
  id_count<-1
  while(id_count<=length(id)){
    raw_name<-id[id_count]
    
    #Padding Zeros.
    fileID <- sprintf("%03d", raw_name)
    
    #Generating the file name
    idName <- paste(fileID, ".csv", sep="")
    reqFile <- paste(directory,idName,sep="/")
    readFile <- read.csv(reqFile,header=TRUE) 
    
    #Getting the number of rows in each file.
    numR<-nrow(readFile)
    
    #Initializing the row count iterator.
    id_row <- 1:numR
    j <- 0
    for(i in id_row){
      if(!is.na(readFile[i,c("sulfate")])&!is.na(readFile[i,c("nitrate")])){
        j <- j+1
      }       
    }
    
    #Binding the row data to the final matrix
    tmp<- rbind(tmp,c(i,j))
  k <- k+1
  }
  
#Generating the data frame output format as required.
name <- c('id', 'nobs')
z<- data.frame(tmp)
names(z)<-name
#Testing the output.
#print(z)

}