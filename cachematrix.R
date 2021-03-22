## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function creates a list of functions which could be used to 
## 1. get the value of a  matrix
## 2. set the value of a  matrix
## 3. get the value of an inverse 
## 4. set the value of an inverse
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x 
  setInv <- function(inverse) inv <<- inverse
  getInv <- function() inv
  list(set = set, get = get, 
       setInv = setInv,
       getInv = getInv)
}


## Write a short comment describing this function
## This function calculates the inverse of a given matrix from the above function. It 
## firstly checks if the inverse has already been calculated. If so, it will directly get 
## the value from the cache we have made. Otherwise, it will calculate the inverse of the 
## matrix and set the inverse value in the cache
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getInv()
  if(!is.null(inv)){
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setInv(inv)
  inv
}

# testing the results
m = matrix(data = c(1,0,1,1), 2, 2)
cache = makeCacheMatrix(m)
cacheSolve(cache)
