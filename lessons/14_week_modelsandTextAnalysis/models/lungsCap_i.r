# date: 27 Nov 2018

library(tidyverse)
library(psych)
#open lung capacity data
lc <-file.choose()
dataLungCap <- read.csv(lc)
View(dataLungCap)
attach(dataLungCap)
mod <- lm(LungCap ~ Age + Height)


# model creation
mod <- lm(LungCap ~ Age + Height)
mod_age <- lm(LungCap ~ Age)
mod_height <- lm(LungCap ~ Height)


# get a report of the models
summary(mod)
summary(mod_age)
summary(mod_Height)


mod2 <- lm(LungCap ~ Age + Height + Smoke + Gender + Caesarean)
summary(mod2)
plot(mod2) # check the four visuals!
