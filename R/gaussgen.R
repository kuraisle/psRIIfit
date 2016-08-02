#' A generator of multiple gaussian peaks
#'
#' Generates up to four gaussian peaks (I was too lazy to make it more general)
#' @param peakNumber The number of peaks you want to generate
#' @param fixedParameters a list of fixed centres and half widths at half maximum. Centres are named "c1 = " etc., and widths as "w1 = " etc.
#' @param wavelength the wavelength of the dataset you want to fit the peaks to
#' @export

gaussgen <- function(peakNumber, fixedParameters, wavelength){
  if(peakNumber == 1) {
    c1 <- fixedParameters$c1
    w1 <- fixedParameters$w1/2
    generatedGauss <- formula(absorbance ~ gaussint(intensity = i1, centre = c1, width = w1, wavelength = wavelength))
  } else if(peakNumber == 2) {
    c1 <- fixedParameters$c1
    w1 <- fixedParameters$w1/2
    c2 <- fixedParameters$c2
    w2 <- fixedParameters$w2/2
    generatedGauss <- formula(absorbance ~ gaussint(intensity = i1, centre = c1, width = w1, wavelength = wavelength)+
                                gaussint(intensity = i2, centre = c2, width = w2, wavelength = wavelength))
  } else if(peakNumber == 3) {
    c1 <- fixedParameters$c1
    w1 <- fixedParameters$w1/2
    c2 <- fixedParameters$c2
    w2 <- fixedParameters$w2/2
    c3 <- fixedParameters$c3
    w3 <- fixedParameters$w3/2
    generatedGauss <- formula(absorbance ~ gaussint(intensity = i1, centre = c1, width = w1, wavelength = wavelength)+
                                gaussint(intensity = i2, centre = c2, width = w2, wavelength = wavelength) +
                                gaussint(intensity = i3, centre = c3, width = w3, wavelength = wavelength))
  } else if(peakNumber == 4) {
    c1 <- fixedParameters$c1
    w1 <- fixedParameters$w1/2
    c2 <- fixedParameters$c2
    w2 <- fixedParameters$w2/2
    c3 <- fixedParameters$c3
    w3 <- fixedParameters$w3/2
    c4 <- fixedParameters$c4
    w4 <- fixedParameters$w4/2
    generatedGauss <- formula(absorbance ~ gaussint(intensity = i1, centre = c1, width = w1)+
                                gaussint(intensity = i2, centre = c2, width = w2) +
                                gaussint(intensity = i3, centre = c3, width = w3) +
                                gaussint(intensity = i4, centre = c4, width = w4))
  } else{
    generatedGauss <- "If you want more than 4 peaks you can do it yourself"
  }
  generatedGauss
}
