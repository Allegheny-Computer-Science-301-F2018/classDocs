# date: 31 Oct 2018
# linear regression example


library(tidyverse)
data(airquality)

#show names of the airquality data set
names(airquality)
# [1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"

# Note: we study the linear relationship between Ozone and Solar.R variables.

attach(airquality)
#plot(airquality$Ozone ~ airquality$Solar.R)
plot(Ozone ~ Solar.R)

#find the mean of the Ozone column
mean(Ozone)
#gives us "NA" because there is missing data. Must remove the missing values.

mean(Ozone, na.rm = T)
plot(Ozone)


meanVal = mean(Ozone, na.rm = T)
abline(h = meanVal, col = "red")

# this gives us the basic line going through the data's spread of points.
# Does this line represent the points? Now we build a linear regression model.


# calculate the regression's line
linModel = lm(Ozone ~ Solar.R)

#show the intercept and coefficients
linModel
# show the summary of points
summary(linModel)

# Shows:
# Call (the command line)
# Intercept (this is the y value for when x = 0)
# Solar.r is the slope variable.
# Statistical significance of the the fit of the model. The p value is the probability of observing a t value larger than the one in the model, showes how confident we are that the y-intercept and that of the slope is different from zero.

#plot the line in green
abline(linModel, col ="Green")



plot(linModel)
# 1) First plop: Residuals vs Fitted (most important)
# residuals: the deviations from the fitted values
# fitted values: ozone concentrations predicted by the model.
# we note that residuals increase with fitted values: our model may not accurately represent the true replationship between Ozone and the Solar.R (points).

#2) Q-Q PLOT: Normal distribution Test. if the points were normally distributed, then they would be found laying on the diagonal line.

