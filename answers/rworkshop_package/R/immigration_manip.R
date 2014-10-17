#' @import dplyr

#' @export
add_growth_rates <- function(df) {
  df %>%
    group_by(background, sex) %>%
    mutate(percentage_change = round((value - lag(value))/value*100, 2))
}
