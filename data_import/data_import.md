Data Import
================

``` r
library(tidyverse)
```

    ## ── Attaching packages ──────────────────────────────────────────────────────────────────────────── tidyverse 1.2.1 ──

    ## ✔ ggplot2 2.2.1     ✔ purrr   0.2.4
    ## ✔ tibble  1.4.2     ✔ dplyr   0.7.5
    ## ✔ tidyr   0.8.1     ✔ stringr 1.3.1
    ## ✔ readr   1.1.1     ✔ forcats 0.3.0

    ## ── Conflicts ─────────────────────────────────────────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

Today we will discuss how to import raw data into R.

``` r
# Use Shift+Click to follow this link to see the raw data
tycho_link <- "https://raw.githubusercontent.com/UNC-HLC-R-Intro/lessons/import/data/import_tycho_simple.csv?token=AQdxTW69CSAGG6JPYwAYDEZ3ze4-AHWRks5bWeAAwA%3D%3D"
tycho_base <- read.csv(tycho_link)
```

``` r
tycho_base %>% head
```

    ##                   state X192801_MEASLES X192801_POLIO X192801_SMALLPOX
    ## 1               ALABAMA            3.67          0.00             0.04
    ## 2                ALASKA            0.00          0.00             0.00
    ## 3               ARIZONA            1.90          0.00             0.00
    ## 4              ARKANSAS            4.11          0.00             0.38
    ## 5            CALIFORNIA            1.38          0.17             0.34
    ## 6              COLORADO            8.38          0.39             3.06
    ## 7           CONNECTICUT            4.50          0.00             1.65
    ## 8              DELAWARE            8.58          0.00             0.00
    ## 9  DISTRICT OF COLUMBIA            0.00          0.00             0.00
    ## 10              FLORIDA            0.21          0.00             0.07
    ##    X192802_MEASLES X192802_POLIO X192802_SMALLPOX X192803_MEASLES
    ## 1             6.25          0.00             0.15            7.95
    ## 2             0.00          0.00             0.00            0.00
    ## 3             6.40          0.00             0.00            4.50
    ## 4             9.91          0.00             0.49           11.15
    ## 5             1.80          0.15             0.41            1.31
    ## 6             6.02          0.20             1.78            2.86
    ## 7             9.00          0.00             3.36            8.81
    ## 8             7.30          0.00             0.00           15.88
    ## 9             0.00          0.00             0.00            0.00
    ## 10            0.49          0.00             0.70            0.42
    ##    X192803_POLIO X192803_SMALLPOX
    ## 1           0.04             0.30
    ## 2           0.00             0.00
    ## 3           0.00             0.00
    ## 4           0.00             0.76
    ## 5           0.11             0.56
    ## 6           0.00             2.27
    ## 7           0.06             1.27
    ## 8           0.00             0.00
    ## 9           0.00             0.00
    ## 10          0.00             0.49

``` r
tycho_readr <- read_csv(tycho_link)
```

    ## Parsed with column specification:
    ## cols(
    ##   .default = col_double(),
    ##   state = col_character(),
    ##   `192840_SMALLPOX` = col_integer(),
    ##   `194033_MEASLES` = col_integer(),
    ##   `194043_POLIO` = col_integer(),
    ##   `194115_POLIO` = col_integer(),
    ##   `194116_MEASLES` = col_integer(),
    ##   `194133_MEASLES` = col_integer(),
    ##   `194133_POLIO` = col_integer(),
    ##   `194241_MEASLES` = col_integer(),
    ##   `194334_SMALLPOX` = col_integer(),
    ##   `194533_SMALLPOX` = col_integer(),
    ##   `194706_SMALLPOX` = col_integer(),
    ##   `194724_SMALLPOX` = col_integer(),
    ##   `194728_SMALLPOX` = col_integer(),
    ##   `194729_SMALLPOX` = col_integer(),
    ##   `194733_SMALLPOX` = col_integer(),
    ##   `194735_SMALLPOX` = col_integer(),
    ##   `194737_SMALLPOX` = col_integer(),
    ##   `194739_SMALLPOX` = col_integer(),
    ##   `194743_SMALLPOX` = col_integer()
    ##   # ... with 498 more columns
    ## )

    ## See spec(...) for full column specifications.

``` r
tycho_readr %>% head
```

    ## # A tibble: 10 x 10
    ##    state `192801_MEASLES` `192801_POLIO` `192801_SMALLPO… `192802_MEASLES`
    ##    <chr>            <dbl>          <dbl>            <dbl>            <dbl>
    ##  1 ALAB…             3.67           0                0.04             6.25
    ##  2 ALAS…             0              0                0                0   
    ##  3 ARIZ…             1.9            0                0                6.4 
    ##  4 ARKA…             4.11           0                0.38             9.91
    ##  5 CALI…             1.38           0.17             0.34             1.8 
    ##  6 COLO…             8.38           0.39             3.06             6.02
    ##  7 CONN…             4.5            0                1.65             9   
    ##  8 DELA…             8.58           0                0                7.3 
    ##  9 DIST…             0              0                0                0   
    ## 10 FLOR…             0.21           0                0.07             0.49
    ## # ... with 5 more variables: `192802_POLIO` <dbl>,
    ## #   `192802_SMALLPOX` <dbl>, `192803_MEASLES` <dbl>, `192803_POLIO` <dbl>,
    ## #   `192803_SMALLPOX` <dbl>

