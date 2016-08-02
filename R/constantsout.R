#' Gets the constants from mkin output
#'
#' This is pointless except as a part of another function
#' @param model mkin output from which the coefficients export
#' @export
#' @keywords internal

constantsOut <- function(model){
  con <- coef(model)[4:5]
}
