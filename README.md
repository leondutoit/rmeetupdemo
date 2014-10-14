### r-meetup-demo

Get to know R; make a small data analysis library with [dplyr](https://github.com/hadley/dplyr); use [ggvis](https://github.com/rstudio/ggvis) with [RMarkdown](https://github.com/rstudio/rmarkdown) and [shiny](https://github.com/rstudio/shiny) to make an interactive dashboard; reorganise code into a package with [devtools]().

### What now?

* [Download](http://cran.r-project.org/) and install R on your machine
* Clone this repo
* Make sure you have a R development environment - gcc and/or clang compilers, which means XCode command line tools if you're on mac, standard stuff if you're on linux and you'll know better than me if you're on Windows (sorry)
* Install R code dependencies as follows

```
$ git clone git@github.com:leondutoit/r-meetup-demo.git
$ cd r-meetup-demo
$ chmod 755 dependencies.r
$ sudo ./dependencies.r
```

* For serving the dashboard, [download](http://www.rstudio.com/products/RStudio/) and install Rstudio IDE
* Follow the instructions in `tutorial.Rmd` from start to finish
