# HW 6 - Due Thursday, Apr 5th, 2018. 
# Upload R file to Moodle. Do Not remove any of the comments. These are marked by #. 
# The .R file will contain your code and answers to questions.

# Main topic: practice plotting techniques

### This homework consists of 5 problems, 20 pts each.
# 15 pts for plotting (is it info rich, does it facilitate comparisons, use of color/axis/legend, etc), 
# 5pts for descriptions of your plot (interpretation, findings).

data("mtcars")
library(ggplot2)

### Q1, use coloring for multi-level variables (ggplot)
# create a scatterplot showing the relationship between horsepower(hp) and gas mileage(mpg) separately for 
# transmission (am) and engine type (vs). The number of cylinders in each automobile engine is represented by 
# both shape(symbol) and color.

#hint: your plot should consist of 4 sub-plots (facet plots);
#hint: convert some variables to factor variables before plotting.

# your code here

qplot(hp, mpg, data=mtcars, shape=as.factor(cyl), color=as.factor(cyl),
facets=am~vs,size=I(3),xlab="horsepower(hp)", ylab="miles per gallon(mpg)")
# your description here
#top x margin :engine type(vs), y margin : transmission(am)
#I observe that cars with vs = 0, am = 0, consist of only 8 cylinders and also seem to have lower miles per gallon. 
#cars with vs=1,am=0 do not have 8 cylinders and they seem to have higher miles per gallon. 
#cars with vs=0,am=1,there is a negative correlation between mpg and hp, cars with higher horsepower have lower miles per gallon
#and higher number of cylinders
#cars with vs=1,am=1, only have 4 cylinders and have low horsepower but have higher miles per gallon

### Q2, display multivariate relationships: look up the manual page of package lattice
# make a boxplot to display a variable, mpg, conditioned on different values of cylinders. 
# hint: mpg grouped by factors representing cylinders, your plot should consist of 
# (num. of distinct values of cyl) smaller boxplots. 

# your code here
#install.packages("lattice")
library(lattice)
bwplot(mpg ~ cyl ,data=mtcars, ylab = "miles per gallon(mpg)", main= "box plot of mtcars mpg and cyl", 
xlab="number of cylinders(cyl)")
# your description here
# The box plot makes reveals that the for a 6 cylinder car, the maximum mpg is equal to the minumum mpg for a 4 cylinder car
# Also the maximum mpg for an 8 cylinder car is slightly less than the median mpg for a 6 cylinder car

        
### Q3, visualize a large number of labeled values using dot plots
# plot the sorted mpg values with car types on the y axis, grouped by cylinders
# your graph should have a grid

# your code here

dotchart(mtcars$cyl,sort(mtcars$mpg),main="dot plot of mtcars mpg and cyl ", 
xlab= "number of cylinders(cyl)", ylab="miles per gallon(mpg)",panel.first = grid(col= "blue"))

# your description here
#this is a dot plot representing the sorted values of the mpg variable in the mtcars dataset 
#on the y axis and the cyl variable on the x axis.From this plot, we can see exactly how many observations
#there are in each cylinder category and their exact mpg values 
# 11 observations in 4 cylinders
# 7 observations in 6 cylinders
# 14 observations in 8 cylinders


### Q4, comparing distributions
# suppose we have 3 distributions as follows: rnorm(300,4), rnorm(200,6), rnorm(100, 8).
# plot them on the same graph, one color each distribution, with rainbow colors.
# overlapping areas should have different/darker colors.
# your code here
set.seed(123)
plot(density(rnorm(300,4)), col="purple",xlim=c(0,12),ylim=c(0.0,0.48),lwd=2, main = "Plot comparing 3 normal distributions")
set.seed(123)
lines(density(rnorm(200,6)),col="red",lwd=2)
set.seed(123)
lines(density(rnorm(100,8)),col="blue",lwd=2)
# your description here
# This plot contains three normal distributions each with different means, N,

### Q5, stack bar plots with gradient colors
# use two categorical variables, cylinders and gears, to create stacked bar charts 
# your y axis should be frequency.
# use the same color but darker shades indicating higher number of cylinders.

# hint: you can create a contingency table to help you plot

# your code here
cyl_gear= table(mtcars$cyl,mtcars$gear)
barplot(cyl_gear, main="STACK BAR PLOT OF MTCARS CYL AND GEAR",ylim = c(0,16), xlab="GEARS",ylab="Frequency", 
col =c("green","green3","green4"))
legend("right", title="Cylinders",legend= sort(unique(mtcars$cyl)), fill =c("green","green3","green4"))
# your description here
#this is a stack bar plot with gradient colors representing two categorical variables ,cylinders and gears. 
#it shows the frequency of each gear type and the cylinder distribution within each gear type
#3 gear cars have a high frequency of 8 cylinders and smaller frequency of 6,4 cylinders
#4 gear cars have a high frequency of 4 cyclinders,smaller frequency of 6 cylinders and no 8 cylinders
#5 gear cars have 4,6 and 8 cylinders        
        
