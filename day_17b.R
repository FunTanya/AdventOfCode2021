# x=169..206, y=-108..-68
target.x.min <- 169#20
target.x.max <- 206#30
target.y.min <- -108#-10
target.y.max <- -68#-5
result.x <- result.y <- vector()
i <- 1
max.y <- max <- -Inf
n <- 206 # check out whether (sum((result.y[result.x==206]==-108) >0))
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
          result.x[i] <- move.x
          result.y[i] <- move.y
          i <- i+1
          if (max.y>max){max <- max.y}
          break
        }
      }
      if (x>target.x.max) {break}
      if (y<(target.y.min)) {break}
    }
  }
}
print(result <- i-1)
