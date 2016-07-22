#' Convert a table of peak intensities to concentrations
#'
#' Uses the output of exConls and the original table of intensities to give concentration. Take care with units!
#' @param exCofit the output of an nls function finding the extinction coefficients
#' @param inttable the table of intensities used in the previous nls function
#' @export

concConvert <- function(exCofit, inttable){
  coefs <- as.vector(coef(exCofit))
  outtable <- matrix(nrow = nrow(inttable), ncol = ncol(inttable))
  for (i in 1:ncol(inttable)){
    outtable[,i] <- inttable[,i] / coefs[i]
    outtable
  }
  outtable
}
