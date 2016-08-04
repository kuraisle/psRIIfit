#' A formula to fit peaks to a set of data
#'
#' Fits a set of peaks with defined centres and widths (FWHM) to a range of spectra. I know the name is silly.
#' @param fixed A data frame containing columns named "centres" and "widths", specifying the centre and HWHM of each peak respectively.
#' @param guesses A list of starting guesses for your data. nls.LM is smart enough that these usually just need to be of the right order of magnitude. In a list, called "i1", "i2" etc.
#' @param wavelengths A vector of the wavelengths your data is over.
#' @param spectra A list of data frames containing wavelength and absorbance data.
#' @return A matrix of intensities for each peak in fixed.
#' @export

fitDemPeaks <- function(fixed, guesses, spectra, wavelengths){
  #generate a set of peaks with the specified centres and widths
  myModelFormula <- gaussgen(fixedParameters = fixed, wavelength = wavelengths)
  #myModel uses mod to build an nlsLM function which only takes the timepoint as an argument so laply can use it
  myModel <- function(specTimePoint){
    theModel <- mod(modelFormula = myModelFormula, timepoint = specTimePoint, startPars = guesses)
    coef(theModel)
  }
  #This applies myModel to each timepoint in a list and returns a matrix containing intensities
  plyr::laply(.data = spectra, .fun = myModel)
}
