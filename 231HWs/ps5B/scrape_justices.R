library(tidyverse)
library(robotstxt)
library(rvest)
library(knitr)
library(janitor)

justices_url <- "https://en.wikipedia.org/wiki/List_of_justices_of_the_Supreme_Court_of_the_United_States"

justTables <- justices_url %>%
  read_html() %>%
  html_nodes("table")

length(justTables)


justices <- html_table(justTables[[2]])


write_csv(x = justices, "/Users/senatorbill/Stat231/CohenStat231/231HWs/ps5B/justices.csv")
