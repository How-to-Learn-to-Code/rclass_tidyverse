Intro to dplyr
================
Grace Di Cecco
June 5, 2018

### Using this document

-   Code blocks and R code have a grey background (note, code nested in the text is not highlighted in the pdf version of this document but is a different font).
-   \# indicates a comment, and anything after a comment will not be evaluated in R
-   The comments beginning with \#\# under the code in the grey code boxes are the output from the code directly above; any comments added by us will start with a single \#
-   While you can copy and paste code into R, you will learn faster if you type out the commands yourself.
-   Read through the document after class. This is meant to be a reference, and ideally, you should be able to understand every line of code. If there is something you do not understand please email us with questions or ask in the following class (you're probably not the only one with the same question!).

### Expectations

1.  Understand what pipes are and how to use them
2.  Know how to use common functions for data analysis from `dplyr`
3.  Apply `dplyr` and `ggplot` skills to conduct exploratory data analysis of a provided dataset

### Breeding Bird Survey

For this lesson, we'll be using a dataset that comes from the Breeding Bird Survey. The BBS is a long-term population monitoring program for birds in North America run in partnership between the US Geological Survey and the Canadian Wildlife Service. It began in 1966 and now consists of over 4000 annual surveys (called "routes", which each consist of 50 point counts) across the US and Canada. The data are freely available online, and today we will make use of a subset of the data consisting of all observations in North Carolina from 2000 to 2017.

![](HLC_intro_to_dplyr_files/figure-markdown_github/nc%20map-1.png)

Read in two data tables: one called `counts` containing the observations, and one called `species` containing common names of species. Species are coded in `counts` by a 4-digit identification code (the variable `aou` - these unique codes were created by the American Ornithologists' Union), and `species` links `aou` to the common name of the species.

``` r
counts <- read.csv("https://raw.githubusercontent.com/gdicecco/HLC-data-public/master/bbs_nc_2000-2017.csv", 
                   stringsAsFactors = F)
species <- read.csv("https://raw.githubusercontent.com/gdicecco/HLC-data-public/master/bbs_species_20170712.csv",
                    stringsAsFactors = F)
```

Use `head` to look at the two data tables. You'll notice that `counts` contains numerical codes for country, state, route, and a variable called `stateroute`, which is a combination of the state number and route number and is a unique identifier for each route. There are also columns for year, species (`aou`), the total number of point counts out of 50 the species was observed at (`stoptotal`), and the total number of individuals observed (`speciestotal`).

### Using dplyr for data analysis

`dplyr` is another package in the tidyverse that contains functions useful for managing, subsetting, and manipulating data. Many of the functions in `dplyr` can cleanly replace base R operations such as subsetting and some `apply` family functions. `dplyr` loads with the tidyverse:

``` r
library(tidyverse)
## Warning: package 'tidyverse' was built under R version 3.4.2
## -- Attaching packages ----------------------------------------------------------------------------------------- tidyverse 1.2.1 --
## v tibble  1.3.4     v purrr   0.2.4
## v tidyr   0.7.2     v stringr 1.2.0
## v readr   1.1.1     v forcats 0.2.0
## Warning: package 'tidyr' was built under R version 3.4.2
## Warning: package 'readr' was built under R version 3.4.2
## Warning: package 'purrr' was built under R version 3.4.2
## Warning: package 'forcats' was built under R version 3.4.2
## -- Conflicts -------------------------------------------------------------------------------------------- tidyverse_conflicts() --
## x dplyr::filter() masks stats::filter()
## x dplyr::lag()    masks stats::lag()
## x purrr::map()    masks maps::map()
```

We'll now look at a few workhorse functions from `dplyr`:

#### Select

`select` simply selects columns from a dataset and outputs those columns in tibble form:

``` r
commonnames <- select(species, # first argument is your data
                      english_common_name, # followed by column names to select
                      french_common_name) 
head(commonnames)
##            english_common_name           french_common_name
## 1 Black-bellied Whistling-Duck    Dendrocygne à ventre noir
## 2       Fulvous Whistling-Duck            Dendrocygne fauve
## 3  Greater White-fronted Goose                   Oie rieuse
## 4                Emperor Goose                 Oie empereur
## 5                   Snow Goose               Oie des neiges
## 6      (Blue Goose) Snow Goose Oie des neiges (forme bleue)
```

#### Filter

Recall this function from the lesson on plotting. `filter` is similar to the base function `subset`. The first argument is the data, and then one or more criteria to filter by, using `==` or other logical operators. Additionally, you can filter by multiple criteria in the same line. Separating criteria with a comma operates like using `&`.

``` r
counts2002 <- filter(counts, year == 2002)

counts2010 <- filter(counts, year == 2010 | year == 2015)

woodwarblers <- filter(species, sporder == "Passeriformes", family == "Parulidae")
```

A useful operator to know about when filtering data is `%in%`, which returns a logical vector identifying if an element belongs to a vector.

``` r
# using the woodwarblers table from above:
sppwarblers <- species$aou %in% woodwarblers$aou 
# returns a logical vector showing which values from the first vector are in the second

# filter the species table by just species seen in our North Carolina dataset
ncSpecies <- filter(species, aou %in% counts$aou)
```

#### Mutate

`mutate` adds new variables to a data table by evaulating expressions. Below, we create a new column that is the log abundance of each species at each route/year.

``` r
logcounts <- mutate(counts, logN = log(speciestotal))
```

*Exercise 1*

The variable `stateroute` in `counts` was created by a mutation of `statenum` and `route`. Replicate that mutation to create a new variable called `stateroute2`.

#### Joins

Joining data is a way to merge datasets by common variables. `dplyr` contains functions for a number of different joins. For now, we'll just look at left joins, but the others are fairly self-explanatory once you understand one. `left_join` accepts two tables, `x` and `y`, and a character vector of variables to join by. `left_join` keeps all the rows from `x`, and all columns from `x` and `y`.

``` r
countsSpecies <- left_join(counts, species, by = "aou")
```

*Exercise 2*

Read the help documentation for joins in `dplyr` (use `?left_join`). What different types of joins can be supported? What do you predict would be the outcome of `semi_join(species, counts)`? Try it and find out (use `head` to compare the result of the join and the original `species` table).

#### Group\_by

`group_by` will group a dataset by one or more variables. This doesn't change how the data looks, but changes how the data interacts with other `dplyr` functions and is useful for doing subsequent manipulation of the data, which will become apparent in the next section and the section on piping.

``` r
groupedSpp <- group_by(species, sporder)
```

#### Summarize

`summarize` reduces multiple values to a single value. It is typically used on data that have already been grouped. The output will be one row for each group. The arguments are the data, followed by a summary function.

``` r
nSpp <- summarize(groupedSpp, total = n()) # this summary tells us how many species we have per order
head(nSpp)
## # A tibble: 6 x 2
##            sporder total
##              <chr> <int>
## 1  Accipitriformes    28
## 2     Anseriformes    52
## 3      Apodiformes    21
## 4 Caprimulgiformes    10
## 5   Cathartiformes     3
## 6  Charadriiformes   108
```

*Exercise 3*

For each year in `counts`, use `group_by` and `summarize` to find out how many routes were surveyed and the mean number of individuals observed across all routes.

Hint: To get the number of routes surveyed per year from counts, group by year and then use `length(unique(stateroute))` to summarize. `unique` returns the unique values in a vector (in this case, unique values of `stateroute` for each year), and `length` returns the length of a vector (here, the length of the vector of unique `stateroute` values, telling us how many unique `stateroute` values there are each year in `counts`).

``` r
countsByYears <- group_by(counts, year)
nroutes <- summarize(countsByYears, nroutes = length(unique(stateroute)))
```

### Pipes in R

The pipe operator, `%>%`, is originally from the package `magrittr`, which is a dependency of dplyr. So, loading the tidyverse will allow you to make use of this operator as well. Pipes take the output of one function and pass it to another function. Pipes eliminate common issues that arise when dealing with data in R and allow you to seamlessly connect `dplyr` operations.

We want to find out the number of species per order in North Carolina. We've done all the individual steps to get this information above, but we've had to save a new table each time. With piping, we can do all the steps at once and produce one output file:

``` r
# Without piping
ncSpecies <- filter(species, aou %in% counts$aou)
groupedNC <- group_by(ncSpecies, sporder)
nSppNC <- summarize(groupedNC, total = n())

# With piping 
ncOrders <- species %>%
  filter(aou %in% counts$aou) %>%
  group_by(sporder) %>%
  summarize(total = n())
```

Note that we no longer had to enter the first argument (the dataset) for the `dplyr` functions. It is inferred by `dplyr` that the output from each step is piped to the new function as the input data.

Using pipes cleaned up our environment by eliminating all those intermediate outputs, and the workflow is easy to read and understand quickly.

A good rule of thumb to follow: if you are saving the same variable with minor modifications sequentially (e.g. `df1`,`df2`, `df.subset`), you can probably pipe those lines together.

*Exercise 4*

Use pipes to do the following operation, producing just one output table:

For the year 2000, determine which three species (give their English common names) occur on the most routes across North Carolina.

Hint: to reorder the rows of your table by a variable, look at the help documentation for `arrange` from `dplyr`.

*Exercise 5*

For this exercise, you will go through a short analysis and workflow using BBS data. BBS observers record the weather conditions during their observations, since many birds are less active on days that are rainy or windy. Observations that meet survey quality standards are considered more reliable than those that don't. The BBS provides a weather dataset that contains data about whether observations (combinations of route and year) meet their quality standards.

Read in the weather table, found in the lesson repo.

``` r
weather <- read.csv("https://raw.githubusercontent.com/gdicecco/HLC-data-public/master/bbs_weather_20170712.csv",
                    stringsAsFactors = F)
```

Create a new column in `weather` for `stateroute`, so the observations can be matched to observations in `counts`. The quality standards variable is called `runtype` in `weather` (`runtype` = 1 indicates a good quality observation). Filter `weather` to remove observations that don't meet the BBS quality standards and are within the time window of 2000 - 2017. Use that table to remove unreliable observations from `counts`.

Recall (or refer back to) the previous lesson on `ggplot`, and make the following plots to explore the BBS data for North Carolina with your filtered `counts` data:

1.  Create a line plot of the total number of individual birds observed per year across North Carolina
2.  First, determine how many species and how many total individuals were observed at each route each year. Then, create a scatterplot showing how the number of species observed is related to the number of individuals (number of species vs. number of individuals), where each point is a unique observation of route/year.
