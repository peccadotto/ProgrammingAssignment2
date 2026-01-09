## The functions I created:
## 1) store a numeric matrix in a special object
## 2) caches its inverse matrix using the solve() function

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function (y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## With this function we cache the inverse matrix retrieving it from memory
## rather than recalculating it

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  
  s
}
