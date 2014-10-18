### Outcomes

Get to know R; make a small data analysis library with [dplyr](https://github.com/hadley/dplyr); use [ggvis](https://github.com/rstudio/ggvis) with [RMarkdown](https://github.com/rstudio/rmarkdown) and [shiny](https://github.com/rstudio/shiny) to make an interactive dashboard; reorganise code into a package with [devtools](https://github.com/hadley/devtools).

### What now?

* you need [git](http://git-scm.com/downloads)
* you also need a C++ compiler (on Mac this means XCode command line tools, on windows and Linux probably Clang or a recent version of gcc)
* [download](http://cran.uib.no/) and install R 
* make a workshop directory `$ mkdir rworkshop && cd rworkshop`
* clone workshop package `$ git clone git@github.com:leondutoit/rmeetupdemo.git`
* you should have a directory structure like this `rworkshop/rmeetupdemo`
* install dependencies `$ cd rmeetupdemo && chmod 755 ./rmeetupdemo/dependencies.R && sudo ./dependencies.R && cd ..`
* start R repl (use either Rconsole, Rstudio if you already do, or terminal) - if you use terminal just type `$ R`
* install rmeetupdemo `devtools::install('rmeetupdemo')`
* For serving the dashboard, [download](http://www.rstudio.com/products/RStudio/) and install Rstudio IDE
