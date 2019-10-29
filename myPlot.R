myFile <- file.path(Sys.getenv('R_SCRIPT_FOLDER_PREFIX'), 'static', 'myPlot.png')
png(filename=myFile)

hist(rnorm(300), main = Sys.time())

invisible(dev.off())
