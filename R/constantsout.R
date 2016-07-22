#' Gets the constants from mkin output
#'
#' This is pointless except as a part of another function
#' @export

constantsOut <- function(model){
  con <- coef(model)[4:5]
}
