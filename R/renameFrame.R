#' Rename data frames to be compatible with fitDemPeaks
#'
#' This renames two columns of a data frame to "wavelength" and "absorbance"
#' @export

renameFrame <- function(df){
  names(df) <- c("wavelength", "absorbance")
  df <- df
}
