

##makeCacheMatrix and cachesolve allow for matrix inverses to be cached so you 
##don't have to recalculate them everytime

## makeCacheMatrix creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)

}


## cacheSolve computes the inverse of the "special matix" returned by makeCacheMatrix
## if the inverse has already been calculated, cacheSolve retrieves and returns
## the inverse from the cache. if not, it calculates the inverse and stores it
## in the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}





