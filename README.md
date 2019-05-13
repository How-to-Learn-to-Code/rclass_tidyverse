# Introduction to R Lessons
## Spencer Nystrom & Jamshaid Shahir

### 2019 Plan:
8 days, 1.5 hr each.

Need students to use `?` function to read documentation for how things work.

**before class** students will create github account to access lessons & login to rstudio cloud.
 - **note:** tell students they will need their login for class so be sure to have passwords & usernames on hand

#### Part1: Data analysis
  - Intro (Day 1)
    - Rstudio.cloud
    - `install.packages("tidyverse")`
    - Rstudio interface
      - configure project settings (no save environment, move console?)
    - data.frame & ggplot intro
      - View(df), str(df), df$variable
    
  - Plotting (Day 2)
    - assigning plots to variables with `<-`
    - adding to plots with `p + ggtitle('test')`
    - non-transforming plots
    - aesthetic mappings (fill vs color, alpha, linetype, shape)
    - facets
    - xlab/ylab/ggtitle/labs(tag = "A")
    
  - Data Manipulation (Day 3)
    - plots are good, but sometimes we want numbers out too
    - dplyr + pipes
    - `filter`, `mutate`, `select`
    - `group_by`, `summarize`
   
  **Can we combine data import & tidying?** 
  - Data import & Export (Day 4)
    - readr::read_csv, readr::write_csv
    
  - Alternative: Tidy data (Day 4)
    - melting/reshaping so data works better with dplyr/ggplot
    - emphasize to students that most of their real data can be reformatted into a "tidy" structure
    - we can use dplyr/tidyr/reshape2 functions to clean data so you can use R instead of excel

### Part 2: Programing
Now that students feel comfortable in R environment we'll dig into programming a bit more

  - functions? (Day 5)
  - if-else (Day 6)
  - loops (Day 7)
  - (Day 8)




### 2018 Schedule:
|Day | Subject | Homework |
|:--:|:---:|:------------:|
|1  |intro | [Homework 1](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/class_introduction/Homework1.Rmd) |
|2 & 3  |plotting (& factors) | [Homework 2](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/intro_to_ggplot/HLC_intro_to_ggplot.md) |
|4 & 5  |dplyr & pipes |[Homework 3](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/intro_to_dplyr/HLC_intro_to_dplyr.md) |
|6  |reshaping data |[Exercise 1](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/reshaping_data/tidy_data_exercises_day1.md)|
|7  |reshaping data 2|[Exercise 2](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/reshaping_data/tidy_data_exercises_day2.md)|
|8  |data import & cleaning |[Exercise](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/data_import/data_import.md)|
|9  |functions I |[Exercise 1](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/functions/functions_day1.md)|
|10  |functions II |[Exercise 2](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/functions/functions_day2.md)|
|11 - 12 | Final Project |[Final Project](https://github.com/UNC-HLC-R-Intro/lessons/blob/master/mouse_project/project.md)|
