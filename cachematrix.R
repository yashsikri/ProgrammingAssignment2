## These functions written in partial fulfillment of Coursera Data Science: R programing 

	
## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) { ## This defines the argument with default mode of "matrix"
    inv <- NULL                             ## This initializes inv as NULL; will hold value of matrix inverse 
    set <- function(y) {                    ## This defines the set function to assign new 
        x <<- y                             ## value of matrix in parent environment
        inv <<- NULL                        ## if there is a new matrix, reset inv to NULL
    }
    get <- function() x                     ## This defines the get fucntion - returns value of the matrix argument

    setinverse <- function(inverse) inv <<- inverse  ## This assigns value of inv in parent environment
    getinverse <- function() inv                     ## This gets the value of inv where called
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse) ## We need this in order to refer to the functions with the $ operator 
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.

## If the inverse has already been calculated (and the matrix has not changed), then cacheSolve will retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Returns a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv	
}
