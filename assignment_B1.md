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
pick_n <- function(data,  n){
  #data <- arrange(varible)
  stopifnot(is.numeric(n))
  stopifnot(n <= nrow(data))
  result <- data[0:n,]
  list(result)
}
```

## Exercise 2: Document your Function

``` r
#' @details the function is aimed to pick up the first n rows of the table
#' @param data is the data table we will focus on
#' @param n is the number of the rows we will use
#' @return the new table with n rows
```

## Exercise 3: Include examples

``` r
pick_n(cancer_sample, 100)
```

    ## [[1]]
    ## # A tibble: 100 × 32
    ##          ID diagnosis radius_m…¹ textu…² perim…³ area_…⁴ smoot…⁵ compa…⁶ conca…⁷
    ##       <dbl> <chr>          <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
    ##  1   842302 M               18.0    10.4   123.    1001   0.118   0.278   0.300 
    ##  2   842517 M               20.6    17.8   133.    1326   0.0847  0.0786  0.0869
    ##  3 84300903 M               19.7    21.2   130     1203   0.110   0.160   0.197 
    ##  4 84348301 M               11.4    20.4    77.6    386.  0.142   0.284   0.241 
    ##  5 84358402 M               20.3    14.3   135.    1297   0.100   0.133   0.198 
    ##  6   843786 M               12.4    15.7    82.6    477.  0.128   0.17    0.158 
    ##  7   844359 M               18.2    20.0   120.    1040   0.0946  0.109   0.113 
    ##  8 84458202 M               13.7    20.8    90.2    578.  0.119   0.164   0.0937
    ##  9   844981 M               13      21.8    87.5    520.  0.127   0.193   0.186 
    ## 10 84501001 M               12.5    24.0    84.0    476.  0.119   0.240   0.227 
    ## # … with 90 more rows, 23 more variables: concave_points_mean <dbl>,
    ## #   symmetry_mean <dbl>, fractal_dimension_mean <dbl>, radius_se <dbl>,
    ## #   texture_se <dbl>, perimeter_se <dbl>, area_se <dbl>, smoothness_se <dbl>,
    ## #   compactness_se <dbl>, concavity_se <dbl>, concave_points_se <dbl>,
    ## #   symmetry_se <dbl>, fractal_dimension_se <dbl>, radius_worst <dbl>,
    ## #   texture_worst <dbl>, perimeter_worst <dbl>, area_worst <dbl>,
    ## #   smoothness_worst <dbl>, compactness_worst <dbl>, concavity_worst <dbl>, …

``` r
# Since the n is bigger than the number of rows
pick_n(cancer_sample, 1500000)
```

    ## Error in pick_n(cancer_sample, 1500000): n <= nrow(data) is not TRUE

## Exercise 4: Test

``` r
# it checked whether the head of two table are the same
test_that("output the first n rows", {
    expect_equal(head(pick_n(cancer_sample,10)[[1]]), head(cancer_sample[0:10,]))
})
```

    ## Test passed 🥇

``` r
# it checked the length of the two table
test_that("output the first n rows", {
    expect_equal(nrow(pick_n(cancer_sample,20)[[1]]), 20)
})
```

    ## Test passed 🌈

``` r
test_that("output the first n rows", {
    expect_equal(nrow(pick_n(cancer_sample,100)[[1]]), 100)
})
```

    ## Test passed 🌈
