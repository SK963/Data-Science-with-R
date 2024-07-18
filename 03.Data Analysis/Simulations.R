
# major prefixes with a distribution
# 
# - d for density
# - r for random number generation
# - p for cumulative distribution
# - q for quantile function

#Normal distribution
?rnorm

#Syntax
# dnorm(x, mean = 0, sd = 1, log = FALSE)
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# rnorm(n, mean = 0, sd = 1)



#rnorm <- Generating random Normal Variates (numbers of Normal Distribution)

x <- rnorm(10)
#generates random numbers with mean 0 and sd 1
x
summary(x)

y <- rnorm(10,20,2)
#generates random numbers with mean 20 and sd 2
y
summary(y)

#Setting the random numbers seed set.seed ensure reproducibility

# Saving the current RNG state
current_seed <- .Random.seed
current_seed

# Restoring the saved RNG state
.Random.seed <- current_seed

# Set RNG to 'Mersenne-Twister'
RNGkind(kind = "Mersenne-Twister")

# Check the current RNG type
RNGkind()
# Set RNG to behave as in R version 3.6.0
RNGversion(vstr = "3.6.0")

# Set seed to 123
set.seed(seed = 123)

?set.seed



set.seed(1)
rnorm(5)
rnorm(5)
#reset set.seed
set.seed(1)
rnorm(5)
rnorm(5)


#poission distribution
#syntax
# dpois(x, lambda, log = FALSE)
# ppois(q, lambda, lower.tail = TRUE, log.p = FALSE)
# qpois(p, lambda, lower.tail = TRUE, log.p = FALSE)
# rpois(n, lambda)

#rpois <- generating poisson data (randon numbers of poission distribution)

a <- rpois(10,1)
a
summary(a)

b <- rpois(10, 2)
b
summary(b)

c <- rpois(10, 20)
c
summary(c)


#Generating Random Numbers From a Liner Model

set.seed(20)
x <- rnorm(100)
e <- rnorm(100,0,2)
y <- 0.5 + 2*x + e
y

summary(y)
plot(x,y)

#-----------------
set.seed(10)
x <- rbinon(100 , 1, 0.5)
e <- rnorm(100 , 0 , 2)
y <- 0.5 + 2 * x + e
y
summary(y)
plot(x,y)

#------------------
#simmulating from a poission distribution 

set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 *x
y <- rpois(100  , exp(log.mu))
summary(y)

plot(x,y)


# Random Sampling

set.seed(1)
?sample
sample(1:10 , 4)

sample(letters , 5)

sample(1:10)

sample(1:10 , replace = T)
















