#' A generator of multiple gaussian peaks
#'
#' Generates any number of gaussian peaks of indeterminate
#' @param fixedParameters A data frame containing columns named "centres" and "widths". Each row contains the parameters of one peak.
#' @param wavelength The wavelengths of the dataset you want to fit the peaks to.
#' @return A formula for the number of peaks specified by the number of rows in fixedParameters
#' @export
#' @keywords internal

#will have to use HWHM for this, which isn't so bad (not necessarily, but might implement it anyway)
#fixedParameters will now have to be a data frame
gaussgen <- function(fixedParameters, wavelengths){
  wavelength <- wavelengths
  models <- c()
  for(i in 1:nrow(fixedParameters)){
    models[i] <- paste("gaussint(i", i, ",wavelength, ", fixedParameters$centres[i], ", ", fixedParameters$widths[i], ")", sep = "")
    models
  }
  fla <- paste("absorbance~", paste(models, collapse = "+"), sep = "")
  generatedGauss <- as.formula(fla)
  generatedGauss
}
