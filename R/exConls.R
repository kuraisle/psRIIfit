#' Fit extinction coefficients to your intensity data
#'
#' Uses nls to fit pseudo-extinction coefficients to three intensities, given total concentration. If you want to do any number but three, you'll need a new function.
#' @param concentration the total concentration of your species
#' @param inttable a dataframe containing three columns, each containing the intensity of your peaks across a dataset
#' @export

exConls <- function(concentration, inttable){
  intlist <- list(concentration = rep(concentration, times = nrow(inttable)), i1 = inttable[,1], i2 = inttable[,2], i3 = inttable[,3])
  fitting <- nls(formula = concentration ~ i1/exCo1 + i2/exCo2 + i3/exCo3,
                 data = intlist,
                 start = list(exCo1 = 0.07, exCo2 = 0.03, exCo3 = 0.03))
  fitting
}
