assignment_b1
================
HaoxiangLei
2022-10-30

## Exercise 1: Make a Function

``` r
library(datateachr)
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
    ## ✔ readr   2.1.2      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(testthat)
```

    ## 
    ## Attaching package: 'testthat'
    ## 
    ## The following object is masked from 'package:dplyr':
    ## 
    ##     matches
    ## 
    ## The following object is masked from 'package:purrr':
    ## 
    ##     is_null
    ## 
    ## The following objects are masked from 'package:readr':
    ## 
    ##     edition_get, local_edition
    ## 
    ## The following object is masked from 'package:tidyr':
    ## 
    ##     matches

``` r
library(dplyr)
library(digest)
```

## Exercise 1: Make a Function

``` r
pick_n_smallest <- function(data, col_label, n){
  data <- arrange(data, {{col_label}})
  stopifnot(is.numeric(n))
  stopifnot(n <= nrow(data))
  result <- data[0:n,]
  list(result)
}
```

## Exercise 2: Document your Function

``` r
#' @details the function is aimed to pick up the first n rows of arranged table based on one of the varible in table
#' @param data is the data table we will focus on
#' @param col_label is the varible inside the data we will sort.
#' @param n is the number of the rows we will use
#' @return the new table with n rows
```

## Exercise 3: Include examples

``` r
# for example: we would like get the first 100 rows of the data sorted BY radius_mean
pick_n_smallest(cancer_sample, col_label = radius_mean, 100)
```

    ## [[1]]
    ## # A tibble: 100 × 32
    ##           ID diagnosis radius_…¹ textu…² perim…³ area_…⁴ smoot…⁵ compa…⁶ conca…⁷
    ##        <dbl> <chr>         <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    ##  1    862722 B              6.98    13.4    43.8    144.  0.117   0.0757  0     
    ##  2    921362 B              7.69    25.4    48.3    170.  0.0867  0.120   0.0925
    ##  3    921092 B              7.73    25.5    48.0    179.  0.0810  0.0488  0     
    ##  4     92751 B              7.76    24.5    47.9    181   0.0526  0.0436  0     
    ##  5  85713702 B              8.20    16.8    51.7    202.  0.086   0.0594  0.0159
    ##  6 871001502 B              8.22    20.7    53.3    204.  0.0940  0.130   0.132 
    ##  7     91805 B              8.57    13.1    54.5    221.  0.104   0.0763  0.0256
    ##  8    894047 B              8.60    18.6    54.1    221.  0.107   0.0585  0     
    ##  9    858981 B              8.60    21.0    54.7    222.  0.124   0.0896  0.03  
    ## 10    858477 B              8.62    11.8    54.3    224.  0.0975  0.0527  0.0206
    ## # … with 90 more rows, 23 more variables: concave_points_mean <dbl>,
    ## #   symmetry_mean <dbl>, fractal_dimension_mean <dbl>, radius_se <dbl>,
    ## #   texture_se <dbl>, perimeter_se <dbl>, area_se <dbl>, smoothness_se <dbl>,
    ## #   compactness_se <dbl>, concavity_se <dbl>, concave_points_se <dbl>,
    ## #   symmetry_se <dbl>, fractal_dimension_se <dbl>, radius_worst <dbl>,
    ## #   texture_worst <dbl>, perimeter_worst <dbl>, area_worst <dbl>,
    ## #   smoothness_worst <dbl>, compactness_worst <dbl>, concavity_worst <dbl>, …

``` r
# Since the n is bigger than the number of rows
pick_n_smallest(cancer_sample, col_label = texture_mean, 1500000)
```

    ## Error in pick_n_smallest(cancer_sample, col_label = texture_mean, 1500000): n <= nrow(data) is not TRUE

## Exercise 4: Test

``` r
# it checked whether the head of two table are the same
cancer_check <- arrange(cancer_sample, area_mean)
test_that("output the first n rows", {
    expect_equal(head(pick_n_smallest(cancer_sample, col_label = area_mean, 10)[[1]]), head(cancer_check[0:10,]))
})
```

    ## Test passed 🎉

``` r
# it checked the length of the two table
cancer_check <- arrange(cancer_sample, area_mean)
test_that("output the first n rows", {
    expect_equal(nrow(pick_n(cancer_sample,col_label = area_mean, 20)[[1]]), 20)
})
```

    ## ── Error (<text>:4:5): output the first n rows ─────────────────────────────────
    ## Error in `pick_n(cancer_sample, col_label = area_mean, 20)`: could not find function "pick_n"
    ## Backtrace:
    ##  1. testthat::expect_equal(...)
    ##  4. base::nrow(pick_n(cancer_sample, col_label = area_mean, 20)[[1]])

    ## Error in `reporter$stop_if_needed()`:
    ## ! Test failed

``` r
# it checked the function by checking the length of the two table

test_that("output the first n rows", {
    expect_equal(nrow(pick_n(cancer_sample,col_label = area_mean, 100)[[1]]), 100)
})
```

    ## ── Error (<text>:4:5): output the first n rows ─────────────────────────────────
    ## Error in `pick_n(cancer_sample, col_label = area_mean, 100)`: could not find function "pick_n"
    ## Backtrace:
    ##  1. testthat::expect_equal(...)
    ##  4. base::nrow(pick_n(cancer_sample, col_label = area_mean, 100)[[1]])

    ## Error in `reporter$stop_if_needed()`:
    ## ! Test failed
