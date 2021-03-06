#' A formula to fit peaks to a set of data
#'
#' Fits a set of peaks with defined centres and widths (HWHM) to a range of spectra. I know the name is silly.
#' @param peaks The number of peaks you wish to fit (currently no more than four)
#' @param fixed a list of defined centres and widths for your peaks. See the documentation for gaussgen for format
#' @param guesses a list of starting guesses for your data. nls.LM is smart enough that these usually just need to be of the right order of magnitude. In a list, called "i1", "i2" etc.
#' @param wavelengths a vector of the wavelengths your data is over
#' @export

fitDemPeaks <- function(peaks, fixed, guesses, spectra, wavelengths){
  #generate a set of peaks with the specified centres and widths
  myModelFormula <- gaussgen(peakNumber = peaks, fixedParameters = fixed, wavelength = wavelengths)
  #myModel uses mod to build an nlsLM function which only takes the timepoint as an argument so laply can use it
  myModel <- function(specTimePoint){
    theModel <- mod(modelFormula = myModelFormula, timepoint = specTimePoint, startPars = guesses)
    coef(theModel)
  }
  #This applies myModel to each timepoint in a list and returns a matrix containing intensities
  plyr::laply(.data = spectra, .fun = myModel)
}
