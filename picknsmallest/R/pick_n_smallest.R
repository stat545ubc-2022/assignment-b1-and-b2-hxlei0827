#' Getting smallest n function: picking up the n smallest value based on a given varible in a table
#'
#' @param data the data we focus on
#' @param col_label the varible we focus on in the data
#' @param n the number of smallest value need
#'
#' @return the new table with n rows
#' @export
#'
#' @examples
#' library(datateachr)
#' library(tidyverse)
#' library(testthat)
#' library(dplyr)
#' library(digest)
#' pick_n_smallest(cancer_sample, col_label = radius_mean, 100)
pick_n_smallest <- function(data, col_label, n){
  data <-dplyr::arrange(data, {{col_label}})
  stopifnot(is.numeric(n))
  stopifnot(n <= nrow(data))
  result <- data[0:n,]
  list(result)
}
