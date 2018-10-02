#Date: 2 Oct 2018

# create a set of data called "myData"
myData <- data_frame(
  +     ColA = c("a1","b1","c1","d1"),
  +     ColB = c("a2","b2","c2","d2"),
  +     ColC = c("a3","b3","c3","d3"),
  +     ColD = c(14,24,34,44) )

#get the forth col (col D)
myData[,4]


friends_data <- data_frame(
  name = c("Alexander", "Luke", "Freddy", "Sam", "Amelia", "Daisy"),
  age = c(27, 25, 29, 26, 01, 25),
  height = c(180, 170, 185, 169, 60, 160),
  inCollege = c(TRUE, FALSE, TRUE, TRUE, FALSE, TRUE))


friends_data[1,]
library(tibble)
library(tidyverse)

diamonds[1,]

ggplot(data = diamonds) + geom_point(mapping = aes(x = cut, y = carat, color = clarity))

ggplot(data = diamonds) +   geom_bar(mapping = aes(x = cut))

diamonds %>% count(cut)


ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 0.1)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = 2)

ggplot(data = diamonds) +
  geom_histogram(mapping = aes(x = carat), binwidth = .2)


diamonds %>% count(carat,cut_width=0.2)

ggplot(data = smaller, mapping = aes(x = carat)) +
  geom_histogram(binwidth = 1)
