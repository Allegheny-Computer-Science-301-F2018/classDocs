# date: 18 Oct 2018
# ref: https://projects.fivethirtyeight.com/trump-approval-ratings/

library(tidyverse)
library(lubridate)

#polllist <- file.choose() # filename of the data
#pollData <- read.csv(polllist, header = TRUE) # import the data from the file that we chose

pollData <- read.csv("~/Desktop/here/approval_polllist_17Oct2018.csv", header = TRUE) # import the data from the file

View(pollData) # make sure that the data set was actually loaded!
names(pollData) # check the column (headers) names

mdy(pollData$startdate)

# format the times for my x-axis in my plots
# create a new data table with formatted data column

newPollData <- pollData %>% mutate(myStart_date = mdy(pollData$startdate)) %>% mutate(myEnd_date = mdy(pollData$enddate))


### plot adjusted approval data ###

# all black points
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve))

# add colour (looks good)
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve))

# add colour part 2
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve, colour = samplesize))

### plot adjusted disapproval data ###
# add colour (looks good)
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove))




### plot approval data ###
# add colour (looks good)
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = approve, colour = approve))


### plot disapproval data ###
# add colour (looks good)
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = disapprove, colour = disapprove))



### add the consus line ###

# adj approval
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve) )

# adj disapproval
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove) )

### put both plots (adj_approval and adj_dissapproval) together in same plot###

cat(" Both plots together: adj Dissapproval (top)
  and adj Approval (bottom)")
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove) ) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve) )

# make a file of results

png("~/Desktop/here/adj_disapp_ajd_app.png")
ggplot(data = newPollData) + geom_point(mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_disapprove, colour = adjusted_disapprove) ) + geom_point(mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve)) + geom_smooth( mapping = aes(x = myStart_date, y = adjusted_approve, colour = adjusted_approve) )
dev.off()
