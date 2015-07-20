## A matrix object that caches its inverse and a function to retrieve the cache

## Creates a matrix object that caches its inverse
## (Assume input is always a square and inversible matrix)
makeCacheMatrix <- function(myMatrix = matrix()) {
  m_inverse <- NULL;
  set <- function(newMatrix) {
    myMatrix <<- newMatrix;
    m_inverse <<- NULL;
  }
  get <- function() {
    myMatrix;
  }
  setInverse <- function(myInverse) {
    m_inverse <<- myInverse;
  }
  getInverse <- function() {
    m_inverse;
  }
  
  list(get=get, set=set, getInverse=getInverse, setInverse=setInverse);

}


## Get the inverse of the matrix from cache when avaiable

cacheSolve <- function(myMatrix, ...) {
  i <- myMatrix$getInverse();
  if (!is.null(i)) {
    message('getting cache data');
    return(i);
  }
  tempData <- myMatrix$get();
  i <- solve(tempData);
  myMatrix$setInverse(i);
  i;
}
