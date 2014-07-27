## A matrix has a function  is its inverse 

## mackecached matrix takes a matrix  (x) and caches the inverse of that matrix,
#if the inverse already has been computes and cached it returns the stored copy

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setCachedMatrix <- function(x1 = matrix()){x ^-1}  
  getCachedMatrix <- function() m
  list(set = set, get = get,
       setmatrix = setCachedMatrix,
       getmatrix = getCachedMatrix)
}

## computes the inverse of the matrix returned by makeCacheMatrix above.
#If the inverse has already been calculated (and the matrix has not changed),
#then cacheSolve should retrieve the inverse from the cache

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getmatrix()
  # check to see if matrix has been cached,if so returns m
  if(!is.null(m)) {
    message("getting cached matrix data")
    return(m) #returns m from cache
  }
  data <- x$get()
  m <- solve(data, ...) #solve is built in function for inversing matrix

  m #return computed value value
}
