## Greetings Warrior! 


## 1. # makeCacheMatrix is a function that returns a list of functions
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)


makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## 2. Let's compute the inverse and cache it 

# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix


cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data.")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setinverse(inv)
  inv
}


## 3. Test (Optional)
##Don't forget to source the file from wherever you would like to from 

##Source()     ## source it from wherever you prefer/put the file

## if you run the below rows in R after sourced the file you can see the inverse values
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
cacheSolve(my_matrix)
my_matrix$get()
cacheSolve(my_matrix)


