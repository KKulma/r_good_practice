## load packages ####

library(readr)
library(dplyr)

## import data ####
tweets <- read_csv('data/tweets.csv')
dim(tweets)


# data cleaning ####
all_tweets <- tweets %>% 
  rename(author = handle) %>% 
  select(author, text) %>% 
  mutate(text = qdapRegex::rm_url(text)) %>% #removes URLs from text
  na.omit()

head(as.data.frame(all_tweets))