## Exercise 1: base R vs. readr

What are the differences between `tycho_base` and `tycho_readr`? - What
is the structure of the data? - Are the columns the same type? - Which
function is faster?

## Exercise 2:

  - Look at this raw data on github and import it using `readr`.
  - What happens?
  - What could be a way to fix this problem? (Don’t worry about the code
    solution yet, brainstorm with a partner)
  - Can you find a setting in `?read_csv` that might implement your
    solution(s)?

<!-- end list -->

``` r
tycho_link_2 <- "https://raw.githubusercontent.com/UNC-HLC-R-Intro/lessons/import/data/import_tycho.csv?token=AQdxTWPiN68L7-gEprtUcHGm257fEeK-ks5bWeERwA%3D%3D"
```

## Exercise 3: Regular Expressions

[Use This chapter of “R For Data Science” for
reference](http://r4ds.had.co.nz/strings.html#matching-patterns-with-regular-expressions)

Using `str_view_all` to show your results, create regular expressions
that answer the following questions:

``` r
# You might need to run this
install.packages("htmlwidgets")
```

``` r
library(stringr)
```

``` r
names <- c("Alice", "Bob", "Carol", "Dennis", "Frank", "George")
```

### Match all `names` containing the letter “N”

<!--html_preserve-->

<div id="htmlwidget-acf246606e10de899912" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-acf246606e10de899912">{"x":{"html":"<ul>\n  <li>Alice<\/li>\n  <li>Bob<\/li>\n  <li>Carol<\/li>\n  <li>De<span class='match'>n<\/span><span class='match'>n<\/span>is<\/li>\n  <li>Fra<span class='match'>n<\/span>k<\/li>\n  <li>George<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Match all names containing the letter “A”

<!--html_preserve-->

<div id="htmlwidget-465a5290c4d336c4d7dd" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-465a5290c4d336c4d7dd">{"x":{"html":"<ul>\n  <li><span class='match'>A<\/span>lice<\/li>\n  <li>Bob<\/li>\n  <li>C<span class='match'>a<\/span>rol<\/li>\n  <li>Dennis<\/li>\n  <li>Fr<span class='match'>a<\/span>nk<\/li>\n  <li>George<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Match the first letter of every name

<!--html_preserve-->

<div id="htmlwidget-9b5365d2ecb7bdbaf68a" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-9b5365d2ecb7bdbaf68a">{"x":{"html":"<ul>\n  <li><span class='match'>A<\/span>lice<\/li>\n  <li><span class='match'>B<\/span>ob<\/li>\n  <li><span class='match'>C<\/span>arol<\/li>\n  <li><span class='match'>D<\/span>ennis<\/li>\n  <li><span class='match'>F<\/span>rank<\/li>\n  <li><span class='match'>G<\/span>eorge<\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

``` r
myVector <- c(10, "twenty", 30, "fourty", "fifty", 60, "")
```

### Match all `myVector` entries that are numbers (not text)

<!--html_preserve-->

<div id="htmlwidget-21759bdb540736435a38" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-21759bdb540736435a38">{"x":{"html":"<ul>\n  <li><span class='match'>1<\/span><span class='match'>0<\/span><\/li>\n  <li>twenty<\/li>\n  <li><span class='match'>3<\/span><span class='match'>0<\/span><\/li>\n  <li>fourty<\/li>\n  <li>fifty<\/li>\n  <li><span class='match'>6<\/span><span class='match'>0<\/span><\/li>\n  <li><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

### Match all text in `myVector`

<!--html_preserve-->

<div id="htmlwidget-74fed58d6eefa2795479" class="str_view html-widget" style="width:960px;height:100%;">

</div>

<script type="application/json" data-for="htmlwidget-74fed58d6eefa2795479">{"x":{"html":"<ul>\n  <li>10<\/li>\n  <li><span class='match'>t<\/span><span class='match'>w<\/span><span class='match'>e<\/span><span class='match'>n<\/span><span class='match'>t<\/span><span class='match'>y<\/span><\/li>\n  <li>30<\/li>\n  <li><span class='match'>f<\/span><span class='match'>o<\/span><span class='match'>u<\/span><span class='match'>r<\/span><span class='match'>t<\/span><span class='match'>y<\/span><\/li>\n  <li><span class='match'>f<\/span><span class='match'>i<\/span><span class='match'>f<\/span><span class='match'>t<\/span><span class='match'>y<\/span><\/li>\n  <li>60<\/li>\n  <li><\/li>\n<\/ul>"},"evals":[],"jsHooks":[]}</script>

<!--/html_preserve-->

## Exercise 4: replacing with regular expressions

Use the `gsub` command to replace things based on regular expressions -
You can check your regex’s with `string_view_all`

### Example: Replace “Bob” for your own name

``` r
myString <- "My name is Bob"
```

``` r
myString
```

    ## [1] "My name is Bob"

``` r
gsub("Bob", "Spencer", myString)
```

    ## [1] "My name is Spencer"

### Replace all spaces for "\_"

    ## [1] "My_name_is_Bob"

### Delete all spaces

    ## [1] "MynameisBob"

# Homework

  - Finish any remaining regex examples above
  - Read and play with the example found
    [here](https://github.com/UNC-HLC-R-Intro/lessons/blob/import/data_import/data_import_cleaning_example.md)
    to see how regex’s and `tidyr` can be used to clean up a messy
    dataset
