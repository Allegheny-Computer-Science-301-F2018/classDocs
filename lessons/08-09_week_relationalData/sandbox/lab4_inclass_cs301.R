# date: 25 Oct 2018
# lab4 code

library(tidyverse)
library(dslabs)
library(dplyr)
ggplot(data = us_contagious_diseases) + geom_point(mapping = aes(x = year,y = count, color = year)) + geom_vline(xintercept = 1965, color = "red")


View(us_contagious_diseases)


#Add the rate column to the data:
dat_measles_rate <- filter(us_contagious_diseases, disease == "Measles") %>% mutate(rate = (count/population) * 100000 * (weeks_reporting/52))


#Remove the two states (Alaska and Hawaii)
dat_measles_rate_lessTwoStates <- filter(dat_measles_rate, state != "Alaska", state != "Hawaii")
View(dat_measles_rate_lessTwoStates)
# Plot the results across 48 states
ggplot(data = dat_measles_rate_lessTwoStates, mapping = aes(x = year, y = rate, color = year)) + geom_point() + geom_vline(xintercept = 1963, color = "red") + labs(y = "Counts of Measels")


# Create table to focus on California
dat_caliFocus <- filter(dat_measles_rate_lessTwoStates,  state == "California")
View(dat_caliFocus)
ggplot(data = dat_caliFocus, mapping = aes(x = year, y = rate, color = count)) + geom_point() + geom_vline(xintercept = 1963, color = "red") + labs(y = "Counts of Measles")


#non-transformation
#plot three bars to see what happened in the 1950’s, 1960’s and 1970’.
ggplot(data = dat_caliFocus %>% filter(year == 1950 | year == 1960 | year == 1970)) + geom_bar(mapping = aes(x = year, y = count), stat = "identity")


#transformation
#plot three bars to see what happened in the 1950’s, 1960’s and 1970’s.
ggplot(data = dat_caliFocus %>% filter(year == 1950 | year == 1960 | year == 1970)) + geom_bar(mapping = aes(x = year, y = sqrt(count)), stat = "identity")




# three bars

library(tidyverse)
library(dslabs)
library(dplyr)
dat <- filter(us_contagious_diseases, disease == "Measles") %>% mutate(rate = (count/population) * 100000 * (weeks_reporting/52))
# Filter out all data except in the years 1950, 1960, and 1970
dat_measles_rate_lessTwoStates <- dat %>% filter(year == 1950 | year == 1960 | year == 1970)
#create some “block”, containers to hold the data for each year.
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1950] <-"1950’s"
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1960] <-"1960’s"
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1970] <-"1970’s"
#Without transformation, Multi-bar per state,
ggplot(data = dat_measles_rate_lessTwoStates) + geom_bar(mapping = aes(x = state, y = count,  fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))


#With transformation, Multi-bar per state,
ggplot(data = dat_measles_rate_lessTwoStates) + geom_bar(mapping = aes(x = state, y = sqrt(count),  fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
