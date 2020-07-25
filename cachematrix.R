## The function below makeCacheMatrix creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(h = matrix()) {
  ## Initialize the inverse property
  inv <- NULL
  
  ##set the value of  matrix
  set <- function(y){
    h <<- y
    inv <<-NULL
  }
  
  ##get the value of matrix
  get <- function() {
    ##return the matrix
    h                                              
  }
  
  #set the inverse of the matrix
  setInverse <- function(inverse){
    inv <<- inverse
  }
    
  ##get the value of inverse 
  getInverse <- function(){
    ##returns the inverse property
    inv
  }
  
  ##return a list of the methods
  list(set=set , get=get , setInverse = setInverse , getInverse = getInverse)
}


## The function below cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should retrieve 
## the inverse from the cache.

cacheSolve <- function(h, ...) {
  ## Return a matrix that is the inverse of 'h'
  inv <- h$getInverse()
  
  ##return the inverse if it is already set
  if(!is.null(inv)){
    message("getting cached dados")
    return(inv)
  }
  
  ##get the matrix
  dados <- h$get
  
  ##calculate the inverse
  h <- solve(dados,...)
  
  ##set the inverse
  h$setInverse(inv)
  
  ##return the matrix
  inv
}
