# date: 1 Nov 2018

library(tidyverse)

# psych package and tools

# install if needed?
# install.packages("psych")

library(psych)

data(sat.act)
View(sat.act)
# what is this data? https://www.personality-project.org/r/html/sat.act.html
describe(sat.act) #basic descriptive statistics
summary(sat.act) # more basic descriptive stats, different order of information

# get to know the types of the data
sapply(sat.act, typeof)
str(sat.act)
#basic descriptive statistics by a grouping variable (Here: separation by gender)
describeBy(sat.act,sat.act$gender,skew=FALSE,ranges=FALSE)
#View(sat.act)


print("outliers")
# Using the outlier function to graphically show outliers. The y axis is the Mahalanobis D2, the X axis is the distribution of χ2 for the same number of degrees of freedom. The outliers detected here may be shown graphically using pairs.panels (see 2, and may be found by sorting d2.)

#One way to detect unusual data is to consider how far each data point is from the multivariate centroid of the data. That is, find the squared Mahalanobis distance for each data point and then compare these to the expected values of χ2. This produces a Q-Q (quantle-quantile) plot with the n most extreme data points labeled (Figure 1, Psych overview). The outlier values are in the vector d2.

d2 <- outlier(sat.act,cex=.8) # save the outliers in a table
#View(d2)
outlier(sat.act,cex=.8)

#note:
#Defining the Mahalanobis distance
#You can use the probability contours to define the Mahalanobis distance. The Mahalanobis distance has the following properties:

#It accounts for the fact that the variances in each direction are different.
#It accounts for the covariance between variables.
#It reduces to the familiar Euclidean distance for uncorrelated variables with unit variance.

#finding correlations: range is -1 (negative correlation) to 1 (positive correlation)

# Demo: Which columns are saying the exact same or exact opposite?
cor(c(1,2,3,4,5,6),c(1,2,3,4,5,6))
# gives a 1 for highest correlation

cor(c(1,2,3,4,5,6),c(6,5,4,3,2,1))
# gives a -1 for lowest correlation

# exact correlations as graphics
ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age)
# show all plots
pairs.panels(ageAndNew_perfectCorr)
#note: Adapted from the help page for pairs, pairs.panels shows a scatter plot of matrices (SPLOM), with bivariate scatter plots below the diagonal, histograms on the diagonal, and the Pearson correlation above the diagonal. 

ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age,negativeAge = -age)

# A zoom-in: see only those columns that actually correlate in some way
pairs.panels(ageAndNew_perfectCorr[c(3,7,8)])

# show all plots
pairs.panels(ageAndNew_perfectCorr)


d2 <- outlier(sat.act,cex=.8)
# note: cex. number indicating the amount by which plotting text and symbols should be scaled relative to the default. 1=default, 1.5 is 50% larger, 0.5 is 50% smaller, etc. cex.axis. magnification of axis annotation relative to cex.

sat.d2 <- data.frame(sat.act,d2) #combine the d2 statistics from before with the sat.act data.frame


#Figure 2: Using the pairs.panels function to graphically show relationships. The x axisin each scatter plot represents the column variable, the y axis the row variable. Note the extreme outlier for the ACT. If the plot character were set to a period (pch=’.’) it wouldmake a cleaner graphic, but in to show the outliers in color we use the plot characters 21 and 22.

# 21 means the circular point

#The yellow and blue are plotted depending on the truthfulness of the expression in the square brackets [d2 > 25) + 1]: true -> yellow, false -> blue
#used to show outliers
pairs.panels(sat.d2,bg=c("yellow","blue")[(d2 > 25)+1],pch=21)

#change the plotting point shape to squares, number 22
pairs.panels(sat.d2,bg=c("yellow","blue")[(d2 > 25)+1],pch=22)


# add a column called "new" which is a copy of sat.act$age for positive correlation
ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age)
pairs.panels(ageAndNew_perfectCorr)


# add a column called "new" which is a copy of sat.act$age for negative correlation
ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age,negativeAge = -age)
pairs.panels(ageAndNew_perfectCorr)

#new data in psych package: can you find the correlations?
pairs.panels(affect[c(14,15,16,17,20)])
pairs.panels(affect[c(14,15)])

violinBy(sat.act[5:6],sat.act$gender,grp.name=c("M", "F"),main="Density Plot by gender for SAT V and Q")
