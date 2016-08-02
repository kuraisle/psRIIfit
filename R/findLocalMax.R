#'Finds the maximum of a spectrum within a peak's width
#'
#'When given a peak's centre and full width at half maximum, can find the position of the maximum within that range for a given spectrum
#'
#'@param centre The centre of the peak.
#'@param width The FWHM of the peak.
#'@param spectrum The spectrum for inspection.
#'@param wavmax The maximum wavelength of the spectrum (largest wavelength).
#'@export
#'@keywords internal

findLocalMax <- function(centre, width, spectrum, wavmax){
  higher <- as.integer(wavmax - (centre + width/2))
  lower <- as.integer(wavmax -(centre - width/2))
  if(lower >= length(spectrum)){
    lower = length(spectrum)
  }
  localmax <- which.max(spectrum[higher:lower])
  localmax <- wavmax - (higher + localmax)
}
