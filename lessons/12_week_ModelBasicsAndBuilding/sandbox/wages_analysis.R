# date: 15 Nov 2018

# wages data

library(tidyverse)
library(psych)

wages <- read.csv("~/Desktop/data/wages.csv")
View(wages)

# plot
wages %>% ggplot(aes(x = earn, y = height)) + geom_point() + geom_smooth()

wages %>% ggplot(aes(x = earn, y = height, col = age)) + geom_point() + geom_smooth()

wages %>% ggplot(aes(x = earn, y = height, col = earn)) + geom_point() + geom_smooth()


wages %>% ggplot(aes(y = earn, x = height, col = earn)) + geom_point() + geom_smooth()


wages %>% ggplot(aes(y = earn, x = height, col = sex)) + geom_point() + geom_smooth()

wages %>% ggplot(aes(x = earn, y = height, col = sex)) + geom_point() + geom_smooth()


# correlations:
pairs.panels(wages)

cor(wages$ed, wages$height)

cor(wages$earn, wages$height)


# build the model
#single linear model
modEarnHeight <- lm(earn ~ height, data = wages)

summary(modEarnHeight)


# build the model
#model linear model
modEarnHeightEd <- lm(earn ~ height + ed, data = wages)
summary(modEarnHeightEd)
