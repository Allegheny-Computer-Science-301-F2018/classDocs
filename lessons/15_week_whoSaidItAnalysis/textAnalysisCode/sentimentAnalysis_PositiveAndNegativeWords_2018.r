# date: 28 Nov 2018
# sentiment analysis in R

#check to see whether all libraries are installed properly.
#install.packages("janeaustenr")

library(janeaustenr)
library(dplyr)
library(stringr)
#install.packages("tidytext")
library(tidytext)
library(ggplot2)
library(tidyr)


original_books <- austen_books() %>%
  group_by(book) %>%
  mutate(linenumber = row_number(),
         chapter = cumsum(str_detect(text, regex("^chapter [\\divxlc]", ignore_case = TRUE)))) %>% ungroup()

original_books


tidy_books <- original_books %>%
  unnest_tokens(word, text) #make a list of words from the paragraphs

tidy_books


data("stop_words")
cleaned_books <- tidy_books %>%
  anti_join(stop_words)
# anti_join() returns all rows from x where there are not matching values in y, keeping just columns from x.

cleaned_books %>%
  count(word, sort = TRUE) 
# consider the joy-words in Emma using the nrc lexicon.
nrcjoy <- get_sentiments("nrc") %>%
  filter(sentiment == "joy")

tidy_books %>%
  filter(book == "Emma") %>%
  semi_join(nrcjoy) %>%
  count(word, sort = TRUE)


bing <- get_sentiments("bing")
bing # the listing of words according to being of a positive of negative nature.

#determine the sentiment fluxuations in the books.

janeaustensentiment <- tidy_books %>%
  inner_join(bing) %>%
  count(book, index = linenumber %/% 80, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(sentiment = positive - negative)

# plot the sentiment in each book
ggplot(janeaustensentiment, aes(index, sentiment, fill = book)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")

# what are the common good and bad words?
bing_word_counts <- tidy_books %>%
  inner_join(bing) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()

bing_word_counts


bing_word_counts %>%
  filter(n > 150) %>%
  mutate(n = ifelse(sentiment == "negative", -n, n)) %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  ylab("Contribution to sentiment")

