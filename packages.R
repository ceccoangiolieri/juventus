my_packages = c(
  'bupaR',
  'edeaR',
  'processmapR',
  'eventdataR',
  'readr',
  'tidyverse',
  'DiagrammeR',
  'ggplot2',
  'stringr',
  'lubridate',
  'shiny',
  'shinydashboard',
  'shinyEventLogger',
  'dplyr',
  'mongolite'
)
install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p, dependencies = TRUE)
  }
  else {
    cat(paste("Skipping already installed package:", p, "\n"))
  }
}
invisible(sapply(my_packages, install_if_missing))
