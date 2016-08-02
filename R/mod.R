#' A function to fit a timepoint to a model formula
#'
#' This just makes it easier to pass nlsLM to llply. Please ignore it
#' @param modelFormula a formula the nlsLM fits
#' @param timepoint the spectrum of a timepoint
#' @param startPars the starting guesses for peak intensities
#' @export
#' @keywords internal

mod <- function(modelFormula, timepoint, startPars){
  myMod <- minpack.lm::nlsLM(formula = modelFormula, data = timepoint, start = startPars, lower = c(0,0,0))
  myMod
}
