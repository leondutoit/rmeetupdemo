#!/usr/bin/Rscript --vanilla

# choose a download mirror
options("repos" = "http://cran.uib.no/")

# C++ dependency
install.packages("Rcpp", type = "source")

# tools
install.packages(
  c("codetools",
    "devtools",
    "RCurl",
    "httr",
    "jsonlite",
    "ggplot2",
    "scales",
    "dplyr",
    "roxygen2",
    "rjson",
    "magrittr"),
  type = "source",
  dep = TRUE)

# viz
devtools::install_github(
  c("hadley/testthat",
    "rstudio/shiny",
    "rstudio/ggvis",
    "ajschumacher/rjstat"))
