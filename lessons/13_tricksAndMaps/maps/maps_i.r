# Date: 19 Nov 2018
# Map tutorial

# Based on code by Eric C. Anderson, modified by OBC 
#ref: http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html


#install.packages(c("ggplot2", "devtools", "dplyr", "stringr", "mapdata"))

# some standard map packages.
#install.packages(c("maps", "mapdata"))
#install.packages("mapdata") # load "all"


library(ggplot2)
library(devtools)
library(dplyr)
library(stringr)
library(maps)
library(mapdata)
library(ggmap)

devtools::install_github("dkahle/ggmap")
usa <- map_data("usa")
dim(usa)
head(usa)
#>        long      lat group order region subregion
#> 1 -101.4078 29.74224     1     1   main      <NA>
#> 2 -101.3906 29.74224     1     2   main      <NA>
#> 3 -101.3620 29.65056     1     3   main      <NA>
#> 4 -101.3505 29.63911     1     4   main      <NA>
#> 5 -101.3219 29.63338     1     5   main      <NA>
#> 6 -101.3047 29.64484     1     6   main      <NA>

tail(usa)
#>           long      lat group order         region subregion
#> 7247 -122.6187 48.37482    10  7247 whidbey island      <NA>
#> 7248 -122.6359 48.35764    10  7248 whidbey island      <NA>
#> 7249 -122.6703 48.31180    10  7249 whidbey island      <NA>
#> 7250 -122.7218 48.23732    10  7250 whidbey island      <NA>
#> 7251 -122.7104 48.21440    10  7251 whidbey island      <NA>
#> 7252 -122.6703 48.17429    10  7252 whidbey island      <NA>
#
w2hr <- map_data("world2Hires")
library(maps)

dim(w2hr)


head(w2hr)
#>       long      lat group order region subregion
#> 1 226.6336 58.42416     1     1 Canada      <NA>
#> 2 226.6314 58.42336     1     2 Canada      <NA>
#> 3 226.6122 58.41196     1     3 Canada      <NA>
#> 4 226.5911 58.40027     1     4 Canada      <NA>
#> 5 226.5719 58.38864     1     5 Canada      <NA>
#> 6 226.5528 58.37724     1     6 Canada      <NA>

tail(w2hr)
#>             long      lat group   order      region subregion
#> 2276817 125.0258 11.18471  2284 2276817 Philippines     Leyte
#> 2276818 125.0172 11.17142  2284 2276818 Philippines     Leyte
#> 2276819 125.0114 11.16110  2284 2276819 Philippines     Leyte
#> 2276820 125.0100 11.15555  2284 2276820 Philippines     Leyte
#> 2276821 125.0111 11.14861  2284 2276821 Philippines     Leyte
#> 2276822 125.0155 11.13887  2284 2276822 Philippines     Leyte

# build a filled-in map of usa
usa <- map_data("usa") # we already did this, but we can do it again
ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group)) +  coord_fixed(1.3)

# build in a line drawing of map
ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = NA, color = "red") + coord_fixed(1.3)


# add some colour to map
gg1 <- ggplot() + geom_polygon(data = usa, aes(x=long, y = lat, group = group), fill = "violet", color = "blue") + coord_fixed(1.3)
gg1


# Add some points to the map: first load data.frame() function containing points, and then load plotting code below

labs <- data.frame(
  long = c(-122.064873, -122.306417,-80.182403,-80.182403),
  lat = c(36.951968, 47.644855,41.6487607,41.6487607),
  names = c("SWFSC-FED", "NWFSC"),
  stringsAsFactors = FALSE
)  

gg1 + geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 5) + geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 4)


# put only Meadville on the map

meadville <- data.frame(
  long = c(-80.182403),
  lat = c(41.6487607),
  names = c("SWFSC-FED", "NWFSC"),
  stringsAsFactors = FALSE
)  

gg1 + geom_point(data = meadville, aes(x = long, y = lat), color = "black", size = 5) + geom_point(data = meadville, aes(x = long, y = lat), color = "yellow", size = 4)


# state maps

states <- map_data("state")
dim(states)
head(states)
#>        long      lat group order  region subregion
#> 1 -87.46201 30.38968     1     1 alabama      <NA>
#> 2 -87.48493 30.37249     1     2 alabama      <NA>
#> 3 -87.52503 30.37249     1     3 alabama      <NA>
#> 4 -87.53076 30.33239     1     4 alabama      <NA>
#> 5 -87.57087 30.32665     1     5 alabama      <NA>
#> 6 -87.58806 30.32665     1     6 alabama      <NA>

tail(states)
#>            long      lat group order  region subregion
#> 15594 -106.3295 41.00659    63 15594 wyoming      <NA>
#> 15595 -106.8566 41.01232    63 15595 wyoming      <NA>
#> 15596 -107.3093 41.01805    63 15596 wyoming      <NA>
#> 15597 -107.9223 41.01805    63 15597 wyoming      <NA>
#> 15598 -109.0568 40.98940    63 15598 wyoming      <NA>
#> 15599 -109.0511 40.99513    63 15599 wyoming      <NA>


ggplot(data = states) + geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + coord_fixed(1.3) + guides(fill=FALSE)  # do this to leave off the color legend

#map of the west coast
west_coast <- subset(states, region %in% c("california", "oregon", "washington"))

ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat), fill = "palegreen", color = "black") 

ggplot(data = west_coast) + 
  geom_polygon(aes(x = long, y = lat, group = group), fill = "palegreen", color = "black") + 
  coord_fixed(1.3)

# Plot California

ca_df <- subset(states, region == "california")

head(ca_df)
#>          long      lat group order     region subregion
#> 667 -120.0060 42.00927     4   667 california      <NA>
#> 668 -120.0060 41.20139     4   668 california      <NA>
#> 669 -120.0060 39.70024     4   669 california      <NA>
#> 670 -119.9946 39.44241     4   670 california      <NA>
#> 671 -120.0060 39.31636     4   671 california      <NA>
#> 672 -120.0060 39.16166     4   672 california      <NA>

# Now, let’s also get the county lines there

counties <- map_data("county")


# California
ca_county <- subset(counties, region == "california")

head(ca_county)
#>           long      lat group order     region subregion
#> 6965 -121.4785 37.48290   157  6965 california   alameda
#> 6966 -121.5129 37.48290   157  6966 california   alameda
#> 6967 -121.8853 37.48290   157  6967 california   alameda
#> 6968 -121.8968 37.46571   157  6968 california   alameda
#> 6969 -121.9254 37.45998   157  6969 california   alameda
#> 6970 -121.9483 37.47717   157  6970 california   alameda


ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "gray")
ca_base + theme_nothing()

# plot the boundaries
ca_base + theme_nothing() + 
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)  # get the state border back on top







########################
# PA
# Plot Pennsylvania

ca_df <- subset(states, region == "pennsylvania")

head(ca_df)
# Now, let’s also get the county lines there
counties <- map_data("county")


# Pennsylvania
ca_county <- subset(counties, region == "pennsylvania")

head(ca_county)


ca_base <- ggplot(data = ca_df, mapping = aes(x = long, y = lat, group = group)) + 
  coord_fixed(1.3) + 
  geom_polygon(color = "black", fill = "gray")
ca_base + theme_nothing()

# plot the boundaries
ca_base + theme_nothing() + 
  geom_polygon(data = ca_county, fill = NA, color = "white") +
  geom_polygon(color = "black", fill = NA)  # get the state border back on top

# Can you plot another state?!


