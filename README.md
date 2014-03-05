### r-meetup-demo

making a webapp in R with dplyr, ggvis and shiny


### get going

#### option 1 - your own machine

[Download](http://cran.r-project.org/) and install R on your machine.
Clone this repo `git clone git@github.com:leondutoit/r-meetup-demo.git`.
Make sure you have a R development environment - gcc and/or clang compilers, which means XCode command line tools if you're on mac, standard stuff if you're on linux and you'll know better than me if you're on Windows (sorry).
Then install dependencies:
```
$ cd r-meetup-demo
$ chmod 755 dependencies.r
$ sudo ./dependencies.r
```

#### option 2 - vagrant virtual machine

Clone this repo `git clone git@github.com:leondutoit/data-centric-programming.git`.
Follow the instructions, get vagrant on your machine.
Then `cd data-centric-programming`, `git clone git@github.com:leondutoit/r-meetup-demo.git` and `vagrant up`.
Everything should _just_ _work_.
Then `vagrant ssh`.
