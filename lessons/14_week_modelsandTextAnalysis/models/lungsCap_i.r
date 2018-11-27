# data: 27 Nov 2018

library(tidyverse)
library(psych)
#open lung capacity data
lc <-file.choose()
dataLungCap <- read.csv(lc)
View(dataLungCap)
attach(dataLungCap)
mod <- lm(LungCap ~ Age + Height)
summary(mod)
