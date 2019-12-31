#This is an R file showing how to test the four assumptions of 
#linear regression
#this is a model of the relationship between age and lung capacity
#Lung capacity is the y variable here , and age is the x variable

# Reading in the file
LungCapData = read.csv("C://Users//Kosi//Downloads//LungCapData.csv", header = T)

#Attaching the data to the main namespace
attach(LungCapData)

#Checking the names
names(LungCapData)

#Calculating the correlation between Age and LungCap
cor(Age,LungCap)

#Plotting Age and LungCap
plot(Age,LungCap)

#Fitting a linear model
mod = lm(LungCap ~ Age)

#summarizing the model
summary(mod)

#adding the regression line
abline(mod)

#Using R diagnostic plots to check for violation of assumptions
plot(mod)

#Constant Variance : In our residuals vs fitted plot, the variance is fairly constant irrespective
#of the x(age) and values are evenly spread across the residual zero line which means constant variance 
#is met
# Linearity : the residual zero line also appears to be quite flat which means linearity assumuption
#is met
# Normality : In our Normal QQ plot, the data is clustered along the diagonal line which shows that the normality
#assumption is met
#Independence : the observation do not have an order, the values are independent of each other and the 
#independence assumption is met



