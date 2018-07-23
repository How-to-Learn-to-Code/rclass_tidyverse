# Answers for functions day 1

## Exercise 1 - Fahrenheit to Kelvin
f2k <- function(fah) {
  kelvin <- (5/9)*(fah - 32) + 273.15
  return(kelvin)
}

f2k(60)

## Exercise 2 - return length and sum for any vector of numbers
v <- rnorm(50, mean = 5) # create a vector of length 50 from random samples of a normal dist. with mean 5

myFun <- function(vector) {
  length <- length(vector)
  sum <- sum(vector)
  return(list(length = length, sum = sum))
}

myFun(v)

## Exercise 3

library(stringi) # Required for stri_rand_strings function
library(stringr)

genPrimer <- function(minlen, maxlen, nprimers, bases = '[ACTG]') {

  lengths <- lengths1 <- sample(minlen:maxlen, nprimers,replace=TRUE)
  res <- stri_rand_strings(nprimers, lengths, bases)
  return(res)
  
}

# Create primer list
primers <- genPrimer(40, 50, 50)

# Create function
primerStats <- function(primerlist) {
  lengths <- nchar(primerlist)
  nG <- str_count(primerlist, "G")
  results <- data.frame(sequence = primers, length = lengths, numberG = nG)
  return(results)
}
