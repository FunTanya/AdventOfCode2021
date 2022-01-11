library(cppRouting)
library(igraph)
MyFile <- "data/input_15.txt"
data.source <- readLines(MyFile)
n <- max(nchar(data.source))
#####
data<- read.fwf(textConnection(data.source), rep(1, n))######## 
partB <- TRUE  # part A or B
if (partB==TRUE){
  newdata <- cbind(data,data+1,data+2,data+3,data+4)
  newdata <- rbind(newdata,newdata+1,newdata+2,newdata+3,newdata+4)
  newdata <-  newdata %% 9
  newdata[newdata==0] <- 9
  data <- newdata
  n <- 5*n
}
###########
nn <- n*n
start=Sys.time()
graph<-data.frame(from=NA, to=NA, weight=NA)

for (i in 1:n){
  graph <- rbind(graph, c(from=(i-1)*n+2,to=(i-1)*n+1,weight=data[i,1]),
                 c(from=(i-1)*n+1+n,to=(i-1)*n+1,weight=data[i,1]),
                 c(from=(i-1)*n+1-n,to=(i-1)*n+1,weight=data[i,1]))
  for (j in 2:(n-1)){
    graph <- rbind(graph, c(from=(i-1)*n+j-1,to=(i-1)*n+j,weight=data[i,j]),
    c(from=(i-1)*n+j+1,to=(i-1)*n+j,weight=data[i,j]),
    c(from=(i-1)*n+j+n,to=(i-1)*n+j,weight=data[i,j]),
    c(from=(i-1)*n+j-n,to=(i-1)*n+j,weight=data[i,j]))
  }
  for (j in n){
    graph <- rbind(graph, c(from=(i-1)*n+j-1,to=(i-1)*n+j,weight=data[i,j]),
                   c(from=(i-1)*n+j+n,to=(i-1)*n+j,weight=data[i,j]),
                   c(from=(i-1)*n+j-n,to=(i-1)*n+j,weight=data[i,j]))
  }
}
graph <- na.omit(graph)

graph <- graph[graph$from %in% 1:nn,]
graph <- graph[graph$to %in% 1:nn,]

cpp_graph<-makegraph(graph,directed=TRUE)
get_distance_pair(cpp_graph,from=1,to=nn)
