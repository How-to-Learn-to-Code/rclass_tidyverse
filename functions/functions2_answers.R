# Functions day 2 answers

## Exercise 1

years <- c(2010,2011,2012,2013,2014,2015)

sapply(years, function(x) gsub(20, 30, x))

## Exercise 2

# Create genPrimer function
library(stringi) # Required for stri_rand_strings function

genPrimer <- function(minlen, maxlen, nprimers, bases = '[ACTG]') {
  
  lengths <- lengths1 <- sample(minlen:maxlen, nprimers,replace=TRUE)
  res <- stri_rand_strings(nprimers, lengths, bases)
  return(res)
  
}

# Create primers vector
primers <- genPrimer(20, 30, 20)

# For loop
for(primer in primers) {
  if(nchar(primer) > 19 & nchar(primer) < 25) print("primer is between 20 and 24 bases")
}

## Exercise 3 

days <- c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")

abbr <- sapply(days, function(x) 
  if(substr(x, 1, 1) == "T" | substr(x, 1, 1) == "F") {substr(x, 1, 2)} # if the first character is T or F, extract first two characters
               else {substr(x, 1, 1)} # everything else, extract first character
  )
