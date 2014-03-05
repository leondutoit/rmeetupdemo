#!/usr/bin/Rscript --vanilla

options("repos"="http://cran.uib.no/")
install.packages("codetools", dep = TRUE)
install.packages("devtools", dep = TRUE)
install.packages(c("DBI", "RPostgreSQL"))
install.packages("Rcpp", type = "source")
install.packages(c("ggplot2", "dplyr"), dep = TRUE)

# TODO (Leon) make this work somehow
devtools::install_github(c("hadley/testthat", "rstudio/shiny", "rstudio/ggvis"))
