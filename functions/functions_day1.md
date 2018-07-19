Functions day 1
================

### Basic functions

So far we’ve used a lot of functions that already exist in R. Now you
will learn how to write your own functions. User-written functions take
the following structure:

``` r
myfunction <- function(arg1, arg2, ...) {
  
  do some stuff
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

#### Exercise 1

Write a function that converts a Farhenheit temperature to Kelvin
(remember that K = 5/9\*(F - 32) + 273.15).

#### Exercise 2

Write a function that returns the length and sum of a given vector of
numbers. How can you work around the fact that `return` can only be used
once in a function?

#### Exercise 3

The following function generates random primers. Use it to create a list
of 50 primers between 40-50 base pairs:

``` r
library(stringi) # Required for stri_rand_strings function
genPrimer <- function(minlen, maxlen, nprimers, bases = '[ACTG]') {
  
  lengths <- lengths1 <- sample(minlen:maxlen, nprimers,replace=TRUE)
  res <- list(primer = stri_rand_strings(nprimers, lengths, bases),
              length = lengths)
  return(res)
  
}
```

Then, write a function that counts the number of G’s in each of your
randomly generated primers from above, and returns three items: the
primer sequence, the primer length, and the number of G’s in that
primer.

*Hint:* Use the function `str_count` in the library `stringr` to count
the G’s.
