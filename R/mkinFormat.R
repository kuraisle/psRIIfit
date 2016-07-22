#' Converts concentrations into mkin's format
#'
#' takes a data table of concentrations and a vector of times into mkin's slightly weird format
#' @param conctable a table containing three columns of concentrations
#' @param times a vector of the timepoints at which spectra were collected
#' @export

mkinFormat <- function(conctable, times){
  nameVec <- c(rep("Free", times = nrow(conctable)),
               rep("Protonated", times = nrow(conctable)),
               rep("Native", times = nrow(conctable)))
  timeVec <- c(rep(x = times, times = 3))
  valueVec <- c(conctable[,1], conctable[,2], conctable[,3])
  df <- data.frame(name = nameVec, time = timeVec, value = valueVec)
  df
}
