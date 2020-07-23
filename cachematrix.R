##makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  inverse<- NULL
  setinverse <- function(inverse) inverseMat <<- inverse
  getinverse <- function() inverse
  set <- function(y) {val
    x <<-y
    inverseMat <<-NULL
  }
  get <- function() x
  
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)

}

##This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
#If the inverse has already been calculated (and the matrix has not changed), 
#then cacheSolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
       inverse <- x$getinverse()
       if(!is.null(inverse)){
         message("getting cached data")
         return(inverse)
       }
       data <- x$get()
       inverse <- solve(data)
       x$setinverse(inverse)
       inverse
}
