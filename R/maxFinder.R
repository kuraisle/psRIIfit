#'Find the local maxima for the most representative spectrum
#'
#'Takes the local maxima of peak ranges for a dataset (e.g. timepoints) or a list thereof and the intensities of those peaks fitted to the dataset and finds the most representative maximum.
#'@param peakList A list of local maxima from \code{\link[psRIIfit]{findAllPeaks}}
#'@param fitList A list of intensity fits from \code{\link[psRIIfit]{fitDemPeaks}}.
#'@export

maxFinder <- function(peakList, fitList){
  theMax <- matrix(nrow = length(peakList), ncol = ncol(peakList[[1]]))
  for(i in 1:length(peakList)){
    for(j in 1:ncol(peakList[[1]])){
      theMax[i,j] <- peakList[[i]][which.max(fitList[[i]][,j]),j]
      theMax
    }
    theMax
  }
  theMax
}
