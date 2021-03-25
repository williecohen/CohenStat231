library(tidyverse)
library(robotstxt)
library(rvest)
library(knitr)
library(janitor)


rapperquotes_html <- read_html("https://www.brainyquote.com/topics/rappers-quotes")

quotes <- rapperquotes_html %>%
  html_nodes(".oncl_q") %>%
  html_text() 

person <- rapperquotes_html %>%
  html_nodes(".oncl_a") %>%
  html_text()

# put in data frame with two variables (person and quote)
rapperquotes_dat <- data.frame(quote = quotes, stringsAsFactors = FALSE) %>%
  filter(quote != "\n") %>%
  mutate(person = person
         , together = paste('"', as.character(quote), '" --'
                            , as.character(person), sep=""))

write_csv(x = rapperquotes_dat, "/Users/senatorbill/Stat231/CohenStat231/231HWs/ps5B/rapperquotes.csv")