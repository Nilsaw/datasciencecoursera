rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("assign2/outcome-of-care-measures.csv", colClasses="character")
  
  ## Setting up the desired column
  if (outcome == "heart attack") {
    data[, 11] <- as.numeric(data[, 11])
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  } else if (outcome == "heart failure") {
    data[, 17] <- as.numeric(data[, 17])
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
  } else if (outcome == "pneumonia") {
    data[, 23] <- as.numeric(data[, 23])
    column <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
  } else {
    stop("invalid outcome")
  }
  
  #Filtering the required data for the given state
  filtered_state_data <- split(data[, c("Hospital.Name", "State", column)], data$State)
  
  rank_hospital <- function(state_data, num) {
    ordered_state_data <- order(state_data[3], state_data$Hospital.Name, na.last=NA)
    
    if (num == "best") {
      state_data$Hospital.Name[ordered_state_data[1]]
    } else if (num == "worst") {
      state_data$Hospital.Name[ordered_state_data[length(ordered_state_data)]]
    } else if (is.numeric(num)) {
      state_data$Hospital.Name[ordered_state_data[num]]
    } else {
      stop("invalid num")
    }
  } 
  pre_result <- lapply(filtered_state_data, rank_hospital, num)  
  data.frame(hospital = unlist(pre_result), state = names(pre_result), row.names = names(pre_result))
}