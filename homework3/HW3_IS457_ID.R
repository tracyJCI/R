# HW 3 - Due Monday, Feb 26th, 2018. 
# Upload R file to Moodle. Do Not remove any of the comments. These are marked by #. 
# The .R file will contain your code and answers to questions.

# Main topic: Using the “apply” family function.

# Part 1: let's start with "apply". (2 pts each)
# create a 10-by-10 matrix for manipulation.
set.seed(1120)
some_matrix = matrix(rnorm(100), ncol = 10)  # standard normal dist
some_matrix[1, 3]= some_matrix[5,5]=some_matrix[10, 2]= some_matrix[6,8] = NA

# think about how to deal with NA.

# 1a, what's the variance of the observations in each row of the matrix? 


# 1b, sort (all) the columns of the above matrix 


# 1c, find the total number of negative values by column in some_matrix.
# your answer should be a vector of integer of length 10.



# Part 2: let's play with "sapply". (2 pts each)


# 2a, find the square root, the square and the cube of the numbers 1 to 10.
# (hint: think about how to define the function first; your answer should be a 3-by-10 matrix.)


# 2b, we played with the data set mtcars previously.
# now find the class of each variable(column) 



# Part 3: the next is "lapply"! (2 pts each)


# 3a, same as 2b), but using "lapply", and get your function output as a vector as well.  
# (hint: what does "lapply" return? how to convert it to a vector?)


# 3b, from 3a), what do you observe about the relationship, the difference 
# between "sapply" and "lapply"? (hint: think about their inputs and outputs)


# 3c, here I create some random data
set.seed(1120)
rndm <- replicate(15, runif(sample(1:10, 1)), simplify = FALSE)

# first, what did the above code generate? name the data structure, the length, 
# and the content as well as giving a description.


# 3d, using "lapply", return the lengths of each component in rndm.


# 3e, now create the following list:
list_a <- list(c=c(11:20), d=c(31:40))

# take the (natural) log of EACH element in list_a


# explain why log2(list_a) doesn't work. (hint: help manual, look at the function input format)



# Part 4: the "tapply" and its equivalent. (2 pts each)
# we will use the data set "iris"; familiarize yourself with it first:
data(iris)

# 4a, find the mean petal length by species.


# 4b, look up the function "by"
# obtain the mean of the 4 features, by species, but using only one function call.


# 4c, same as 4b), but using "aggregate" function.


# 4d, same as 4b), but using the combination of "apply" and "tapply".
# (hint: nested function)


# Part 5: other apply functions. (2 pts each)


# 5a, look up the function "mapply"
# we create list_a in 3f).
list_b <- list(a=1:10, b=21:30)

# What is the sum of the corresponding elements of list_a and list_b,in one function call?
# Your result should be a vector of length 10.


# 5b, look up the function "rapply"
# same as 3f), but using rapply function, get your function output as a list as well.
# (hint: take a look at the function parameters)



# Part 6: to sum up... (2 pts each)


# 6a, 
# give an example or detailed explanation of and example of  when the "apply" family function 
# doesn't work, we have to use for loop(s).


# 6b, to make sure you really know how to apply "apply", 
# give an example of, two nested "apply" family functions, explain what you did.
# e.g., apply(apply(some_matrix,2,is.na), 2, sum), this gives you the number 
# of NA's in each column. It's just for illustration, you can do this with one "apply" too.

# anything similar to the example above doesn't count.


# Part 7: linear regression. (5pts)

# Using the family data, fit a linear regression model to predict weight from height. 
# comment on the output; how do you interpret this model? (hint: lm() function)


# Create a scatterplot of height vs weight. Add the linear regression line you found above. 
# Provide an interpretation for your plot.
