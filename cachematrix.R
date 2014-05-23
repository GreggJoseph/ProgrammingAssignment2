
## makeCacheMatrix creates a list of functions that :
## 1. A Setter function that sets the value of the data matrix 'x'
## 2. A Getter function that gets the data matrix 'x'
## 3. A Setter function sets the values of the inverse of the 'x' matrix
## 4. A Getter function that gets the inverse values of the matrix 'x'
makeCacheMatrix <- function(x = matrix()) {
        
        # inverse_x  will store the cached inverse matrix
        inverse_x <- NULL
        
        # Setter for the data matrix 'x'
        set <- function(y) {
                x <<- y
                inverse_x <<- NULL
        }
        # Getter for the data matrix 'x'
        get <- function() x
        
        
        # Setter for the inverse
        setinverse <- function(inverse) inverse_x <<- inverse
        # Getter for the inverse
        getinverse <- function() inverse_x
        
        
        # Return the matrix with our newly defined functions
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
        
}


## cacheSolve: Computes the inverse of the supplied matrix 'x'. If the inverse of the
##   supplied matrix 'x' has already been computed, cacheSolve returns the cached inverse
##   matrix of 'x'.  This function relies on the defined functions listed in the
##   makeCacheMatrix function.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse_x <- x$getinverse()
        
        # If the inverse is already calculated, return it
        if (!is.null(inverse_x)) {
                message(" >>> Getting cached data...")
                return(inverse_x)
        }
        
        # The inverse is not yet calculated, so compute the inverse using solve()
        #  Assume the supplied matrix is square...
        data <- x$get()
        inverse_x <- solve(data, ...)
        
        # Cache the inverse
        x$setinverse(inverse_x)
        
        # Return inverse matrix
        return(inverse_x)
}
