# Date: 6 Nov 2018
# Basic Linear Regression

library(ggplot2)
library(dplyr)

#######################################
# Crime 
#######################################

options(stringsAsFactors = FALSE)
c <- file.choose()
#crime <- read.csv("crime.csv")
crime <- read.csv(c)

# view the data
#View(crime)

# Estimating a function
mod <- lm(tc2009 ~ low, data = crime) # first model, set to variable mo

class(tc2009 ~ low)

mod # show the model details. Note the call and the coefficients
#more details about the model.
names(mod)
summary(mod)
predict(mod)
resid(mod)
coef(mod)
coefficients(mod)

qplot(low, predict(mod), data = crime, geom = "line")

qplot(low, tc2009, data = crime) + geom_smooth(method = lm)

qplot(low, tc2009, data = crime) +geom_smooth(se = FALSE, method = lm) # without shading in smooth
qplot(low, tc2009, data = crime) +geom_smooth(se = TRUE, method = lm) # with shading in smooth

#Consider This!
mod1 <- lm(tc2009 ~ low, data = crime)
mod2 <- lm(tc2009 ~ 1 + low, data = crime)

mod3 <- lm(tc2009 ~ 0 + low, data = crime)
mod4 <- lm(tc2009 ~ low - 1, data = crime)

# now get some details about each of the models.

summary(mod)
predict(mod) # predictions at original vals
resid(mod) # residuals

#######################################
# Wages, to get started...
#######################################

w <-file.choose()
#wages <- read.csv("wages.csv")
wages <- read.csv(w)
