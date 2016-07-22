#' Get a matrix of constants from mkin
#'
#' Turn a list of mkin outputs into a matrix of the coefficients
#' @param conList a list of mkin outputs
#' @param condition a vector containing the conditions you want to split the coefficients by in the order they are in your list
#' @export

conLtoM <- function(conList, condition){
  conM <- matrix(nrow = length(condition), ncol = length(conList[[1]])+1)
  conM[,1] <- condition
  conMcol <- function(itemList, item){
    theCol <- c()
    for(j in 1:length(itemList)){
      theCol[j] <- itemList[[j]][item]
    }
    theCol
  }
  for(i in 1:length(conList[[1]])){
    conM[,i+1] <- conMcol(conList, i)
  }
  conM
}
