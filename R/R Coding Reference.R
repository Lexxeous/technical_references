# R Coding Reference

FUNCTIONS:
c(): concatenate (like creating a vector)
length(): returns the length of a vector quantity
ls(): list of all objects and/or data created during session
rm(): remove/delete a created object or data
rm(list = ls()): remove ALL created objects or data
matrix(data,nrow,ncol,byrow,dimnames): creates a matrix; byrow is FALSE by default
matrix(a:b,r,c): creates a matrix from values 'a' to 'b' with row size = 'r' and column size = 'c'
-can use a negative sign '-' when indexing a matrix to include all rows and/or colums except for those indicated in the index
dim(matrix): gives the number of rows followed by the number of columns
sqrt(): returns the square root...obviously...; can take sqrt() of an entire matrix
var(): returns the variance of a data set
sd(): returns the standard deviation of a data set
rnorm(nPoints,mean,sd): returns a vector of RANDOMIZED normal variables; by defualt the mean = 1
plot(x,y,col = "desiredColor"): creates a plot of "x vs. y"; x-axis (horizontal) vs. y-axis (vertical)
-xlab = "this is the x-axis label"
-ylab = "this is the y-axis label"
-main = "this is the title of the plot"
dev.off(): tell R that we are done with the current plot
seq(a,b,length = d): creates a vector of numbers between 'a' and 'b', equally spaced, with length 'd'
contour(x,y,f): can be used to represent/create 3-dimensional plots/graphs; 'f' is the z coordinate as a function of 'x' and 'y'
image(x,y,f): work similarly to the contour function but rather created a color coated graph based on the z coordinate; heatmap
persp(theta = angle1,phi = angle2): gives a different perspective of the current graph based on the two given angles
read.table(): imports data into R
write.table(): exports data from R
fix(): view the data in a spreadsheet-like window
library(libName): includes library for use in your session
fix(dataBase): invokes an editable version of data and opens the data, available for use, in the workspace
attach(dataBase): dataBase is attached to the ‘R’ search path
names(dataBase): display what information is contained within the dataBase
lm(y~x,dataBase): linear regression model fit of data with ‘y’ as the response and ‘x’ as the predictors
lm(y~x1+x2+x3+…,dataBase): multiple linear regression model fit of data with ‘y’ as the response and ‘x’ as the predictors
lm(y~x1*x2,dataBase): linear regression model fit of data with ‘y’ as the response, ‘x’ as the predictors, and an interaction term
summary(modelVar): returns values for Min, Max, 1st Quartile, 3rd Quartile, Median, Approx. Coefficients, SE, t-value, p-value, RSE, DOF, Mult. R^2, Adj. R^2, and F-stat.
coef(modelVar): returns the coefficients of the model fit
confint(modelVar): returns the confidence intervals of the model fit
abline(modelVar): adds one or more straight lines through the current plot
residuals(modelVar): returns the residuals from the model fit
rstudent(modelVar): returns the studentized residuals from the model fit
hatvalues(modelVar): returns leverage statistics
which.max(data): returns the maximum value within the supplied data
vif(): returns the variance inflation factor(s)
I(): change the class of an object to indicate that it should be treated ‘as is’
anova(modelVar1,modelVar2): compute analysis of variance (or deviance) tables for one or more fitted model objects
poly(x): creates a polynomial with ‘x’ DOF





COMMANDS:
?<func_name>: gets help with a particular function
mean: sets the average/mean value of a data set
sd: sets the standard deviation of a data set
matName[r,c]: returns the appropriate row and/or column of a matrix for computational/manipulitive purposes
cat("\014"): clear the console window; also can use the keybind "CTRL + L"
