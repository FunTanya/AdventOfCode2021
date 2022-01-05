sentence <- readLines("data/input_17.txt")
library(strex)
target.x.min <- str_nth_number(sentence, n = 1,negs = TRUE)
target.x.max <- str_nth_number(sentence, n = 2,negs = TRUE)
target.y.min <- str_nth_number(sentence, n = 3,negs = TRUE)
target.y.max <- str_nth_number(sentence, n = 4,negs = TRUE)
max.y <- max <- -Inf
n <- 200 #hruba sila
for( move.x in (1:n)){
  for( move.y in (-n:n)){
    move.x.ktere <- move.x
    move.y.ktere <- move.y
    max.y <-(-Inf) 
    x <- y <- 0 
    repeat{
      x <- x+move.x.ktere
      y <- y+move.y.ktere
      move.x.ktere <- move.x.ktere-1*sign(move.x.ktere)
      move.y.ktere <- move.y.ktere-1
      if (y>max.y ) max.y <- y
      if ((x>(target.x.min-1))&(x<(target.x.max+1))){
        if ((y>(target.y.min-1)) & (y<(target.y.max+1))){
          if (max.y>max){max <- max.y}
          break
        }
      }
      if (x>target.x.max) {break}
      if (y<(target.y.min)) {break}
    }
  }
}
print(max)
