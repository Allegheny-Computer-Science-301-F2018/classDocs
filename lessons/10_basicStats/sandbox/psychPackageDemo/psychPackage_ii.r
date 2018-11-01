# date: 3 Nov 2017
# ref: https://cran.r-project.org/web/packages/psych/psych.pdf
# ref: http://personality-project.org/r/psych/
# following the Psych R package discussion in
# http://personality-project.org/r/psych/HowTo/factor.pdf

library(tidyverse)
library(psych)

data(sat.act)
View(sat.act)

# See the performance over the tests according to Male and Female divisions.
violinBy(sat.act[5:6],sat.act$gender,grp.name=c("M", "F"),main="Density Plot by gender for SAT V and Q")
describe(sat.act)

#Map out the means according to gender using a "cat's eye" plot. 
# error.bars show the 95 % confidence intervals for each variable in a data frame or matrix.
# These errors are based upon normal theory and the standard errors of the mean. Alternative options include +/- one standard deviation or 1 standard error. If the data are repeated measures, the error bars will be reflect the between variable correlations. By default, the confidence intervals are displayed using a “cats eyes” plot which emphasizes the distribution of confidence within the confidence interval.

error.bars.by(sat.act,sat.act$gender==2)
# note the means from the above error.bars plot can be found in the below describe()
describe(sat.act)


View(bfi)
# data = bfi, show the side distributions of males and females according to age.
with(bfi,{bi.bars(age,gender,ylab="Age",main="dataset = epi.bfi, Age by males and females")})

# data= sat.act, show the side distributions of males and females according to age.
with(sat.act,{bi.bars(age,gender,ylab="edu",main="data = sat.act; Age by Gender")})

with(sat.act,{bi.bars(SATV,education,ylab="Age",main="SATV by education")}) # is this helpful plotting?
with(sat.act,{bi.bars(gender,SATV,ylab="Age",main="SATV by education")})  # is this helpful plotting??

# a more complicated inquiry
# the proportion of education level between males and females according to the sat.act data. 
# what age group is the most educated?
T <- with(sat.act,table(gender,education))
rownames(T) <- c("M","F")
error.bars.tab(T,way="both",ylab="Proportion of Education Level",xlab="Level of Education", main="Proportion of sample by education level")

#another way to study the means
errorCircles(2,5,group=2,data=sat.act,circles=FALSE,pch=16,colors="blue", ylim= c(200,800),main="SATV by education",labels="")

# Evaluation of mfilm data #
########################################
# changing the data to "affect" which was collected in experiments to determine how people react to films.  
op <- par(mfrow=c(1,2))
data(affect)
colors <- c("black","red","white","blue")
films <- c("Sad","Horror","Neutral","Happy")
op <- par(mfrow=c(1,1))
affect.stats <- errorCircles("EA2","TA2",data=affect[-c(1,20)],group="Film",labels=films, xlab="Energetic Arousal", ylab="Tense Arousal",ylim=c(10,22),xlim=c(8,20),pch=16, cex=2,colors=colors, main =' Movies effect on arousal')
errorCircles("PA2","NA2",data=affect.stats,labels=films,xlab="Positive Affect", ylab="Negative Affect", pch =16,cex=2,colors=colors, main ="Movies effect on affect")

########################################

# make some perfect correlations
ageAndNew_perfectCorr <- mutate(sat.act, new = sat.act$age,negativeAge = -age)

# A zoom-in: see only those columns that actually correlate in some way
pairs.panels(ageAndNew_perfectCorr[c(3,7,8)])

# show all plots
pairs.panels(ageAndNew_perfectCorr)

#get the correlation values numbers using the "pearson" method
cor(ageAndNew_perfectCorr, method = "pearson")

# heatmaps to determine correlation

#note that these numbers are the same as those in the correlation plot.
corPlot(ageAndNew_perfectCorr, numbers = TRUE)


corPlot(ageAndNew_perfectCorr,main="ageAndNew_perfectCorr")


# different ways to show this graph.
corPlot(ageAndNew_perfectCorr, numbers=FALSE,upper=FALSE,diag=FALSE,main="Cognitive variables from sat.act")

corPlot(ageAndNew_perfectCorr, numbers=TRUE,upper=FALSE,diag=FALSE,main="Cognitive variables from sat.act")

corPlot(ageAndNew_perfectCorr, numbers=TRUE,upper=TRUE,diag=FALSE,main="Cognitive variables from sat.act")

#diagonal line for self-correlation
corPlot(ageAndNew_perfectCorr, numbers=TRUE,upper=TRUE,diag=TRUE,main="Cognitive variables from sat.act")

