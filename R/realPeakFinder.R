#'Find the true maxima of spectra within peak ranges
#'
#'When given a list of spectra and vectors of peak parameters, returns the maxima within those peak ranges for each spectrum
#'@param spectraList a list of data frames containing absorbance and wavelength columns. The wavelengths must be integer values from largest to smallest.
#'@param centres a vector of the centres of the peaks modeled, given as wavelengths.
#'@param widths a vector of the widths of the peaks modeled, given as wavelengths.
#'@export


realPeakFinder <- function(spectraList, centres, widths){
  maxPositions <- matrix(ncol = length(centres), nrow = length(spectraList))
  for(i in 1:nrow(maxPositions)){
    for(j in 1:ncol(maxPositions)){
      maxPositions[i,j] <- findLocalMax(centre = centres[j], width = widths[j], spectrum = spectraList[[i]]$absorbance, wavmax = spectraList[[i]]$wavelength[1])
    }
    maxPositions
  }
  maxPositions
}
