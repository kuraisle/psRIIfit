#' Calculate the concentrations of species from intensities
#'
#' From a given concentration, calculates extinction coefficients and concentrations for three sets of peak intensities. Also plots the concentrations against time. The name of the function is stupid, I just couldn't think of a better one
#'
#' @param concentration The known total concentration.
#' @param inttable A table in which each column is a set of intensities for a peak.
#' @param times The timepoints at which you collected spectra.
#' @param plotTitle The title you want on the plot this delivers.
#' @param species A vector of the names of species in the order they appear in inttable.
#' @export

exCoYeah <- function(concentration, inttable, times, plotTitle, species = c("Free", "Protonated", "Native")){
  myCoefs <- exConls(concentration = concentration, inttable = inttable)
  concs <- concConvert(exCofit = myCoefs, inttable = inttable)
  colnames(concs) <- species
  concPlot(conctable = concs, concentration = concentration, times = times, plotTitle = plotTitle)
  yeahlist <- list(extinctionCoefficients = myCoefs, conctable = concs)
}
