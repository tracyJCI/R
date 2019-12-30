# HW 6 - Due Thursday, Apr 5th, 2018. 
# Upload R file to Moodle. Do Not remove any of the comments. These are marked by #. 
# The .R file will contain your code and answers to questions.

# Main topic: practice plotting techniques

### This homework consists of 5 problems, 20 pts each.
# 15 pts for plotting (is it info rich, does it facilitate comparisons, use of color/axis/legend, etc), 
# 5pts for descriptions of your plot (interpretation, findings).

data("mtcars")

### Q1, use coloring for multi-level variables (ggplot)
# create a scatterplot showing the relationship between horsepower(hp) and gas mileage(mpg) separately for 
# transmission (am) and engine type (vs). The number of cylinders in each automobile engine is represented by 
# both shape(symbol) and color.

#hint: your plot should consist of 4 sub-plots (facet plots);
#hint: convert some variables to factor variables before plotting.

# your code here

# your description here


### Q2, display multivariate relationships: look up the manual page of package lattice
# make a boxplot to display a variable, mpg, conditioned on different values of cylinders. 
# hint: mpg grouped by factors representing cylinders, your plot should consist of 
# (num. of distinct values of cyl) smaller boxplots. 

# your code here


# your description here


### Q3, visualize a large number of labeled values using dot plots
# plot the sorted mpg values with car types on the y axis, grouped by cylinders
# your graph should have a grid

# your code here


# your description here



### Q4, comparing distributions
# suppose we have 3 distributions as follows: rnorm(300,4), rnorm(200,6), rnorm(100, 8).
# plot them on the same graph, one color each distribution, with rainbow colors.
# overlapping areas should have different/darker colors.
set.seed(123)

# your code here


# your description here




### Q5, stack bar plots with gradient colors
# use two categorical variables, cylinders and gears, to create stacked bar charts 
# your y axis should be frequency.
# use the same color but darker shades indicating higher number of cylinders.

# hint: you can create a contingency table to help you plot

# your code here


# your description here




