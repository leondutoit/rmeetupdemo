
library(testthat)
source("get_data_from_ssb.r")

context("testing JSON to data frame parsing")

get_test_json <- function() {
  fromJSON("another.json")
}

set_classes_to_list <- function(df, col_nums) {
  Map(function(x, y) { class(df[[x]]) <<- y }, 1:col_nums, rep("list", col_nums))
  df
}

# This creates what is return by reading the JSON
# and selecting only the data from it
create_test_df_list <- function() {
  list(
    Region = (function() {
      df <- data.frame(I("The whole country"))
      df <- set_classes_to_list(df, 1)
      names(df) <- "0"
      df
    })(),
    Kjonn = (function() {
      df <- data.frame(c1 = I("Males"), c2 = I("Females"))
      df <- set_classes_to_list(df, 2)
      names(df) <- c("1", "2")
      df
    })(),
    Landbakgrunn = (function() {
      df <- data.frame(c1 = I("Europe"), c2 = I("Africa"), c3 = I("Asia"), c4 = I("Moon"))
      df <- set_classes_to_list(df, 4)
      names(df) <- c("1", "2", "3", "4")
      df
    })(),
    Tid = (function() {
      df <- data.frame(c1 = I(1970), c2 = I(1980), c3 = I(1986))
      df <- set_classes_to_list(df, 3)
      names(df) <- c("1970", "1980", "1986")
      df
    })(),
    ContentsCode = (function() {
      df <- data.frame(Personer = I("Persons"))
      df <- set_classes_to_list(df, 1)
      df
    })()
  )
}

create_test_values <- function() {
  correct_values <- data.frame(
    Values = c(2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89))
  correct_values
}

test_that("data extracted from JSON has the expected classes at all depths", {

  data_from_code <- get_data_from_json(get_test_json())
  correct_df_list <- create_test_df_list()

  # are both containers lists?
  expect_equal(class(data_from_code), class(correct_df_list))

  # are all elements lists when indexed without simplification?
  expect_equal(class(data_from_code[1]), class(correct_df_list[1]))
  expect_equal(class(data_from_code[2]), class(correct_df_list[2]))
  expect_equal(class(data_from_code[3]), class(correct_df_list[3]))
  expect_equal(class(data_from_code[4]), class(correct_df_list[4]))
  expect_equal(class(data_from_code[5]), class(correct_df_list[5]))

  # are all elements dataframes when indexed with simplification?
  expect_equal(class(data_from_code[[1]]), class(correct_df_list[[1]]))
  expect_equal(class(data_from_code[[2]]), class(correct_df_list[[2]]))
  expect_equal(class(data_from_code[[3]]), class(correct_df_list[[3]]))
  expect_equal(class(data_from_code[[4]]), class(correct_df_list[[4]]))
  expect_equal(class(data_from_code[[5]]), class(correct_df_list[[5]]))

  # are all columns of all dataframes lists?
  expect_equal(class(data_from_code[[1]][[1]]), class(correct_df_list[[1]][[1]]))
  expect_equal(class(data_from_code[[2]][[1]]), class(correct_df_list[[2]][[1]]))
  expect_equal(class(data_from_code[[2]][[2]]), class(correct_df_list[[2]][[2]]))
  expect_equal(class(data_from_code[[3]][[1]]), class(correct_df_list[[3]][[1]]))
  expect_equal(class(data_from_code[[3]][[2]]), class(correct_df_list[[3]][[2]]))
  expect_equal(class(data_from_code[[3]][[3]]), class(correct_df_list[[3]][[3]]))
  expect_equal(class(data_from_code[[3]][[4]]), class(correct_df_list[[3]][[4]]))
  expect_equal(class(data_from_code[[4]][[1]]), class(correct_df_list[[4]][[1]]))
  expect_equal(class(data_from_code[[4]][[2]]), class(correct_df_list[[4]][[2]]))
  expect_equal(class(data_from_code[[4]][[3]]), class(correct_df_list[[4]][[3]]))
  expect_equal(class(data_from_code[[5]][[1]]), class(correct_df_list[[5]][[1]]))

  }
)

test_that("data frames extracted from JSON have the expected dimensions", {

  data_from_code <- get_data_from_json(get_test_json())
  correct_df_list <- create_test_df_list()

  expect_equal(dim(data_from_code[[1]]), dim(correct_df_list[[1]]))
  expect_equal(dim(data_from_code[[2]]), dim(correct_df_list[[2]]))
  expect_equal(dim(data_from_code[[3]]), dim(correct_df_list[[3]]))
  expect_equal(dim(data_from_code[[4]]), dim(correct_df_list[[4]]))
  expect_equal(dim(data_from_code[[5]]), dim(correct_df_list[[5]]))

  }
)

test_that("values are extracted correctly from JSON", {

  correct_values <- create_test_values()
  values_from_code <- get_values_from_json(get_test_json())
  expect_equal(correct_values[['Values']], values_from_code[['Values']])

  }
)

test_that("prepare_data return a data frame with correct dimensions", {

  input <- (function() {
      df <- data.frame(a = I("bla"), b = I("blergh"))
      df <- set_classes_to_list(df, 2)
      names(df) <- c("1", "2")
      df
  })()
  correct_output <- (function() {
      df <- data.frame(one = I(c("bla", "blergh")))
      df <- set_classes_to_list(df, 1)
      df
  })()
  output_from_code <- prepare_data(input, "one")
  expect_equal(dim(output_from_code), dim(correct_output))

  }
)

test_that("set_classes returns a dataframe with the expected classes", {

  test_input <- data.frame(
    hello = I("world"),
    there = I(777),
    into = I("another"),
    example = I("for"),
    the = I("talk"))

  df_from_code <- set_classes(test_input)

  expect_equal(class(df_from_code[[1]]), "character")
  expect_equal(class(df_from_code[[2]]), "numeric")
  expect_equal(class(df_from_code[[3]]), "character")
  expect_equal(class(df_from_code[[4]]), "character")
  expect_equal(class(df_from_code[[5]]), "character")

  }
)

test_that("make_df merges data frames into the correct shape", {

  correct_data <- prepare_all_data(create_test_df_list())
  correct_values <- create_test_values()
  df_from_code <- make_df(correct_data, correct_values)

  expect_equal(dim(df_from_code), c(24, 6))

  }
)

test_that("remove_zero_values gets rid of value we want to", {

  input <- data.frame(
    Landbakgrunn = c("Stateless", "Uoppgitt", "Only me"),
    stringsAsFactors = FALSE)
  output_from_code <- remove_zero_values(input)

  expect_true(!("Stateless" %in% output_from_code[['Landbakgrunn']]))
  expect_true(!("Uopgitt" %in% output_from_code[['Landbakgrunn']]))

  }
)

