### Outcomes

Get to know R; make a small data analysis library with [dplyr](https://github.com/hadley/dplyr); use [ggvis](https://github.com/rstudio/ggvis) with [RMarkdown](https://github.com/rstudio/rmarkdown) and [shiny](https://github.com/rstudio/shiny) to make an interactive dashboard; reorganise code into a package with [devtools](https://github.com/hadley/devtools).

### What now?

* you need [git](http://git-scm.com/downloads)
* you also need a C++ compiler (on Mac this means XCode command line tools, on windows and Linux probably Clang or a recent version of gcc)
* [download](http://cran.uib.no/) and install R (make sure you get version >= 3.1.0)
* make a workshop directory `$ mkdir rworkshop && cd rworkshop`
* clone workshop package `$ git clone https://github.com/leondutoit/rmeetupdemo.git` into this directory
* you should have a directory structure like this `rworkshop/rmeetupdemo`
* install dependencies `$ cd rmeetupdemo && chmod 755 ./dependencies.r && sudo ./dependencies.r && cd ..`
* install rmeetupdemo: `$ R -e "devtools::install('rmeetupdemo')"`
* lastly, for serving the dashboard, [download](http://www.rstudio.com/products/RStudio/) and install Rstudio IDE

### Testing your setup

You should be able to run this from the command line without failure: `$ R -e "library(dplyr); library(rmeetupdemo); library(ggvis); d <- create_immigration_df()"`. Warnings are OK.

### Tutorial

The HTML presentation used in the session can be viewed with [this link](https://dl.dropboxusercontent.com/u/104325750/tutorial.html). It is the rendered version of `rmeetupdemo/tutorial.Rmd` and includes example output from the interactive session.
