MyFile <- "data/input_13.txt"
data <- read.table(MyFile, header = FALSE, sep = ",")
names(data) <- c("x","y")
(paper <- matrix(0,nrow = max(data$y)+1,ncol = 1+max(max(data$x)), byrow = TRUE))
for (i in 1:nrow(data)){
  paper[data$y[i]+1,data$x[i]+1] <- 1
}

fold.y <- function(paper,k){
  return(paper[1:k,]+paper[1+k+(k:1),])
}
fold.x <- function(paper,k){
  return(paper[,1:k]+paper[,1+k+(k:1)])
}

paper <- fold.x(paper,655)
paper <- fold.y(paper,447)
paper <- fold.x(paper,327)
paper <- fold.y(paper,223)
paper <- fold.x(paper,163)
paper <- fold.y(paper,111)
paper <- fold.x(paper,81)
paper <- fold.y(paper,55)
paper <- fold.x(paper,40)
paper <- fold.y(paper,27)
paper <- fold.y(paper,13)
paper <- fold.y(paper,6)
                  
for (i in 1:nrow(paper)) for (j in 1:ncol(paper)) if (paper[i,j]>0) paper[i,j] <- "1"
where <- rbind(paper>0)
style <- c('background-color: red; color: white;')
css.cell <- matrix('', nrow(paper), ncol(paper))
css.cell[where] <- style
library(htmlTable)
htmlTable(paper, css.cell = css.cell)
   