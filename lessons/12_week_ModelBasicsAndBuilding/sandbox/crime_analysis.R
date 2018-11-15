# date: 15 Nov 2018

# crime data
library(tidyverse)
library(psych)

crime <- read.csv("~/Desktop/data/crime.csv", header=TRUE)
View(crime)


# plots
crime %>% ggplot(aes(x = low, y = tc2009)) + geom_point(alpha = I(1/4)) + geom_smooth()


crime %>% ggplot(aes(x = low, y = tc2009)) + geom_point(alpha = I(1/4)) + geom_smooth(method = lm)


#correlations
pairs.panels(crime)

# build the model

mod <- lm(tc2009 ~ low, data = crime)

summary(mod)
