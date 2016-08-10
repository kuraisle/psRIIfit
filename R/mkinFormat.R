#' Converts concentrations into mkin's format
#'
#' takes a data table of concentrations and a vector of times into mkin's slightly weird format
#' @param conctable a table containing three columns of concentrations
#' @param times a vector of the timepoints at which spectra were collected
#' @export

mkinFormat <- function(conctable, times){
  someNames <- names(conctable)
  nameVec <-c(rep(someNames[i], times = nrow(conctable)))
  for(i in 2:length(someNames)){
    nameVec <- c(nameVec, rep(someNames[i], times = nrow(conctable)))
    }
  timeVec <- c(rep(x = times, times = ncol(conctable)))
  valueVec <- c(conctable[,1])
  for(i in 2:ncol(conctable)){
    valueVec <- c(valueVec, conctable[,i])
  }
  df <- data.frame(name = nameVec, time = timeVec, value = valueVec)
  df
}