#new data: Thurstone 
# data concerns written language
#View(Thurstone)
corPlot(Thurstone,numbers=TRUE,upper=FALSE,diag=FALSE,main="9 cognitive variables from Thurstone")
pairs.panels(Thurstone)


# a more complex heatmap.
# we go around a circle and find correlations based on the sim.circ(n) function

circ <-sim.circ(24)
r_circ <- cor(circ)
corPlot(r_circ,numbers = FALSE)
corPlot(r_circ,numbers = TRUE)


#more rotations (more data)
circ <-sim.circ(60)
r_circ <- cor(circ)
corPlot(r_circ,numbers = FALSE)
corPlot(r_circ,numbers = TRUE) # there is no use in printing numbers when they cannot be seen

#and more rotations:
circ <-sim.circ(100)
r_circ <- cor(circ)
corPlot(r_circ,numbers = FALSE)
#corPlot(r_circ,numbers = TRUE) # there is no use in printing numbers when they cannot be seen




# Radar or Spider plots

#Radar plots and spider plots are just two of the many ways to show multivariate data. radar plots correlations as vectors ranging in length from 0 (corresponding to r=-1) to 1 (corresponding to an r=1). The vectors are arranged radially around a circle. Spider plots connect the end points of each vector. The plots are most appropriate if the variables are organized in some meaningful manner.
#change y to another number, sets the correlation 
spider(y=2,x=2:9,data=Thurstone,connect=TRUE) #a radar plot: check all the values of the vocabulary row with its column entries.


# use the spider plot to show correlations
cor(sat.act)
s_corValues <- cor(sat.act) # build a correlation matrix
# show this correlation matrix

#View(s_corValues)
#describe(s_corValues)

spider(y = 1, x = 1:5, data = s_corValues) # check the column entries for a specific row
pairs.panels(s_corValues) # check all the entries at once



# statistical tests over correlation:
corr.test(sat.act)
pairs.panels(sat.act)
#The corr.test function reports correlations, cell sizes, and raw and adjusted probability values. corr.p reports the probability values for a correlation matrix.

#####################

#another correlation test, more statistical power since there is the p-value shown

ct <- corr.test(attitude)  #find the correlations and give the probabilities
ct #show the results
cts <- corr.test(attitude[1:3],attitude[4:6]) #reports all values corrected for multiple tests

#corr.test(sat.act[1:3],sat.act[4:6],adjust="none")  #don't adjust the probabilities



#take correlations and show the probabilities as well as the confidence intervals
corr.test(sat.act)
pairs.panels(sat.act)


#do not adjust the probabilities
print(corr.test(sat.act[1:3],sat.act[4:6],adjust="none"),short=FALSE)  

print(corr.test(ageAndNew_perfectCorr[1:3],sat.act[4:6],adjust="none"),short=FALSE)  

pairs.panels(ageAndNew_perfectCorr[4:8])
print(corr.test(ageAndNew_perfectCorr[1:3],ageAndNew_perfectCorr[4:8],adjust="none"),short=FALSE)

cortest(sat.act)
#To test whether a matrix of correlations differs from what would be expected if the popu- lation correlations were all zero, the function cortest follows Steiger (1980) who pointed out that the sum of the squared elements of a correlation matrix, or the Fisher z score equivalents, is distributed as chi square under the null hypothesis that the values are zero (i.e., elements of the identity matrix). This is particularly useful for examining whether correlations in a single matrix differ from zero or for comparing two matrices. Although obvious, cortest can be used to test whether the sat.act data matrix produces non-zero correlations (it does). This is a much more appropriate test when testing whether a residual matrix differs from zero.


# so we have a correlation: Now let's build a model.
setCor(y = c( "SATV","SATQ"), x = c("education" ,"age" ), data = sat.act, std=TRUE)
#setCor will take raw data or a correlation matrix and find (and graph the path diagram) for multiple y variables depending upon multiple x variables.

#setCor: Finds Cohen's Set Correlation between a predictor set of variables (x) and a criterion set (y). Also finds multiple correlations between x variables and each of the y variables. Will work with either raw data or a correlation matrix. A set of covariates (z) can be partialled from the x and y sets. Regression diagrams are automatically included.

# build a directional model where dependent variables are, y = c( "age", "education") and independent variables are, x = c("SATQ","SATV","ACT")

setCor(y = c( "age", "education"), x = c("SATQ","SATV","ACT"), data = ageAndNew_perfectCorr, std=TRUE)


# we note that the values are the correlation values from the pairs.panel
pairs.panels(ageAndNew_perfectCorr)


#more models to come

