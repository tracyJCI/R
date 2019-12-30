# Do not remove any of the comments. These are marked by #

# HW 7 - Due Monday Apr 16, 2018 in moodle and hardcopy in class.

# (1). Please upload R code and report to Moodle 
#      with filename: HW7_IS457_YourCourseID.
# (2). Turn in hard copy of your report in class.

#################   Part 1: Simulation   ##############################################

## Let X and Y be two random variables following normal distribution.
## We will use the simulation techniques to find the distribution of X+Y.

#(a)
# As we will generate random number, to ensure reproducibility, please set the seed as 457. (1 pt)

## Your answer here



#(b) 
# Generate 1000 samples from normal distribution with mean=10, standard deviation=2 as X and 
# the other 1000 samples from normal distribution with mean=5, standard deviation=3 as Y. 
# Then find the mean and standard deviation of X+Y. (1 pt)

## Your answer here




#(c) 
# Now use the simulation to estimate the distribution of X+Y and create the confidence intervals.

##(1) 
## Form a set of Xs and Ys by repeating individual experiment for B = 2000 times,
## each experiment has n = 1000 samples. You may want to write a for loop and create two 
## matrices "sample_X" and "sample_Y" to save those values (see class notes). (2 pts)

## Your answer here





##(2) 
## Calculate mean of X+Y for each experiment and save it 
## to a vector which has a length of B, and plot a histogram of 
## these means. (2 pts)

## Your answer here





##(3) 
## Now as we have a simulated sampling distribution of X+Y, 
## calculate the 95% confidence interval for mean of X+Y (this 
## can be done empirically). (2 pts)

## Your answer here





#(d)
# In the above example, we have fixed the sample size n and number of experiments B. 
# Next, we want to change B and n, and see how confidence interval will change.
# Please write a function to create a confidence interval for any B and n. (3 pts)

MC_CI <- function(n, B){
  
  ## your answer here
 
  
}


#(e)
# Suppose the sample size n varies (100, 200, 300, .... , 1000) (fix B=2000) and 
# the number of experiments B varies (1000, 2000, ... , 10000) (fix n=500). 
# Plot your confidence intervals to compare the effect of changing the sample size n and 
# changing the number of simulation replications B (2 plots).
# What do you conclude? (4 pts)
# (Hint: Check function errbar() in Hmisc package for plot)

library(Hmisc)


## Your answer here


# fix n, B vary



# fix B, n vary




################    Part 2: Regular Expressions    ################################


#(a) 
# Use grep() to find which words in test set match the following requirements.
# (return locations of the matched words in test set)

##(1) 
## Words start with 's' (1 pt)

test_1 = c("introduction", "to", "data", "science", "457", "stats","snack") 

## Your answer here



##(2) 
## A string that would be our netID (lower case letters + number) (1 pt)

test_2 = c("mxian111", "ANSA111", "Jeffery", "199", "Jeff333", "linz22",
           "wod123")

## Your answer here



##(3) 
## An email address in form of example@example.xxx (1 pt)

test_3 = c("aaa@illinois.edu", "nothing@nothing", "bbb@gmail.com", 
           "maybe@now.net","data @ gmail.com", "ee123@illinois.edu",
           "abc_123@gmail.com","abc_123@gmail.com.net") 

## Your answer here




##(4) 
## An email address that ends with .com or .edu (1 pt)

test_4 = c("aaa@illinois.edu", "nothing@nothing", "bbb@gmail.com", 
           "maybe@now.net","data @ gmail.com", "ee123@illinois.edu",
           "abc_123@gmail.com","abc_123@gmail.com.net") 
## Your answer here




#(b) 
# Carry out the following exercises on the Womens Clothing E-Commerce Reviews dataset
# (available in moodle, Womens Clothing E-Commerce Reviews.txt).

##(1) 
## Use readLines() to read text data (it is in moodle) (encoding = "UTF-8") (1 pt)

## Your answer here



##(2) 
## Use regular expressions to return the number of reviews in the dataset (1 pt) 
## (Hint: find the pattern for each review)
## Your answer here




##(3) 
## extract information of "Title", "Review text", "Rating" 
## and "Department name", and save them into 4 vectors, named
## "title", "review", "rating" and "department".
## Please print the first 3 elements and the length of each vector.
## (3 pts)

##(hint: split each string by some patterns, for list manipulation 
## you may want to use funtions in apply family. and unname())

## Your answer here





##(4) 
## When checking the text in 'title', we find some additional symbols, for example the \ in:

## "\"Shimmer, surprisingly goes with lots\"" 
## "\"Nice, but not for my body\""  

## use regular expressions to find all the titles which have that pattern of "\"xxxxx\""
## print out the first three incorrect titles and the total number of incorrect titles.
## (2pts)

## Your answer here





##(5) 
## Change the format of all the incorrect titles, follow this rule:  
##  "\"xxxxxxx\"" ----> "xxxxxxx" (2 pts)

## for example:
## "\"Shimmer, surprisingly goes with lots\"" 
## ----> "Shimmer, surprisingly goes with lots"

## Your answer here




##(6) 
## Let's look at the reviews, and do some sentimental analysis.
## We want to compare the reviews between Dresses and Tops department.
## So first select reviews from these two department and save them as
## two vectors review_dress and review_top. (2 pts)
## (Hint: there are 5695 reviews in dresses department and 9656 reviews in tops department)

## Your answer here




##(7) 
## Eliminate apostrophes, numbers, and change all characters into lowercase 
## for review_dress and review_top. (3 pts)

## For example:
## "Finally a dress that is not too short! i'm 5'11 and ordered two sizes."
## ----> "finally a dress that is not too short im  and ordered two sizes"


## Your answer here




##(8) 
## Split the reviews that you have cleaned in Q(7) by blanks and drop any empty words.
## Save all the split words into one list for each department,
## named them as token_top and token_dress. 
## print the length of token_top and token_dress. (3 pts)

## Your answer here




##(9) 
## Based on results in Q(8), calculate the token frequency for each token 
## in each department.(2 pts)

## Your answer here




##(10) 
## Carry out some exploratory analysis of the data and term frequencies. 
## For example, find the words associated with positive and negative reviews. What 
## are distribution patterns for the term frequencies?
## Plot and interpret your result. What are your observations? (4 pts)

## Your answer here
