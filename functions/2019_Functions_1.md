Functions, for loops, and if/else constructs
================
Jamshaid Shahir
June 17, 2019

### Basic functions

So far we’ve been using a lot of functions that exist within R. Now
we’ll learn how to build our own function.

``` r
myfunction <- function(arg1, arg2, ...) {
  
  #do some stuff
  return(object)
  
}
```

Make a simple function that just returns the argument that it is given.

``` r
first_function <- function (x) {
  
  return(x)
  
}
```

Now if you pass a value to `first_function` it should return that value:

``` r
first_function(9)
```

    ## [1] 9

A function that only returns the given value is not useful, but it does
illustrate how you can add functions to your environment. Now make a
function that squares a value and then adds one to it.

``` r
second_function <- function(x) {
  ans <- x^2 + 1
  return(ans)
  
}
second_function(9)
```

    ## [1] 82

### Exercise 1

Suppose we wanted to look at the Gapminder dataset and calculate GDP.
Write a function to do that, returning the dataset with the new GDP
column

### Exercise 2

Write a function that converts a Farhenheit temperature to Kelvin
(remember that K = 5/9\*(F - 32) + 273.15).

### For loops

For loops are used to iterate through elements in a vector, repeating
the same block of code each time. They take the basic form:

``` r
for(i in vector) {
  Do some operation to each element of the vector
}
```

Example:

``` r
for (year in c(2010,2011,2012,2013,2014,2015)){
  print(paste("The year is", year))
}
```

    ## [1] "The year is 2010"
    ## [1] "The year is 2011"
    ## [1] "The year is 2012"
    ## [1] "The year is 2013"
    ## [1] "The year is 2014"
    ## [1] "The year is 2015"

We can also store the output of the code block evaluated in each
iteration of the for loop:

``` r
output <- c() # create an empty vector
for (year in c(2010,2011,2012,2013,2014,2015)){
  output <- c(output, paste("The year is", year)) # add to the empty vector each iteration
}
output
```

    ## [1] "The year is 2010" "The year is 2011" "The year is 2012"
    ## [4] "The year is 2013" "The year is 2014" "The year is 2015"

We can also do this another way by iterating through the indices with
the `length` function. This is rather common in more traditional
programming languages, such as MATLAB, C++, and Java.

``` r
output <- c() # create an empty vector
years <- c(2010,2011,2012,2013,2014,2015)
for (i in 1:length(years)){
  output[i] <- years[i] # add to the empty vector each iteration
}
output
```

    ## [1] 2010 2011 2012 2013 2014 2015

### Exercise 3

Use a for loop to print out all the countries in the Americas from
Gapminder (hint: use `filter` to just extract the American countries;
also, how can you avoid repeats?)

This usually is not preferred if you want to keep the output of a for
loop, because it can become inefficient. Instead, we could use a
function from the `apply` family.

The levels tacked on make our output a little hard to read. We can
suppress those by using the following function: `as.character`

``` r
head(as.character(gapminder$continent))
```

    ## [1] "Asia" "Asia" "Asia" "Asia" "Asia" "Asia"

## For loop exercise

Use the following vector `years` and the function `printYear` inside a
for loop to print a new line for each year in `years`.

``` r
years <- c(2010,2011,2012,2013,2014,2015)

printYear <- function(year) {
  paste("The year is", year)
}
```

### If/else statements

In R, you create an if/else statement with the following syntax:

``` r
if (logical statment) { do something } else  { do something different } 
```

For example:

``` r
if (1 > 2) { print("TRUE") } else { print("FALSE") }
```

    ## [1] "FALSE"

Not all if/else statements have to have an `else` clause. By default, if
no `else` statement is given R does nothing.

``` r
x <- 1000
if (x > 100) print("'x' is greater than 100")
```

    ## [1] "'x' is greater than 100"

If/else statements can also be nested:

``` r
y <- 25
if (y < 100) {
  if (y > 10) {
    print("10 < y < 100")
  } else {
    print("y < 10 or y > 100")
  }
} else {
  print("y < 10 or y > 100")
}
```

    ## [1] "10 < y < 100"

### Exercise 5

Without using `filter`, loop through the entire Gapminder dataset, and
just print out countries in the American continent. For simplicity and
to avoid repeats, just use data from the year 2002: `gap2002 =
filter(gapminder, year==2002)`

### Bonus

Write a function that takes as input a gapminder dataset from 2002 and a
specified continent, and prints out the list of countrys

### Apply family functions

Apply family functions similarly perform operations iteratively on
slices of data (rows in a matrix, elements in a list). For many
operations, the apply family can be more efficient than a for loop. You
can read on about apply functions at [Data
Camp](https://www.datacamp.com/community/tutorials/r-tutorial-apply-family#family).

We can use `sapply`, which applies a function over a list or vector and
returns the output as a vector, to get output as the above for loop:

``` r
years <- c(2010,2011,2012,2013,2014,2015)
sapply(years, function(x) paste("The year is", x))
```

    ## [1] "The year is 2010" "The year is 2011" "The year is 2012"
    ## [4] "The year is 2013" "The year is 2014" "The year is 2015"

We can use `lapply`, which applies a function over a list or vector and
returns the output as a list.

``` r
years <- c(2010,2011,2012,2013,2014,2015)
lapply(years, function(x) paste("The year is", x))
```

    ## [[1]]
    ## [1] "The year is 2010"
    ## 
    ## [[2]]
    ## [1] "The year is 2011"
    ## 
    ## [[3]]
    ## [1] "The year is 2012"
    ## 
    ## [[4]]
    ## [1] "The year is 2013"
    ## 
    ## [[5]]
    ## [1] "The year is 2014"
    ## 
    ## [[6]]
    ## [1] "The year is 2015"

### Exercise 4

Repeat the prior exercise using `sapply` and `lapply`
