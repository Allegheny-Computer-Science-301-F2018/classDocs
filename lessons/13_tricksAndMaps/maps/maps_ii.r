# Date: 19 Nov 2018
# ref: https://sesync-ci.github.io/maps-in-R-lesson/2016/09/14/
# drawing maps to the screen


#install.packages("rgdal")
#install.packages("PBSmapping")
#install.packages("maptools")

library(rgdal)
library(tidyverse)
library(PBSmapping)
library(maptools)


data_file <- file.choose()
#data_file <- "data/gz_2010_us_040_00_500k/gz_2010_us_040_00_500k.shp"
#load a shape file


# load a shape file
usShape <- importShapefile( data_file,readDBF=TRUE)
# File to load: gz_2010_us_040_00_500k.shp

# Display basic statistics of the file
# summary(usShape) # to show us what this data is.

# plot a world-size map featuring the US
plotPolys(usShape)

plotPolys(usShape,  xlim=c(-130,-60),ylim=c(20,50))

counties_md <- readOGR(data_file)

Nebraska <- counties_md[counties_md[["NAME"]] == "Nebraska", ]
#plot(counties_md)
plot(Nebraska, col = "red", add = TRUE)

PA <- counties_md[counties_md[["NAME"]] == "Pennsylvania", ]
#plot(counties_md)
plot(PA, col = "red", add = TRUE)

IA <- counties_md[counties_md[["NAME"]] == "Iowa", ]
#plot(counties_md)
plot(IA, col = "red", add = TRUE)
