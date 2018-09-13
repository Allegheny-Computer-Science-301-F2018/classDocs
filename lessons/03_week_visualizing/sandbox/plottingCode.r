library(tidyverse)
sunData <- read.table(file.choose(), header = TRUE, sep = ",")
View(sunData)


ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum))
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum))
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum, color = fracOfYear))
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum, color = month))
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum, color = month))
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum, color = month)) + geom_smooth(mapping = aes = (x = fracOfYear, y = sunSpotNum, color = fracOfYear))

ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$fracOfYear, y = sunData$sunspotNum, color = month)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear))

# By year, it looks like each ten - fourteen years, there is some kind of pattern




#### new data ####


# Could there be a pattern that repeats every decade or so??


ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$year, y = sunData$sunspotNum)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear))


# A pretty graph? is there anything new to show in the following?
ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$year, y = sunData$sunspotNum, color = sunData$month)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear))


ggplot(data = sunData) + geom_point(mapping = aes(x = sunData$year, y = sunData$sunspotNum, color = sunData$numObs)) + geom_smooth(mapping = aes(x = fracOfYear, y = sunspotNum, color = fracOfYear))



#### NEW DATA ####

#https://ggplot2.tidyverse.org/reference/mpg.html
View(mpg)



ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

# a pattern exists: heavy cars get less miles per gallon on highway
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = cty))

# a pattern exists: heavy cars get less miles per gallon in city
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color =class))

# highway miles per gallon and displacement
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color =manufacturer))
