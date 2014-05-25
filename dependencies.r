#!/usr/bin/Rscript --vanilla

# choose a download mirror
options("repos" = "http://cran.uib.no/")

# C++ dependency
install.packages("Rcpp", type = "source")

# tools
install.packages(
  c("codetools",
    "devtools",
    "DBI",
    "RPostgreSQL",
    "RCurl",
    "httr",
    "jsonlite",
    "ggplot2",
    "scales",
    "dplyr".
    "roxygen2",
    "rjson"),
  dep = TRUE)

# viz
devtools::install_github(
  c("hadley/testthat",
    "rstudio/shiny",
    "rstudio/ggvis"))

devtools::install_github("rjstat", "ajschumacher")
