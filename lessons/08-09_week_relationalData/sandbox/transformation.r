n <- 5
p<-0.25

# get some random data
x <- rbinom(100, n, p)

# no transformation
plot(x^x)

#With log transformation
plot(log(x^x))
