#' Intensity gaussian
#'
#' This function generates a gaussian function
#' @param intensity maximum height of the peak
#' @param wavelength the x-axis of the peak (this is a very niche package)
#' @param centre the centre of the peak
#' @param width the full width at half maximum
#' @return A gaussian peak
#' @export


gaussint <- function(intensity, wavelength, centre, width){
  peak <- intensity * exp(-log(2)*((wavelength-centre)/width)^2)
  peak
}
