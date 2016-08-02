#' Rename data frames to be compatible with fitDemPeaks
#'
#' This renames two columns of a data frame to "wavelength" and "absorbance"
#' @param df a dataframe in which the first column contains wavelength and the second absorbance
#' @export
#' @keywords internal

renameFrame <- function(df){
  names(df) <- c("wavelength", "absorbance")
  df <- df
}
