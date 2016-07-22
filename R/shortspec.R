#' Shorten spectra to your desired length
#'
#' I was too lazy to do this a bunch of times. Just cuts the end off, nothing fancy
#' @param spectrum a data frame or matrix containing your data
#' @param length how long you want it to end up
#' @export

shortspec <- function(spectrum, length){
  spectrum <- spectrum[1:length, ]
  spectrum
}
