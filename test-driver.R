#
# Example usage:
rm(list = ls()) # Clears the runtime envirnoment

setwd("~/Google Drive/Learning/R_Programming/Assignments/ProgrammingAssignment2")
source("cachematrix.R")

# Create data matrix x
x <- matrix(rnorm(49), nrow = 7) 
# Create cache matrix
xdata <- makeCacheMatrix(x)
# Return data matrix
xdata$get() 
# Get the data matrix inverse
cacheSolve(xdata)
# Call again to test the cached data return functionality
cacheSolve(xdata)
