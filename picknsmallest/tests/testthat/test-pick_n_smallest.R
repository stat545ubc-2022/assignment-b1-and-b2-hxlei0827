
# it checked whether the table are the same
library(dplyr)
library(datateachr)
cancer_check <- arrange(cancer_sample, area_mean)
test_that("output the first n rows", {
  expect_equal(head(pick_n_smallest(cancer_sample, col_label = area_mean, 10)[[1]]), head(cancer_check[0:10,]))
})

# it checked the length of the two table
cancer_check <- arrange(cancer_sample, area_mean)
test_that("output the first n rows", {
  expect_equal(nrow(pick_n_smallest(cancer_sample,col_label = area_mean, 20)[[1]]), 20)
})

# it checked the function by checking the length of the two table
test_that("output the first n rows", {
  expect_equal(nrow(pick_n_smallest(cancer_sample,col_label = area_mean, 100)[[1]]), 100)
})
