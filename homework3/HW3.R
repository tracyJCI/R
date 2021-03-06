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
  #NA values become a hinderance when using certain functions, so they can be removed by specifying values of arguments 
  #in your R code that remove them before making calculations eg na.rm = TRUE

# 1a, what's the variance of the observations in each row of the matrix? 
      row_var = apply(some_matrix, 1, var,na.rm=TRUE)
      row_var

# 1b, sort (all) the columns of the above matrix 
      
      
      some_matrix[,1]= sort(some_matrix[,1])
      some_matrix[,2]=sort(some_matrix[,2], na.last  = TRUE)
      some_matrix[,3]=sort(some_matrix[,3], na.last = TRUE)
      some_matrix[,4]=sort(some_matrix[,4])
      some_matrix[,5]=sort(some_matrix[,5],na.last = TRUE)
      some_matrix[,6]=sort(some_matrix[,6])
      some_matrix[,7]=sort(some_matrix[,7])
      some_matrix[,8]=sort(some_matrix[,8],na.last=TRUE)
      some_matrix[,9]=sort(some_matrix[,9])
      some_matrix[,10]=sort(some_matrix[,10])
      
      
      

# 1c, find the total number of negative values by column in some_matrix.
# your answer should be a vector of integer of length 10.
      new_vec = c(sum(some_matrix[,1] < 0),sum(some_matrix[,2] < 0, na.rm= TRUE),
      sum(some_matrix[,3] < 0, na.rm= TRUE ),sum(some_matrix[,4] < 0),
      sum(some_matrix[,5] < 0, na.rm= TRUE),sum(some_matrix[,6] < 0),
      sum(some_matrix[,7] < 0),sum(some_matrix[,8] < 0, na.rm= TRUE),
      sum(some_matrix[,9] < 0),sum(some_matrix[,10] < 0))
      new_vec
       
      
      

          
# Part 2: let's play with "sapply". (2 pts each)


# 2a, find the square root, the square and the cube of the numbers 1 to 10.
# (hint: think about how to define the function first; your answer should be a 3-by-10 matrix.)
        numbers = c(1,2,3,4,5,6,7,8,9,10)
        
      squareroot_vector= sapply(numbers, sqrt)
      square_vector =sapply(numbers, function (x) x^2)
      cube_vector = sapply(numbers, function (x) x^3)
      solution_matrix = rbind(squareroot_vector,square_vector,cube_vector)
      solution_matrix
      
      
      

# 2b, we played with the data set mtcars previously.
# now find the class of each variable(column) 
        data(mtcars)
       
        sapply(mtcars, class)
        
      

# Part 3: the next is "lapply"! (2 pts each)


# 3a, same as 2b), but using "lapply", and get your function output as a vector as well.  
# (hint: what does "lapply" return? how to convert it to a vector?)
     unlist(lapply(mtcars, class))
      

# 3b, from 3a), what do you observe about the relationship, the difference 
# between "sapply" and "lapply"? (hint: think about their inputs and outputs)
  # sapply tries to simplify output by returning it in a vector form, while lapply returns output as a list


# 3c, here I create some random data
set.seed(1120)
rndm <- replicate(15, runif(sample(1:10, 1)), simplify = FALSE)

# first, what did the above code generate? name the data structure, the length, 
# and the content as well as giving a description.

#the above code generated a random distribution of samples in a list format
#it is a list
length(rndm)
str(rndm)

# 3d, using "lapply", return the lengths of each component in rndm.

lapply(rndm, length)

# 3e, now create the following list:
list_a <- list(c=c(11:20), d=c(31:40))

# take the (natural) log of EACH element in list_a
  log(list_a$c)
  log(list_a$d)
  
 
# explain why log2(list_a) doesn't work. (hint: help manual, look at the function input format)
    
  #log2(x) works on numeric arguments, it does not view list_a as a numeric argument because list_a is a list

# Part 4: the "tapply" and its equivalent. (2 pts each)
# we will use the data set "iris"; familiarize yourself with it first:
data(iris)

# 4a, find the mean petal length by species.
View(iris)
tapply(iris$Petal.Length, iris$Species, mean )

# 4b, look up the function "by"
?by
# obtain the mean of the 4 features, by species, but using only one function call.
 
  
     
     for( i in 1:4){
  
  
        print(by(iris[,i], iris$Species, mean))
       
        }


# 4c, same as 4b), but using "aggregate" function.
   
  
  
 aggregate(iris[,1:4], list(iris$Species), mean)
  
               
                       
                     




# 4d, same as 4b), but using the combination of "apply" and "tapply".
# (hint: nested function)
 
    

# Part 5: other apply functions. (2 pts each)


# 5a, look up the function "mapply"
# we create list_a in 3f).
list_b <- list(a=1:10, b=21:30)


# What is the sum of the corresponding elements of list_a and list_b,in one function call?
# Your result should be a vector of length 10.
  mapply(sum, list_a$c,list_a$d,list_b$a, list_b$b)


# 5b, look up the function "rapply"
# same as 3e), but using rapply function, get your function output as a list as well.
# (hint: take a look at the function parameters)
 log_function_output= as.list(rapply(list_a, log))
  log_function_output

# Part 6: to sum up... (2 pts each)


# 6a, 
# give an example or detailed explanation of and example of  when the "apply" family function 
# doesn't work, we have to use for loop(s).
  #some members of the apply family functions only work on arguments of the same length as its index per time,
  #in such cases a loop has to be introduced.
  # For example a for loop is necessary when using the tapply function to find the mean of all the columns of the iris dataset
  #with index "Species"


# 6b, to make sure you really know how to apply "apply", 
# give an example of, two nested "apply" family functions, explain what you did.
# e.g., apply(apply(some_matrix,2,is.na), 2, sum), this gives you the number 
# of NA's in each column. It's just for illustration, you can do this with one "apply" too.

# anything similar to the example above doesn't count.
  
# Part 7: linear regression. (5pts)

# Using the family data, fit a linear regression model to predict weight from height. 
# comment on the output; how do you interpret this model? (hint: lm() function)
  load("C:/Users/Kosi/Downloads/family.rda")
 
   lm(weight ~ height, data = family)
   #-455.666 andd 9.154 are the beta coefficients.
   #we can therefore say
  #weight = -455.666 + 9.154height
   

# Create a scatterplot of height vs weight. Add the linear regression line you found above. 
# Provide an interpretation for your plot.
   scatter.smooth (x = family$height, y = family$weight, main= "weight~ height")
# weight and height have a positive linear relationship meaning that as height increases , weight tends to incease too.