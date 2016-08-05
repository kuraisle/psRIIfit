#' A function to fit a timepoint to a model formula
#'
#' This just makes it easier to pass nlsLM to llply. Please ignore it
#' @param modelFormula a formula the nlsLM fits
#' @param timepoint the spectrum of a timepoint
#' @param startPars the starting guesses for peak intensities
#' @param bZ An external control allowing a lower limit to intensity. Allows fitDemPeaks to have a control for whether or not to go below zero.
#' @export
#' @keywords internal

mod <- function(modelFormula, timepoint, startPars, bZ){
  myMod <- minpack.lm::nlsLM(formula = modelFormula, data = timepoint, start = startPars, lower = bZ)
  myMod
}
