
<!-- README.md is generated from README.Rmd. Please edit that file -->

# picknsmallest

<!-- badges: start -->
<!-- badges: end -->

The goal of picknsmallest is to picking up the n smallest value on a
given variable

## Installation

You can install the development version of picknsmallest from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-hxlei0827")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(picknsmallest)
library(datateachr)
library(tidyverse)
#> ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
#> ✔ ggplot2 3.3.6      ✔ purrr   0.3.4 
#> ✔ tibble  3.1.8      ✔ dplyr   1.0.10
#> ✔ tidyr   1.2.1      ✔ stringr 1.4.1 
#> ✔ readr   2.1.2      ✔ forcats 0.5.2 
#> ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
#> ✖ dplyr::filter() masks stats::filter()
#> ✖ dplyr::lag()    masks stats::lag()
library(testthat)
#> 
#> Attaching package: 'testthat'
#> 
#> The following object is masked from 'package:dplyr':
#> 
#>     matches
#> 
#> The following object is masked from 'package:purrr':
#> 
#>     is_null
#> 
#> The following objects are masked from 'package:readr':
#> 
#>     edition_get, local_edition
#> 
#> The following object is masked from 'package:tidyr':
#> 
#>     matches
library(dplyr)
library(digest)
pick_n_smallest(cancer_sample, col_label = radius_mean, 100)
#> [[1]]
#> # A tibble: 100 × 32
#>           ID diagnosis radius_…¹ textu…² perim…³ area_…⁴ smoot…⁵ compa…⁶ conca…⁷
#>        <dbl> <chr>         <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
#>  1    862722 B              6.98    13.4    43.8    144.  0.117   0.0757  0     
#>  2    921362 B              7.69    25.4    48.3    170.  0.0867  0.120   0.0925
#>  3    921092 B              7.73    25.5    48.0    179.  0.0810  0.0488  0     
#>  4     92751 B              7.76    24.5    47.9    181   0.0526  0.0436  0     
#>  5  85713702 B              8.20    16.8    51.7    202.  0.086   0.0594  0.0159
#>  6 871001502 B              8.22    20.7    53.3    204.  0.0940  0.130   0.132 
#>  7     91805 B              8.57    13.1    54.5    221.  0.104   0.0763  0.0256
#>  8    894047 B              8.60    18.6    54.1    221.  0.107   0.0585  0     
#>  9    858981 B              8.60    21.0    54.7    222.  0.124   0.0896  0.03  
#> 10    858477 B              8.62    11.8    54.3    224.  0.0975  0.0527  0.0206
#> # … with 90 more rows, 23 more variables: concave_points_mean <dbl>,
#> #   symmetry_mean <dbl>, fractal_dimension_mean <dbl>, radius_se <dbl>,
#> #   texture_se <dbl>, perimeter_se <dbl>, area_se <dbl>, smoothness_se <dbl>,
#> #   compactness_se <dbl>, concavity_se <dbl>, concave_points_se <dbl>,
#> #   symmetry_se <dbl>, fractal_dimension_se <dbl>, radius_worst <dbl>,
#> #   texture_worst <dbl>, perimeter_worst <dbl>, area_worst <dbl>,
#> #   smoothness_worst <dbl>, compactness_worst <dbl>, concavity_worst <dbl>, …
## basic example code
```
