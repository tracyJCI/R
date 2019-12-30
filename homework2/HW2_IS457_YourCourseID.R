# Do not remove any of the comments. These are marked by #
# HW 2 - Due Monday, Feb 19 2018 in moodle and hardcopy in class.
# (1). Please upload R code and report to Moodle 
#      with filename: HW2_IS457_YourCourseID.
# (2). Turn in hard copy of your report in class.

### Class ID:

# In this assignment you will practice how to manipulate vector and dataframe, 
# such as taking subsets and creating new data structure, and end with creating a fantastic plot.
# You will work with the mtcars data in R library and a dataset called SFHousing. 
# Before beginning with the housing data however, you will do some warm up exercises.



# PART 1. Warm up (3 pts)
# Q1. Create a Vector like this (0 0 2 2 4 4 6 6 8 8 10 10 12 12) 
#     with functions seq() and rep() and call it "vec" (1 pt)

### Your code below


# Q2. Calculate the fraction of elements in vec that are more than 4. (2 pts)
# hint: R can do vectorized operations. 

### Your code below




# PART II. mtcars Data (9 pts)
# Q3. Use R to generate descriptions of the mtcars data which is already built in R base. 
# Print out the summary of each column and the dimensions of the dataset. (2 pts.)
# (hint: you may find the summary() and dim() useful). 
# Write up your descriptive findings and observations of the R output. (1 pt.)

### Your code below:

### Your answer below:



# Q4. Show last 10 cars' mpg values (1 pt.)

### Your code below:



# Q5. Show all cars' mpg values except the first 10 cars'. (1 pt.)

### Your code below:



# Q6. Calculate the mean of mpg subseted by "vs" variable.(1 pt)
# hint: apply function family.

### Your code below:




# Q7. Create a logical vector mpg_vs . (2 pts)

# For the cars with V-engine (vs = 0), return value TRUE when mpg > 14.
# For the cars with straight engine (vs = 1), return value TRUE when mpg > 20.

### Your code below:




# Q8. Here is an alternative way to create the same vector in Q2.
# First, we create a numeric vector mpg_index that is 20 for each car with V-engine
# and 18 for each car with straight engine. To do this, first create a vector of length 2 called 
# id_val whose first element is 20 and second element is 18. (1 pt)

### Your code below:



# Create the mpg_index vector by subsetting id_val by position, where the 
# positions could be represented based on vs column in mtcars. (1 pt)

### Your code below


# Finally, use mpg_index and mpg column to create the desired vector, and
# call it mpg_vs2. (1 pt)

### Your code below





#PART 3.  San Francisco Housing Data (25 pts.)
#
# Load the data into R.
load(url("https://www.stanford.edu/~vcs/StatData/SFHousing.rda"))

# Q9. (3 pts.)
# What objects are in SFHousing.rda? Give the name and class of each.

### Your code below




### Your answer here




# Q10. give a summary of each object, including a summary of each variable and the dimension of the object. (4 pts)

### Your code below





# Q11. After exploring the data (maybe using the summary() function), describe in words the connection
# between the two objects (e.g., what links them together). (2 pts)

### Write your response here





# Q12. Describe in words two problems that you see with the data. (2 pts)

### Write your response here







# Q13. (2 pts.)
# We will work the houses in Oakland, Sant Rosa, Campbell, and Sunnyvale only.

# Subset the housing data frame so that we have only houses in these cities
# and keep only the variables county, city, zip, price, br, bsqft, and year.

# Call this new data frame SelectArea. This data frame should have 20706 observations
# and 7 variables. (Note you may need to reformat any factor variables so that they
# do not contain incorrect levels)

### Your code below





# Q14. (3 pts.)
# We are interested in making plots of price and size of house, but before we do this
# we will further subset the housing dataframe to remove the unusually large values.

# Use the quantile function to determine the 95th percentile of price and bsqft
# and eliminate all of those houses that are above either of these 95th percentiles
# Call this new data frame SelectArea (replacing the old one) as well. It should 
# have 19064 observations.

### Your code below





# Q15. (2 pts.)
# Create a new vector that is called price_per_sqft by dividing the sale price by the square footage
# Add this new variable to the data frame.

### Your code below






# Q16 (2 pts.)
# Create a vector called br_new, that is the number of bedrooms in the house, except
# when the number is greater than 6, set it (br_new) to 6.  

### Your code below





# Q17. (4 pts. 2 + 2 - see below)
# Use the rainbow function to create a vector of 6 colors, call this vector rCols.
# When you call this function, set the alpha argument to 0.25.

# Create a vector called brCols where each element's value corresponds to the color in rCols 
# indexed by the number of bedrooms in the br_new.

# For example, if the element in br_new is 3 then the color will be the third color in rCols.
# (2 pts.)

### Your code below





######
# We are now ready to make a plot!
plot(price_per_sqft ~ bsqft, data = SelectArea,
     main = "Housing prices in the Berkeley Area",
     xlab = "Size of house (square ft)",
     ylab = "Price per square foot",
     col = brCols, pch = 18, cex = 0.5)
legend(legend = 1:6, fill = rCols, "topright")

# what's your interpretation of the plot? 
# e.g., the trend? the cluster? the comparison? (1 pt.)

