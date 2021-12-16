MyFile <- "data/input_15.txt"

MyFile <- "testdata/test_15.txt"
data.source <- readLines(MyFile)
n <- max(nchar(data.source))
data<- read.fwf(textConnection(data.source), rep(1, n)) ######### 
newdata <- cbind(data,data+1,data+2,data+3,data+4)
newdata <- rbind(newdata,newdata+1,newdata+2,newdata+3,newdata+4)
newdata <-  newdata %% 9

newdata[newdata==0] <- 9
data <- newdata

n <- 5*n
###########
nn <- n*n
path <- matrix(Inf, nc=n, nr=n,byrow = TRUE)
path[1,1] <- 0 
Z.visited <-vector() 
Z.unvisited <- (1:nn)

repeat{
  min <- Inf
  for (k in Z.unvisited){
    nenavstivena.path <- path[(k-1) %/% n+1,(k-1) %% n +1]
    if (nenavstivena.path<min) {
      min <- nenavstivena.path
      minx <- k
    }
  }
  
  i <- (minx-1) %/% n+1
  j <- (minx-1) %% n +1
  Z.visited <- c(Z.visited,minx)
  Z.unvisited <- (1:nn)[-Z.visited]

  if (j<n){ 
    alt <- path[i,j]+data[i,j+1]
    if (alt<path[i,j+1]){
      path[i,j+1] <- alt
    }
  }
  if (j>1){ 
    alt <- path[i,j]+data[i,j-1]
    if (alt<path[i,j-1]){
      path[i,j-1] <- alt
    }
  }
  if (i>1){
    alt <- path[i,j]+data[i-1,j]
    if (alt<path[i-1,j]){
      path[i-1,j] <- alt
    }
  }
  if (i<n){
    alt <- path[i,j]+data[i+1,j]
    if (alt<path[i+1,j]){
      path[i+1,j] <- alt
    }
  }
  kuk <- path[n,n]
  if (length(Z.unvisited)==0) break
}
