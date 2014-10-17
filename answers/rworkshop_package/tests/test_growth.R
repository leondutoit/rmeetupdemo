library(testthat)

context("Growth calculations")

test_that("add_growth_rates calculates yearly growth correctly", {
  testdf <- data.frame(
    background = c("a", "a", "b", "b", "b", "b"),
    sex = c("male", "male", "female", "female", "male", "male"),
    value = c(10, 12, 5, 6, 3, 4),
    stringsAsFactors = FALSE)
  outdf <- add_growth_rates(testdf)
  correctdf <- data.frame(
    background = c("a", "a", "b", "b", "b", "b"),
    sex = c("male", "male", "female", "female", "male", "male"),
    value = c(10, 12, 5, 6, 3, 4),
    percentage_change = c(NA, 16.67, NA, 16.67, NA, 25.00),
    stringsAsFactors = FALSE)
  expect_equivalent(outdf, correctdf)
  # no numeric tolerance with identical expectations
  expect_identical(outdf$background, correctdf$background)
  expect_identical(outdf$sex, correctdf$sex)
  expect_identical(outdf$value, correctdf$value)
  expect_identical(outdf$percentage_change, correctdf$percentage_change)
})
