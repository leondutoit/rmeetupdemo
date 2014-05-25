
# TODO (Leon) revisit docs
# Utility functions to get immigration data from SSB,
# explore graphically and write data to csv file
# For and overview see url and dataset with following id
# URL: http://data.ssb.no/api/?lang=en
# id: 48670
# Example usage
# > library(rmeetupdemo)
# > immigration <- create_immigration_df()
# > basic_plot(immigration)
# > elaborate_plot(remove_zero_values(immigration))

#' @import RCurl
#' @import httr
#' @import rjstat
#' @import ggplot2
#' @import scales

#' @export
get_data_from_api <- function(url) {
  fromJSONstat(readLines(url))
}

#' @export
write_csv <- function(data) {
  write.csv(
    data,
    "./data/ssb_immigration_data.csv",
    row.names = FALSE,
    quote = FALSE)
}

#' @export
create_immigration_df <- function() {
  url <- "http://data.ssb.no/api/v0/dataset/48670.json?lang=en"
  get_data_from_api(url)
}

#' @export
basic_plot <- function(df) {
  ggplot(
    df,
    aes(time, value)) +
      geom_bar(stat = "identity") +
      facet_grid(sex ~ background)
}

#' @export
elaborate_plot <- function(df) {
  ggplot(
    df,
    aes(time, value)) +
      geom_bar(stat = "identity") +
      facet_grid(background ~ sex) +
      scale_y_log10(
        breaks = trans_breaks("log10", function(x) 10^x),
        labels = trans_format("log10", math_format(10^.x)))
}
