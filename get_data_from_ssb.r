
library(RCurl)
library(httr)
library(jsonlite)
library(scales)
library(ggplot2)

# overview: http://data.ssb.no/api/?lang=en
# id = 48670

get_data_from_api <- function(url) {
  fromJSON(url)
}

get_data_from_json <- function(json_data) {
  Map(
    function(x) { json_data[['dimension']][[x]][['category']][['label']] },
      names(json_data[['dimension']]))[1:5]
}

get_values_from_json <- function(json_data) {
  data.frame(Values = json_data[['value']][['dataset']])
}

prepare_data <- function(df, names) {
  data <- data.frame(t(df))
  names(data) <- names
  data
}

prepare_all_data <- function(dfs) {
  Map(prepare_data, dfs, names(dfs))
}

set_classes <- function(df) {
  Map(
    function(x, y) { class(df[[x]]) <<- y },
    c(1, 2, 3, 4, 5),
    c("character", "numeric", "character", "character", "character"))
  df
}

make_df <- function(data, values) {
  merged_data <- merge(
    merge(
      merge(
        merge(
          data[[1]], data[[4]]), data[[3]]), data[[2]]), data[[5]])
  set_classes(data.frame(merged_data, values))
}

json_to_df <- function(json_data) {
  data <- prepare_all_data(get_data_from_json(json_data))
  values <- get_values_from_json(json_data)
  make_df(data, values)
}

create_immigration_df <- function(also_csv = FALSE) {
  url <- "http://data.ssb.no/api/v0/dataset/48670.json?lang=en"
  data <- get_data_from_api(url)
  if (also_csv) {
    out_data <- json_to_df(data)
    write.csv(out_data, "ssb_immigration_data.csv", row.names = FALSE)
  }
  immigration <- json_to_df(data)
}

immigration <- create_immigration_df()

elaborate_plot <- function(df) {
  ggplot(
    df,
    aes(Tid, Values)) +
      geom_bar(stat = "identity") +
      facet_grid(Landbakgrunn ~ Kjonn) +
      scale_y_log10(
        breaks = trans_breaks("log10", function(x) 10^x),
        labels = trans_format("log10", math_format(10^.x)))
}

basic_plot <- function(df) {
  ggplot(
    df,
    aes(Tid, Values)) +
      geom_bar(stat = "identity") +
      facet_grid(Kjonn ~ Landbakgrunn)
}

remove_zero_values <- function(df) {
  # We see we can remove some values for visual clarity
  subset(df, subset = !(Landbakgrunn %in% c("Stateless", "Uoppgitt")))
}

