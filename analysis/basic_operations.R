# --------------------
# Demo: a few basic operations in R
# Thomas Klee
# Created: 2018-11-27
# Updated: 2019-03-22
# --------------------

# let's begin with some basic arithmetic: What is 2 x 5?
2*5 # put the cursor on this line and press Command-Return on a Mac or Control-Return on a PC

# to store the result in an object called "a"
a <- 2*5

# notice that this created an object called "a" in the Global Envrironment panel

# put 5 numbers in a "vector"
c(10, 12, 14, 16, 18)

# store them in "a"
# this will replace the previous object called "a"
# if you don't want to replace the previous object, call this one something else
a <- c(10, 12, 14, 16, 18) 

# use an R "function" to calculate the mean of "a" 
mean(a) # this line specifies a function (mean) build into R and an argument (a)

# calculate the standard deviation
# sd is another function built into R
sd(a)

# R doesn't have a base function for calculating the standard error of the mean
# so we need to write an equation to calculate it
sem <- sd(a) / sqrt(length(a)) 

# calculate the 95% confidence interval of the mean 
c(mean(a) - 2*sem, mean(a)+2*sem)

# create another vector called "b" and calculate its mean and SD
b <- c(3, 6, 9, 12, 15)
mean(b)
sd(b)

# combine the two vectors of numbers into an object called "c"
c <- cbind(a, b)

# turn c into a data frame
d <- as.data.frame(c)

# notice this create an object called "d" in the global environment panel
# click on "d" in that panel to display the new data frame

# generate 10 random, normally distribued numbers, with a M = 100 and SD = 16
rnorm(10, mean = 100, sd = 16)

# generate another vector of numbers, but round each one to a whole number
round(rnorm(10, mean = 100, sd = 16), 0)

# calculate the mean of that "sample"
round(mean(rnorm(10, mean = 100, sd = 16)), 0)

# increase the sample size to 100 and calculate the mean of that
round(mean(rnorm(100, mean = 100, sd = 16)), 0)

# increase the sample size to 1000 and calculate the mean of that
round(mean(rnorm(1000, mean = 100, sd = 16)), 0)

# create some histograms by varying the sample size from 10 to 100 to 1000
e <- rnorm(10000, mean = 100, sd = 16)
hist(e)

# give yourself a pat on the back for making it this far
praise::praise()

# need a little more encouragement?
replicate(5, praise::praise())

# remove objects you no longer need from the Enviroment tab
rm(c, d, a, b, e, sem)

# display the software you used in this session
sessionInfo()
