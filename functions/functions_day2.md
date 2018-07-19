Functions day 2
================

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

This usually is not preferred if you want to keep the output of a for
loop, because it can become inefficient. Instead, we could use a
function from the `apply` family.

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

#### Exercise 1

Use `sapply` to replace all of the 20s in `years` with 30s (think back
to `gsub` from the regex section of the data import lesson).

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

#### Exercise 2

Use `genPrimer` from functions day 1 to generate a list of 20 primers
that are between 20-30 base pairs in length.

Write a for loop that prints “primer is between 20 and 24 bases” if the
primer has 20 or more bases and 24 or fewer bases.

#### Exercise 3

Make a vector of the days of the
week:

``` r
days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")
```

Use `sapply` and an if/else statement that identifies values in `days`
as either a weekend day with the number 1 or a weekday with the number 2
(e.g. the output vector produced should start with 1, 2, 2…).
