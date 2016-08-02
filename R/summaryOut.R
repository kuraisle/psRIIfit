#' Export coefficients from mkin summary
#'
#' The "bpar" of an mkin list contains the coefficients and their confidence intervals. This takes these and puts them in a table
#' @param mkinOutput The original mkin output
#' @export

summaryOut <- function(mkinOutput){
  theSummary <- summary(mkinOutput)
  outTable <- data.frame(Estimate = theSummary$bpar[,1], theSummary$bpar[,5:6])
  outTable
}
