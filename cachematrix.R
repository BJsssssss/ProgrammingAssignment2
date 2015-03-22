## Put comments here that give an overall description of what your
## functions do

## Functions that cache inverse data points of a matrix
##
## How to use from command line:
##
## > source('cachematrix.R')
## > m <- makeCacheMatrix(<matrix>)
## > cacheSolve(m)

## Create the matrix, which is a list containing
## (a) a function to input and output the value of the original matrix
## (b) find and output the value of the corresponding inverse matrix

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }

    get <- function() x
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i

    list(
        set = set,
        get = get,
        setinverse = setinverse,
        getinverse = getinverse
    )

}


## Now find the inverse of the matrix created above
## using cached values earlier

cacheSolve <- function(x, ...) {
    i <- x$getinverse()
    if(!is.null(i)) {
        message("Cached data read")
        return(i)
    }

    m <- x$get()
    i <- solve(m, ...)
    x$setinverse(i)

    i
}

