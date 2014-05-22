#
# Example usage:
rm(list = ls()) # Clears the runtime envirnoment

setwd("~/Google Drive/Learning/R_Programming/Assignments/ProgrammingAssignment2")
source("cachematrix.R")

x <- matrix(rnorm(64), nrow = 8)  # Create a matrix x
cx <- makeCacheMatrix(x)          # Create our special matrix
cx$get()                          # Return the matrix
cacheSolve(cx)                    # Return the inverse
cacheSolve(cx)                    # Call the 2nd time, so return the cached inverse
