## Greetings Warrior! 


## 1. Here we create the goodies

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


## 3. Test
##Don't forget to source the file from wherever you would like to from 

##Source()     ## source it from wherever you prefer/put the file

## if you run the below rows in R after sourced the file you can see the inverse values
my_matrix <- makeCacheMatrix(matrix(1:4, 2, 2))
my_matrix$get()
cacheSolve(my_matrix)
my_matrix$get()
cacheSolve(my_matrix)


