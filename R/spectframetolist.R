#' Convert a data frame of spectra to a list
#'
#' Converts a data frame with the wavelengths and recorded spectra into a list containing data frames of wavelength and recorded spectra, compatible with fitDemPeaks.
#' @param df a data frame. The first column contains the wavelengths and subsequent columns the absorbances for those wavelengths.
#' @export

spect.frametolist <- function(df){
  mat.tmp <- as.matrix(df)
  wavelength <- as.vector(mat.tmp[,1])
  mat.tmp <- mat.tmp[,2:ncol(mat.tmp)]
  tolist <- function(absorbance){
    speclist <- list()
    for(i in 1:ncol(absorbance)){
      speclist[[i]] <- data.frame(wavelength, absorbance[,i])
      speclist
      speclist[[i]] <- renameFrame(speclist[[i]])
    }
    speclist
  }
  frametolist <- tolist(mat.tmp)
  frametolist
}
