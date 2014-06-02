# : Finding the best hospital in a state

best <- function(state, outcome) {
  #Reading the data.
  data_file <- read.csv('assign2/outcome-of-care-measures.csv', colClasses = 'character')
  
  #Supressing the warnings
  data_file[,11] <- suppressWarnings(as.numeric(data_file[,11]))
  data_file[,17] <- suppressWarnings(as.numeric(data_file[,17]))
  data_file[,23] <- suppressWarnings(as.numeric(data_file[,23]))

  #Error verification for states and conditions
  states <- unique(data_file$State)
  conditions <- c('heart attack', 'heart failure', 'pneumonia')
  if (!state %in% states) { stop('invalid state') }
  if (!outcome %in% conditions) { stop('invalid outcome') } 
  
  #subset for the required state
  filtered_data_file <- data_file[grep(state, data_file$State, ignore.case=T),]
  
  #pick a column to select based on the outcome
  if (outcome == 'heart attack' ) { selector <- 11 }
  if (outcome == 'heart failure' ) { selector <- 17 }
  if (outcome == 'pneumonia' ) { selector <- 23 }
  
  sorted <- filtered_data_file[order(filtered_data_file[,selector],filtered_data_file[,2]),]
  sorted[1,2]
  

}