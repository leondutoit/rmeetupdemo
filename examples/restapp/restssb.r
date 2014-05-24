# To run from the REPL:
# > source("restssb.r")

library(Rook)
library(dplyr)
library(jsonlite)

ssb_data <- tbl_df(
  read.csv(
    "./data/ssb_immigration_data.csv",
    stringsAsFactors = FALSE))

immigration_growth <- function(data) {
  data %>%
    group_by(Landbakgrunn, Kjonn) %>%
    mutate(percentage_change = round((Values - lag(Values))/Values*100, 2)) %>%
    select(Tid, Landbakgrunn, Kjonn, Values, percentage_change)
}

server <- Rhttpd$new()

server$add(
  name = "immigration",
  app = function(env) {
    request <- Request$new(env)
    response <- Response$new()
    growth_data <- immigration_growth(ssb_data)
    response$write(toJSON(growth_data))
    response$finish()
  }
)

server$start(port = '8004')
