2+2
sqrt(10)
2*3*4*5
# Interest on $1000, compounded annually
# at 7.5% p.a. for five years
1000*(1+0.075)^5 - 1000
# R knows about pi
pi # pi
#Circumference of Earth at Equator, in km; radius is 6378 km
2*pi*6378
sin(c(30,60,90)*pi/180) # Convert angles to radians, then take sin()
# Read into R a file that holds population data for census areas in 
# Liverpool. I've added the relative file path to these.
oa <- read.csv("../homework/liverpool_oa.csv", header=TRUE)
# Shows different summaries of the individual attributes in oa.
summary(oa)
# The main R graphics function is plot(). In addition to plot() there are 
# functions for adding points and lines to existing graphs, for placing 
# text at specified positions, for specifying tick marks and tick labels, 
# for labeling axes, and so on. There are various other alternative helpful 
# forms of graphical summary. A helpful graphical summary for the oa data 
# frame is the scatterplot matrix, shown in Figure 3.
names(oa)
## [1] "oa_id" "age_pop" "u16" "u25" "u45"
## [6] "u65" "o65" "emp_pop" "econ_active" "employed"
## [11] "unemployed"
names(oa)[c(3:5, 11)]
## [1] "u16" "u25" "u45" "unemployed"
c(3:5, 11)
## [1] 3 4 5 11
plot(oa[,c(3:5, 11)], cex = 0.3,
     col = grey(0.145,alpha=0.5), upper.panel=panel.smooth)
# The results show the correlations between the 3rd, 4th, 5th and 11th 
# variables in the oa data from a and the average relationship with the 
# upper.panel=panel.smooth parameter passed to plot. There are number of 
# things to notice here (as well as the figure). In particular note the 
# use of the vector c(3:5, 11) to subset the columns of oa:
#  • In the second line is was used to subset the vector of column names 
#    created by names(oa).
#  • In the third line it was printed out. Notice how 3:5 printed out all 
#    the number between 3 and 5 - very useful.
#  • For the plot the vector was passed to the second argument, after the 
#    comma, in the square brackets [,] to indicate which columns were to 
#    be plotted. The vector is contained in the round brackets preceded 
#    by a c which tells R to combine all of the arguments passed to it 
#    c(...)
# The referencing in this way is very important: the individual rows and 
# columns of 2 dimensional data structures like data frames, matrices, 
# tibbles etc can be accessed by passing references to them in the square 
# brackets.
# 1st row
oa[1,]
# 3rd column
oa[,3]
# a selection of rows
oa[c(3:5,11),]
# Such indexing could of course have been assigned to a R object and used 
# to do the subseting:
x = c(3:5, 11)
names(oa)[x]
plot(oa[,x], cex = 0.3, col = grey(0.145,alpha=0.5))
# This is sometimes referred to as indexing - indexes of specific rows and 
# columns can be found and then used to pull out data as required.
