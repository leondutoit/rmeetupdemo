### r-meetup-demo

Making a webapp in R with [dplyr](https://github.com/hadley/dplyr), [ggvis](https://github.com/rstudio/ggvis) and [shiny](https://github.com/rstudio/shiny).


#### Option 1

* [Download](http://cran.r-project.org/) and install R on your machine
* Clone this repo
* Make sure you have a R development environment - gcc and/or clang compilers, which means XCode command line tools if you're on mac, standard stuff if you're on linux and you'll know better than me if you're on Windows (sorry)
* Then install dependencies

```
$ git clone git@github.com:leondutoit/r-meetup-demo.git
$ cd r-meetup-demo
$ chmod 755 dependencies.r
$ sudo ./dependencies.r
```

#### Option 2

* Clone [another repo](https://github.com/leondutoit/data-centric-programming) that will give you a vagrant VM
* Follow the instructions in that README and get vagrant on your machine
* Then clone this repo into that repo, buil the VM and login
* Everything should _just_ _work_ then :)

```
$ git clone git@github.com:leondutoit/data-centric-programming.git
$ cd data-centric-programming
$ git clone git@github.com:leondutoit/r-meetup-demo.git
$ vagrant up
$ vagrant ssh
```
