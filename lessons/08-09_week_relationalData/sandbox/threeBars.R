library(tidyverse)
library(dslabs)
library(dplyr)
dat <- filter(us_contagious_diseases, disease == "Measles") %>% mutate(rate = (count/ population) * 100000 * (weeks_reporting/52))
# Filter out all data except in the years 1950, 1960, and 1970
dat_measles_rate_lessTwoStates <- dat %>% filter(year == 1950 | year == 1960 | year  == 1970)
#create some “block”, containers to hold the data for each year.
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1950]<- "1950’s"
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1960]<- "1960’s"
dat_measles_rate_lessTwoStates$yearBlock[dat_measles_rate_lessTwoStates$year == 1970]<- "1970’s"
#Without transformation, Multi-bar per state,
ggplot(data = dat_measles_rate_lessTwoStates) + geom_bar(mapping = aes(x = state, y = count, fill = yearBlock), position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))
