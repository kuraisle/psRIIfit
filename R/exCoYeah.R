#' Calculate the concentrations of species from intensities
#'
#' From a given concentration, calculates extinction coefficients and concentrations for three sets of peak intensities. Also plots the concentrations against time. The name of the function is stupid, I just couldn't think of a better one
#'
#' @param concentration the known total concentration
#' @param inttable a table in which each column is a set of intensities for a peak
#' @param times the timepoints at which you collected spectra
#' @param plotTitle the title you want on the plot this delivers
#' @export

exCoYeah <- function(concentration, inttable, times, plotTitle){
  myCoefs <- exConls(concentration = concentration, inttable = inttable)
  concs <- concConvert(exCofit = myCoefs, inttable = inttable)
  concPlot(conctable = concs, concentration = concentration, times = times, plotTitle = plotTitle)
  yeahlist <- list(extinctionCoefficients = myCoefs, conctable = concs)
}
