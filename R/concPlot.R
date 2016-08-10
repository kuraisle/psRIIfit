#' Plot fitted concentrations against the total concentration
#'
#' Plots the concentrations calculated by concConvert and exConls, adding lines for the defined concentration against the total concentration of the curve.
#' @param conctable a data frame of concentrations
#' @param concentration the specified total concentration
#' @param times the timepoints of your concentrations
#' @param plotTitle The title you want on your plot
#' @export

concPlot <- function(conctable, concentration, times, plotTitle){
  colfunc <- colorRampPalette(c("blue", "darkgreen"))
  matplot(times, conctable,
          type = "l",
          ylab = expression(paste("Concentration (", mu, "M)")),
          xlab = "Time (min)",
          main = plotTitle,
          bty = "n",
          yaxp = c(0,ceiling(concentration),ceiling(concentration)),
          ylim = c(min(conctable), ceiling(concentration)),
          col = colfunc(ncol(conctable)))
  abline(concentration, 0, lty = 3)
  conc <- c()
  for(i in 1:nrow(conctable)){
    conc[i] <- sum(conctable[i,])
  }
  lines(times, conc, col = "dimgrey")
  legend("topright", legend = c(paste(colnames(conctable)), "Total"),
         col = c(colfunc(ncol(conctable)), "dimgrey"), lty = c(1:ncol(conctable), 1))
}

