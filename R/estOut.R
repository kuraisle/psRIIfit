#' Collate a list of mkin bpars into a table
#'
#' The function summaryOut extracts the coefficients and confidence intervals from mkin output. This takes a list of these outputs and collates them in a matrix
#' @param outList a list of mkin bpars stored in data frames, output of summaryOut
#' @param conditions a vector of the experimental conditions the items of your outList are separated by
#' @param row an integer specifying the row of the tables within outList you wish to export
#' @export

#Can I specify the row by its name with this? Could be useful for combining with summaryOut

estOut <- function(outList, conditions, row){
  outMat <- matrix(ncol = 3, nrow = length(conditions))
  for(i in 1:length(outList)){
    outMat[i,1] <- outList[[i]][row,1]
    outMat[i,2] <- outList[[i]][row,2]
    outMat[i,3] <- outList[[i]][row,3]
  }
  rownames(outMat) <- conditions
  colnames(outMat) <- c("Estimate", "Lower", "Upper")
  outMat
}
