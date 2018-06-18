Functions Part 1
================
Amy Pomeroy & Dayne Filer; Modified by Grace Di Cecco
May 29, 2018

### Using this document

-   Code blocks and R code have a grey background (note, code nested in the text is not highlighted in the pdf version of this document but is a different font).
-   \# indicates a comment, and anything after a comment will not be evaluated in R
-   The comments beginning with \#\# under the code in the grey code boxes are the output from the code directly above; any comments added by us will start with a single \#
-   While you can copy and paste code into R, you will learn faster if you type out the commands yourself.
-   Do exercises as you read through the document to check your comprehension.
-   Read through the document after class. This is meant to be a reference, and ideally, you should be able to understand every line of code. If there is something you do not understand please email us with questions or ask in the following class (you're probably not the only one with the same question!).

### Expectations

1.  Write and run a basic function in R
2.  Understand function environments and how functions find things
3.  Understand the "do not repeat yourself" (DRY) principle

### Basic functions

So far we've used a lot of functions that already exist in R. Now you will learn how to write your own functions. User-written functions take the following structure:

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
## [1] 9
```

A function that only returns the given value is not useful, but it does illustrate how you can add functions to your environment. Now make a function that squares a value and then adds one to it.

``` r
second_function <- function(x) {

  ans <- x^2 + 1
  return(ans)
  
}
second_function(9)
## [1] 82
```

*Exercise 1*

Write a function that returns the length and sum of a vector of numbers.

*Hint:* Use the `list` function within the `return` function to output more than one object.

### The function environment

An environment is a place to store variables. As we discussed in class 1, when you make assignments in R, they are generally added as entries to the global environment.

Functions are evaluated in their own environments. When a function is called a new environment is created. This new environment is called the evaluation environment. Functions also have an enclosing environment, which is the environment where the function was defined. For a functions defined in the workspace the enclosing environment is the global envrionment.

When a function is evaluated, R looks through a series of environments for variables called. It first searches the evaluation environment and then the enclosing environment. This means that a global variable can be referenced inside a function. This principle is shown below by `third_function` which sums the argument `x` with the variable `a` from the global environment.

``` r
a <- 9
third_function <- function(x) { x + a }
third_function(11)
## [1] 20
```

The evaluation environment is populated with local variables as the evaluation of the function procedes. Once the function completes running, the evaluation environment is destroyed. Look at `second_function` for example. Within the function the variable `ans` is assigned. However, when you evaluate the function the `ans` variable is not available the global environment because it was assigned in the evaluation environment, and the evaluation environment was destroyed after the function completed.

``` r
second_function(9)
## [1] 82
ls() # use the help documentation to see what this function does
## [1] "a"               "first_function"  "second_function" "third_function"
```

As you can see, listing objects in the global environment only returns the global variable `a` assigned previously and the three functions that you have defined so far.

*Exercise 2*

Write a function that solves the quadratic formula. Recall, given:
*a**x*<sup>2</sup> + *b**x* + *c* = 0
 The quadratic equation is:
$$x = \\frac{-b\\pm\\sqrt{b^2-4ac}}{2a}$$
 Use it to solve the following equations.
*x*<sup>2</sup> + *x* − 4 = 0
*x*<sup>2</sup> − 3*x* − 4 = 0
6*x*<sup>2</sup> + 11*x* − 35 = 0

### DRY principle

The don't repeat yourself (DRY) principle states that

> every piece of knowledge must have a single, unambigous, authorative representation within a system - Dave Thomas and Andy Hunt.

There is a lot to think about when using the DRY principle, like not repeating variable names throughout your code. The DRY principle is particularly useful when thinking about functional programming. If you find yourself writing the same code more than once, or copying and pasting, consider writing a function. Consider the following code to generate a list of random primers:

``` r
library(stringi)
lengths1 <- sample(15:35, 25,replace=TRUE)
primers1 <- list(primer = stri_rand_strings(25, lengths1, '[ACTG]'),
                 length = lengths1)
lengths2 <- sample(20:40, 25,replace=TRUE)
primers2 <- list(primer = stri_rand_strings(25, lengths1, '[ACTG]'),
                 length = lengths1)
```

Now imagine you have to create 100 primer lists. After you fininsh you realize you need to change the list of possible primer lengths. If you wrote code like above you would have to edit each line. However, you may see how the code above could be functionalized. Consider what may be variable in the code above, and create a function parameter for each variable part of the code. You may wish to change the minimum primer length, the maximum primer length, the number of primers in each list, and even the possible bases.

``` r
## Create a function to create primer lists. 
genPrimer <- function(minlen, maxlen, nprimers, bases = '[ACTG]') {
  
  lengths <- lengths1 <- sample(minlen:maxlen, nprimers,replace=TRUE)
  res <- list(primer = stri_rand_strings(nprimers, lengths, bases),
              length = lengths)
  return(res)
  
}
primers1 <- genPrimer(minlen = 15, maxlen = 35, nprimers = 25)
primers2 <- genPrimer(minlen = 20, maxlen = 40, nprimers = 25)
```

Notice two things: (1) now any change needed in the primer generation only requires the code to change in one place -- greatly reducing the amount of work, and more importantly, the change for error; (2) notice how 'bases' is defined in the function with a default value. You can probably imagine how many functions benefit from default parameter values. For the `genPrimer` function above you will most often only generate sequences with nucelotides found in DNA, so it makes sense to provide a default value for the bases. Almost all of the functions you will use in R run with default values that you may or may not be aware of.

*Exercise 3*

Write a function that counts the number of G's in each of your randomly generated primers from above, and returns a list with three columns: the primer sequence, the primer length, and the number of G's in that primer.

*Hint:* Use the function `str_count` in the library `stringr` to count the G's.

### Function control statements

So far we have only discussed one aspect of function control statments: the `return` function. The `return` function can actually go anywhere in the function, and a function can have multiple `return` functions. For example consider a function that returns "big number" for numbers greater than or equal to 100 and "small number" for numbers under less than 100:

``` r
xmpl_func <- function(x) {
  
  if (x >= 100) {
    return("big number")
  } 
  
  return("small number")
  
}
xmpl_func(1)
## [1] "small number"
xmpl_func(1e10)
## [1] "big number"
xmpl_func("see what happens")
## [1] "big number"
```

When a function encounters the `return` function the returns the value and halts any execution. The other two functions worth knowing are: `stop` and `warning`. The `stop` and `warning` functions allow you to do tests within the function and exit the function (`stop`) if necessary, or issue a warning (`warning`).

In the `xmpl_func("see what happens")` example, the function returned `TRUE`. (Recall from class 1 that both would be converted to character in the if statement, which is why the code did not error.) However, you may wish to make sure the input to `xmpl_func` is numeric and has a length of 1. Modify `xmpl_func` to test the input.

``` r
xmpl_func <- function(x) {
  
  ## Test the length of x
  if (length(x) > 1) stop("'x' must be of length 1.")
  
  ## Test the class of x
  if (!is.numeric(x)) stop("'x' must be numeric.")
  
  if (x >= 100) {
    return("big number")
  } 
  
  return("small number")
  
}
xmpl_func("see what happens")
## Error in xmpl_func("see what happens"): 'x' must be numeric.
xmpl_func(1:10)
## Error in xmpl_func(1:10): 'x' must be of length 1.
```

Finally, you may wish to issue a warning if the input can be converted to numeric instead of an error:

``` r
xmpl_func <- function(x) {
  
  ## Test the length of x
  if (length(x) > 1) stop("'x' must be of length 1.")
  
  if (is.logical(x)) {
    x <- as.numeric(x)
    warning("'x' was converted from logical to numeric.")
  }
  
  if (!is.numeric(x)) stop("'x' could not be converted to numeric.")
  
  if (x >= 100) {
    return("big number")
  } 
  
  return("small number")
  
}
xmpl_func("see what happens")
## Error in xmpl_func("see what happens"): 'x' could not be converted to numeric.
xmpl_func(TRUE)
## Warning in xmpl_func(TRUE): 'x' was converted from logical to numeric.
## [1] "small number"
```

Notice the function completed when the input was logical. The `warning` function does not halt execution, but does print a warning message for the user.

*Exercise 4*

Add the necessary checks for input length and class to the quadratic formula function from exercise 2.
