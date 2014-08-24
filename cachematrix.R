#this function takes a square matrix as a parameter
#and returns a list that contains functions to cache
#the inverse of that function.
#functions include methods to set and get original plus
#cached values,which are stored in the private local
#variables originalMatrix and specialMatrix respectively
#assumes square matrix
makeCacheMatrix <- function(originalMatrix) {
  specialMatrix <- NULL
  
  set <- function(passedMatrix) {
    #Sets the value from the original matrix into this new object containing fumctions
    originalMatrix <<- passedMatrix
    #also sets the return value to null as the setSecialmatrix  function has not yet been called
    specialMatrix <<- NULL #<<- instead of <- is used as specialMatrix is defined outside of set function
  }
  get <- function(){ 
    #returns original matrix 
    originalMatrix 
  }
  setInverseMatrix <- function(invertedMatrix){
    #caches the value of the special matrix from passed argument
    specialMatrix <- invertedMatrix 
    
  }
  
  getInverseMatrix <- function(){
    #returns inverse matrix   
    specialMatrix
  } 
  list(set = set, get = get,
       setmatrix = setInverseMatrix,
       getMatrix = getInverseMatrix)
}

cacheSolve <- function(x, ...) {
  #find the previous cached inverse matrix
  cachedInverse <- x$getMatrix()
  #if cached inverse exists then return the cached inverse matrix and exit function
  if(!is.null(cachedInverse)) {
    #the inverse matrix is the return value
    return(cachedInverse)
  }
  #function continues only if cached is not found
  #original data is obtained with the get function
  origMatrix <- x$get()
  #the inverse matrix is calculated on that original data
  cachedInverse <- solve(origMatrix)#no additional data in solve function returns inverse
  # the inverse matrix is stored in the cache
  x$setMatrix(cachedInverse)
  #the inverse matrix is the return value
  cachedInverse
}  
