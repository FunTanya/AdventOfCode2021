fold.y <- function(paper,k){
  return(paper[1:k,]+paper[1+k+(k:1),])
}
fold.x <- function(paper,k){
  return(paper[,1:k]+paper[,1+k+(k:1)])
}

MyFile <- "data/input_13.txt"
data <- readLines(MyFile)
x <- y <- vector()
i <- 1
repeat{
  temp <- as.numeric(unlist(strsplit(data[i],split = ",")))
  if (length(temp)==0){break}
  x[i] <- temp[1]
  y[i] <- temp[2]
  i <- i+1
}
n <- i-1
rulez.start <- i+1
paper <- matrix(0,nrow = max(y)+1,ncol = 1+max(x), byrow = TRUE)
for (i in 1:n){
  paper[y[i]+1,x[i]+1] <- 1
}
i <- rulez.start
repeat{
  temp <- unlist(strsplit(data[i],split = "="))
  if (is.na(temp[1])) {break}
  if (substr(temp[1], nchar(temp[1]), nchar(temp[1]))=="x"){
    paper <- fold.x(paper,as.numeric(temp[2]))}
  if (substr(temp[1], nchar(temp[1]), nchar(temp[1]))=="y"){
        paper <- fold.y(paper,as.numeric(temp[2]))} 
  if (i==rulez.start) print(sum(paper>0))   ### first star
  i <- i+1
}

library(htmlTable)
for (i in 1:nrow(paper)) for (j in 1:ncol(paper)) 
  if (paper[i,j]>0) paper[i,j] <- "x" else paper[i,j] <- " "
style <- c('background-color: red; color: white;')
css.cell <- matrix('', nrow(paper), ncol(paper))
css.cell[paper=="x"] <- style
htmlTable(paper, css.cell = css.cell)
