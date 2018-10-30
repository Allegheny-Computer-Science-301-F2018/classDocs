library(stringr)
#install.packages("babynames")
library(babynames)
View(babynames)
#Want to Select all names beginning with “A”
#Use regular expressions!
#Names beginning A : “^A”
str_subset(c(babynames$name),"^A")


str_subset(c(babynames$name),"^Z")

library(tibble)
library(tidyverse)

# Create two small tables to experiment on
x <- tribble(~key, ~val_x, 1, "x1", 2, "x2", 3, "x3")
y <- tribble(~key, ~val_y, 1, "y1", 2, "y2", 4, "y3")


lj <- left_join(x, y, by="key")
rj <- right_join(x, y, by="key")
fj <- full_join(x, y, by="key")

#################
# stats: week 10
#################

#Return the sum of squares:
sumOfSquares <- function(x,y) {
  x^2 + y^2
}

sumOfSquares(2,4)


redPlot <- function(x, y) {
  plot(x, y, col="red")
}
redPlot(1,10)


GimmeAtLeastFive <- function(inNum){
  if(inNum >= 5){
    print("That is at least five")
  }
  else{
    print("not enough")
  }
}



library(dplyr) # and load tidyverse too!
data_people <- tibble::tribble(
  ~EyeColour, ~Height, ~Weight, ~Age,
"Blue", 1.8, 110L, 18L,
"Brown", 1.9, 150L, 34L,
"Blue", 1.7, 207L, 28L,
"Brown", 1.9, 170L, 21L,
"Blue", 1.9, 164L, 29L,
"Brown", 1.9, 183L, 31L,
"Brown", 1.9, 175L, 20L,
"Blue", 1.9, 202L, 27L )

data_people %>% select(EyeColour, Height, Weight) %>% filter(EyeColour=="Blue") %>% mutate(BMI = Weight / Height^2) %>% summary(averageBMI == mean(BMI))

library(tidyverse)
data_people %>% filter(Height, Weight) %>% ggplot(aes(x = Weight, y = Height, col = Age)) + geom_point() + geom_smooth()




data_drinks <- tibble::tribble(
  ~Observation, ~Colour, ~percentFull,
  1,"Green", 70,
  2,"Purple",30,
  3,"Green",50,
  4,"Purple",20,
  5,"Purple",15,
  6,"Green",90,
  7,"Purple",40,
  8,"Green",60,
  9,"Purple",15)


data_drinks <- data_drinks %>%
  select(Colour, percentFull) #lose obs. num

t.test(data = data_drinks, percentFull ~ Colour)
