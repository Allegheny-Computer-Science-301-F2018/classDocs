# Date: 6 Nov 2018
library(tidyverse)
library(psych)

data(sat.act)

# Note: due to library conflicts wth RStudio, this code may need to be run in R from the terminal



#View(sat.act)

#Map out the means according to gender using a "cat's eye" plot.
# error.bars show the 95 % confidence intervals for each variable in a data frame or matrix.
# These errors are based upon normal theory and the standard errors of the mean. Alternative options include +/- one standard deviation or 1 standard error. If the data are repeated measures, the error bars will be reflect the between variable correlations. By default, the confidence intervals are displayed using a “cats eyes” plot which emphasizes the distribution of confidence within the confidence interval.

error.bars.by(sat.act,sat.act$gender==2)
# note the means from the above error.bars plot can be found in the below describe()
describe(sat.act)

# bars
#View(bfi)
# try ?bfi to view the codebook
# data = bfi, show the side distributions of males and females according to age.
with(bfi,{bi.bars(age,gender,ylab="Age",main="dataset = epi.bfi, Age by males and females")})

# data= sat.act, show the side distributions of males and females according to age.
with(sat.act,{bi.bars(age,gender,ylab="edu",main="data = sat.act; Age by Gender")})

with(sat.act,{bi.bars(SATV,education,ylab="Age",main="SATV by education")}) # is this helpful plotting?
with(sat.act,{bi.bars(gender,SATV,ylab="Age",main="SATV by education")})  # is this helpful plotting??

# correlations
# make some perfect correlations
ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age,negativeAge = -age)


#positive and negative correlations (columns; 3, 7 and 8)
pairs.panels(ageAndNew_perfectCorr[c(3,7,8)])

# show all plots of all correlations
pairs.panels(ageAndNew_perfectCorr)

# get the correlation values (in text) using the "pearson" method
cor(ageAndNew_perfectCorr, method = "pearson")

# what does the following graph have to do with the previous plots?
with(ageAndNew_perfectCorr,{bi.bars(SATV,education,ylab="Age",main="SATV by education")})



# using heatmaps
# remember, the following line? Now we continue this thought.
pairs.panels(ageAndNew_perfectCorr[c(3,7,8)])

corPlot(ageAndNew_perfectCorr[c(3,7,8)])

corPlot(ageAndNew_perfectCorr[c(3,7,8)],numbers = TRUE)

# remember, the following line? Now we continue this thought.
pairs.panels(ageAndNew_perfectCorr, numbers = TRUE)

corPlot(ageAndNew_perfectCorr, numbers = TRUE)





#################################################
# TODO!!
#################################################

# You will have to use the R interpreter from the terminal. Type "R" at the terminal and copy and paste in your code from your editor.


# General Question: What correlations exist in the BFI data concerning the factors of one's personality?

# + Check the dataset: bfi
# + View the codebook of this dataset
# + Design code using the with() and corPlot() to get a general idea of all correlations in the BFI dataset
# + Design code to find the top ten most positively-correlated columns
# + Design code to find the top ten most negatively-correlated columns
# + Design code to find the top ten least-correlated columns.
# + Returning to the codebook, working with your group, can you offer a suggestions to explain the typess of correlations that you found?
# + Use GGplot to graph some of the top positive, negative and neutral correlations. Can you tell from the graph what the correlation is?


##################################################
