# Date: 19 Nov 2018
# Class exercise using Gapminder data

library(gapminder)
library(tidyverse)
library(psych)

# Explain what the lines of code are doing.

# 1) 
sapply(gapminder, typeof) # get to know the data

# 2) 
mean(gapminder$gdpPercap)


# 3)
range(gapminder$year)

# 4) 
max(gapminder$pop)

# 6) 
min(gapminder$pop)

# 7)
range(gapminder$pop)

# 8) 
attach(gapminder) 

# 9)
median(gapminder$pop)

# 10)
unique(gapminder$country)

# 11) 
summary(gapminder %>% filter(country == "Nepal"))
summary(gapminder %>% filter(country == "Switzerland"))
summary(gapminder %>% filter(country == "Denmark"))

# 12) 
summary(gapminder %>% filter(country == "Australia"))
summary(gapminder %>% filter(country == "Chile"))
summary(gapminder %>% filter(country == "China"))

# 13) 
summary(gapminder %>% filter(country == "Australia"|country == "Chile"))

# 14)
boxplot(lifeExp ~ continent)


# 15) 
boxplot(lifeExp ~ year)


# 16)
vd <- gapminder %>% filter( country == "Denmark")
#View(vd)
boxplot(data = vd,lifeExp ~ year)


# 17) 
vd <- gapminder %>% filter( country == "India")
#View(vd)
boxplot(data = vd,lifeExp ~ year)


# 18) 
gapminder %>% filter(gdpPercap < 50000) %>% ggplot(aes(x = log(gdpPercap), y=lifeExp, col = continent, size = pop, col = continent)) + geom_point(alpha = 0.3) + geom_smooth() + facet_wrap(~country)


# 19) 
gapminder %>% filter(country == "Senegal", gdpPercap < 50000) %>% ggplot(aes(x = log(gdpPercap), y=lifeExp, col = continent, size = pop, col = continent)) + geom_point(alpha = 0.3) + geom_smooth() + facet_wrap(~country)


# 20) 
gapminder %>% filter(gdpPercap < 50000) %>% ggplot(aes(x = log(gdpPercap), y=pop, size = pop)) + geom_point(alpha = 0.3) + geom_smooth() + facet_wrap(~continent)


# 21) 
gapminder %>% filter(gdpPercap < 50000) %>% ggplot(aes(x = year, y=lifeExp, col = continent, size = pop )) + geom_point(alpha = 0.3) + geom_smooth() + facet_wrap(~country)


# 22) 

gapminder %>% filter(gdpPercap < 50000) %>% ggplot(aes(x = log(gdpPercap), y=lifeExp, col = year, size = pop)) + geom_point(alpha = 0.3) + geom_smooth(method = "lm") + facet_wrap(~continent)

# 23) 
pairs.panels(gapminder)

