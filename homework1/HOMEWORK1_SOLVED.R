# PART 1.  Cat Data
# Load data for this assignment into your R session with the following command:
install.packages("MASS")
library(MASS)
data(cats)

# Check to see that the data were loaded by running:
objects(cats)

class(cats)

#(1). Find the average body weight and average heart weight. (2 pts)
mean(cats$Bwt)
mean(cats$Hwt)

#(2). Find how many observations in the dataset. (1 pt)
dim(cats)
#144 observations

#(3). Find the number of male cats and the number of female cats. (1 pt)
dim(cats[cats$Sex=="M",])
dim(cats[cats$Sex=="F",])
#97 male cats, 47 female cats

#(4). Find the average body weight of male cats.(1 pt)
mean(cats[cats$Sex=="M",c("Bwt")])

#!(5). Show the summary or the structure of this dataset 
# and list the categorical variable in the dataset. (2 pts)
summary(cats) #categorical variable would be sex which is either male or female

#(6). What is the highest heart weight of male cats? (1 pt)
cats[cats$Sex=="M"& cats$Hwt==max(cats$Hwt),]
#20.5

# (7). (3 pts)
# Try running each expression in R.
# Record the error message in a comment
# Explain what it means. 
# Be sure to directly relate the wording of the error message with 
# the problem you find in the expression.

mean(Bwt,Hwt)
#Error in mean(Bwt, Hwt) : object 'Bwt' not found
#the mean function is used to obtain the average of a set of values. Bwt and Hwt are not recognised as objects on their own,they can only accessed through the cats dataset using the $ sign,they are objects of that dataset

mean(cats$Bwt, cats$Hwt)
#Error in mean.default(cats$Bwt, cats$Hwt) : 'trim' must be numeric of length one
#this means the mean function can only find the average of one set of numeric values per time

rowMeans(cats$Bwt, cats$Hwt)
#Error in rowMeans(cats$Bwt, cats$Hwt) : 'x' must be an array of at least two dimensions
#this means the rowMeans function expects x to be a 2 or more dimensional array, cats$Bwt only has one dimension

#PART2 iris data
View(iris)

plot(iris$Petal.Length , iris$Petal.Width, xlab = "Petal.Length", ylab = "Petal.Width", main = "Iris Petal Length VS Width")
 #(2) I observe that as petal length increases ,petal width also increases which means they are positively correlated

#(3) I think it would be interesting to be able to find out the correlation value

#PART3
#(1). Use you UIN number to set the seed in set.seed() function. (1 pt)
set.seed(650754765)

# (2). Generate a vector called "unifsample" containing
# 1000 random samples from a uniform distribution [0,2] (1 pt)
runif(1000,0,2)
unifsample= runif(1000,0,2)
View(unifsample)


# (3). Calculate the mean of the 1000 values in "unifsample". (1 pt)
mean(unifsample)

# (4). Use logical operations (>,<,==,....) to calculate
# the fraction of the values in "unifsample" that are more than 1. (1 pt)
unifsample[(unifsample>1)=="TRUE"]

length(unifsample[(unifsample>1)=="TRUE"])

(length(unifsample[(unifsample>1)=="TRUE"]))/1000

# (5). Generate a vector called "normsample" containing
# 1000 random samples from a normal distribution with
# mean 10 and Standard Deviation 2.(1 pt)
rnorm(1000,10,2)
normsample = rnorm(1000,10,2)

# (6). Calculate the mean and sd of the 1000 values "normsample". (1 pt)
mean(normsample)
sd(normsample)

# (7). Use logical operations (>,<,==,....) to calculate
# the fraction of the values in "normsample" that are more than 9. (1 pt)
normsample[(normsample>9)=="TRUE"]
length(normsample[(normsample>9)=="TRUE"])

(length(normsample[(normsample>9)=="TRUE"]))/1000

#(8). Find the area under the normal(10, 2) curve to the right of 9.  
# This should be the probability of getting a random value more than 9. 
pnorm(9,10,2,lower.tail = FALSE)
#the total area under a normal curve equals 1. 
# I expected a value within the range of 0 to 1 similar to the probability of an event
# I got a value of 0.6914625 as expected.



  