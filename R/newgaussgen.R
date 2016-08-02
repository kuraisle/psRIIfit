#'
#'
#'


#will have to use HWHM for this, which isn't so bad (not necessarily, but might implememnt it anyway)
#fixedParameters will now have to be a data frame
newgaussgen <- function(fixedParameters, wavelengths){
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
