#'Fit extinction coefficients to your intensity data
#'
#' Uses nls to fit pseudo-extinction coefficients to three intensities, given total concentration. If you want to do any number but three, you'll need a new function.
#' @param concentration The total concentration of your species.
#' @param inttable A dataframe with columns containing the intensities of each peak across your dataset.
#' @param magnitude An rough guess for the extinction coefficients. This assumes all are of a similar order of magnitude.
#' @return Extinction coefficients for each column. Named exCo_ for the number of the column. see \code{\link[stats]{nls}}
#' @export

exConls <- function(concentration, inttable, magnitude = 0.05){
  intlist <- list(concentration = rep(concentration, times = nrow(inttable)))
  for(i in 1:ncol(inttable)){
    assign(x = paste("intlist$i", i), value = inttable[,i])
    intlist
  }
  vars <- c()
  for(i in 1:ncol(inttable)){
    vars[i] <- paste("i", i, "/exCo", i , sep = "")
    vars
  }
  fla <- paste("concentration ~", paste(vars, collapse = "+"))
  theMod <- as.formula(fla)
  guesses <- list()
  for(i in 1:ncol(inttable)){
    assign(x = paste("guesses$exCo",i, sep = ""), value = magnitude)
  }
  fitting <- nls(formula = theMod,
                 data = intlist,
                 start = guesses)
  fitting
}
