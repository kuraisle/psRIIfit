#' A function to fit a timepoint to a model formula
#'
#' This just makes it easier to pass nls.LM to llply. Please ignore it
#' @export

mod <- function(modelFormula, timepoint, startPars){
  myMod <- minpack.LM::nlsLM(formula = modelFormula, data = timepoint, start = startPars, lower = c(0,0,0))
  myMod
}
