## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix creates a list of functions that :
## 1. A Setter function that sets the value of the matrix 'x'
## 2. A Getter function that gets the matrix 'x'
## 3. A Setter function sets the values of the inverse of the 'x' matrix
## 4. A Getter function that gets the inverse values of the matrix 'x'
makeCacheMatrix <- function(x = matrix()) {
        
        # inv_x will store the cached inverse matrix
        inv_x <- NULL
        
        # Setter for the matrix
        set <- function(y) {
                x <<- y
                inv_x <<- NULL
        }
        # Getter for the matrix
        get <- function() x
        
        
        # Setter for the inverse
        setinverse <- function(inverse) inv_x <<- inverse
        # Getter for the inverse
        getinverse <- function() inv_x
        
        
        # Return the matrix with our newly defined functions
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        
}


## cacheSolve: Computes the inverse of the supplied matrix 'x'. If the inverse of the
##   supplied matrix 'x' has already been computed, cacheSolve returns the cached inverse
##   matrix of 'x'.  This function relies on the defined functions listed in the
##   makeCacheMatrix function.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inv_x <- x$getinverse()
        
        # If the inverse is already calculated, return it
        if (!is.null(inv_x)) {
                message(" >>> Getting cached data...")
                return(inv_x)
        }
        
        # The inverse is not yet calculated, so compute the inverse using solve()
        #  Assume the supplied matrix is square...
        data <- x$get()
        inv_x <- solve(data, ...)
        
        # Cache the inverse
        x$setinverse(inv_x)
        
        # Return inverse matrix
        return(inv_x)
}
