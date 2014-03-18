
### Let's webapp

Outline
* R ABCs
* Functional goodies
* Exploring the data
* Package development
* Webapp time

#### R ABCs

Before we begin two things: 1) R indexes start from 1 not 0. I _think_ the reason is that the core data structure is a vector (as in the algebraic concept) which does not have an index 0; 2) idiomatic assignment is done with the `<-` operator.

Creating data structures: vector, matrix, list, dataframe.

```r
# vector (homogenous)
> vec <- c(1, 2, 3)
> vec
[1] 1 2 3
> str(vec)
 num [1:3] 1 2 3

# matrix (homogenous, I very seldom use them explicitly)
> m <- matrix(1:6, ncol = 3, nrow = 2)
> m
     [,1] [,2] [,3]
[1,]    1    3    5
[2,]    2    4    6

# lists (heterogenuous, often used)
> li <- list(elem1 = 1, elem2 = c(1, 2, 3))
> li
$elem1
[1] 1

$elem2
[1] 1 2 3

> str(li)
List of 2
 $ elem1: num 1
 $ elem2: num [1:3] 1 2 3

# dateframe (the workhorse tabular data structure)
# think of it as a list of equal length named vectors
> dat <- data.frame(x = 1:5, y = c('leon', 'charl', 'du', 'toit', 'ble'))
> dat
  x     y
1 1  leon
2 2 charl
3 3    du
4 4  toit
5 5   ble

> str(dat)
'data.frame':   5 obs. of  2 variables:
 $ x: int  1 2 3 4 5
 $ y: Factor w/ 5 levels "ble","charl",..: 4 2 3 5 1
```

Subsetting and indexing into data structures. There are two types of subsetting: 1) preserving which returns a subset of the data structure as the same class and 2) simplifying, which returns a subset as a class of what that element is. Let's make it concrete. Preserving looks like `[]` while simplifying looks like `[[]]` or `$`.

```r
# we now have some objects in the environment
# let's have a look what they are
> ls()
[1] "dat"  "li"   "m"    "vec"  "vec1"

# a vector is atomic - no simplification possible
> vec[1]
[1] 1

> class(vec[1])
[1] "numeric"

# matrices are vectors with a dimension attribute - attributes are metadata
> attributes(m)
$dim
[1] 2 3

# or
> dim(m)
[1] 2 3

# lists are not atomic and can be subsetted with simplification
> li[1]
$elem1
[1] 1

> li[[1]]
[1] 1

> class(li[1])
[1] "list"

> class(li[[1]])
[1] "numeric"

# the same goes for dataframes
> dat[1]
  x
1 1
2 2
3 3
4 4
5 5
> dat[[1]]
[1] 1 2 3 4 5

> class(dat[1])
[1] "data.frame"

> class(dat[[1]])
[1] "integer"

# other attributes of dataframes
> names(dat)
[1] "x" "y"
> dim(dat)
[1] 5 2

# the `$` operator is a shorthand for `[[]]` with fuzzy matching
> dat$mynewcol <- rep(5, 5)
> dat
  x     y mynewcol
1 1  leon        5
2 2 charl        5
3 3    du        5
4 4  toit        5
5 5   ble        5

> dat$my
[1] 5 5 5 5 5

# One of the biggest gotchas...
# when passing a dataframe into a function
# and using column names for access I always use `[[]]`
# this is why

> col <- "mynewcol"
> dat[[col]]
[1] 5 5 5 5 5
> dat$col
NULL

```

#### Functional goodies

```r

vectorised
unlist(Map(function(x) { 10 * x }, 1:10)) ~ 10 * 1:10

lambdas
first class functions
HFOs:
Reduce(sum, Map(function(x) { x*x }, Filter(Negate(function(x) {x %% 2 == 0}), 1:100)))
sapply
iffys

```

#### Exploring the data


#### Package development


#### Webapp time

