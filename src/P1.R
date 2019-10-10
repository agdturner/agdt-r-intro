# Create two variables x and y.
x = matrix(c(1,2,3,4,5,6,7,8), nrow = 4)
y = matrix(1:8, nrow = 4, byrow = T)
# Print the x and y variable values to the console.
x
y
# Read into R a file that holds population data for census areas in 
# Liverpool. I've added the relative file path to these.
oa <- read.csv("../homework/liverpool_oa.csv", header=TRUE)
# Print some things out about the variable oa that holds what was read 
# in from the file.
oa
str(oa)
class(oa)
names(oa)
# Plot some things. The option pch=16 sets the plotting character to 
# a solid black dot. More plot characters are available - examine the 
# help for points():
plot(age_pop ~ emp_pop, data=oa, pch=16)
?points
# Plot the data another way.
plot(x = oa$age_pop, y = oa$emp_pop, pch = 1, col = "dodgerblue",
     cex = 0.5, xlab = "Pop1", ylab = "Pop2", main = "Hello World!")
# Exercises
elasticband <- data.frame(stretch=c(46,54,48,50,44,42,52),
                          distance=c(148,182,173,166,109,141,166))
# The function data.frame() can be used to input these (or other) 
# data directly into data.frame objects.
# 1. Plot distance against stretch from the elasticband data frame.
plot(stretch~distance, data = elasticband)
# or
plot(elasticband$stretch, elasticband$distance)
# 2. Use the hist() command to plot a histogram of the age_pop values 
#    in oa (hints: a) think about how the alternative plot was 
#    parameterised and the fact that histograms are constructed from 
#    a single variable, and b) examine the help for hist by entering 
#    ?hist at the console)
hist(oa$age_pop)
# Of course, some refinement is possible.
hist(oa$age_pop, xlab='Population Total for Age variables in the Census',
     main='Histogram of OA Population',
     col = 'DarkRed', breaks = 50)
# The code below plots a probability density of the same data. Essentially 
# what this does is normalize the histogram total are to 1
hist(oa$age_pop, prob = T,
     xlab='Population Total for Age variables in the Census',
     main='Histogram of OA Population',
     col = 'DarkRed', breaks = 50, border = "#FFFFBF")
# add the probability density trend
lines(density(oa$age_pop,na.rm=T),col='salmon',lwd=2)
# show the frequencies at the bottom - like a rug!
rug(oa$age_pop)
# 3. Repeat 2 after taking logarithms of age_pop cover using the 
#    log() function.
hist(log(oa$age_pop), breaks = 50)
hist(log(oa$age_pop), prob = T,
     xlab='Population Total for Age variables in the Census',
     main='Histogram of OA Population',
     col = 'DarkRed', breaks = 50, border = "#FFFFBF")
lines(density(log(oa$age_pop),na.rm=T),col='salmon',lwd=2)
