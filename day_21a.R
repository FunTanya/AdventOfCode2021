players <- readLines("data/input_21.txt")
library(strex)
start.x <- str_nth_number(players[1], n = 2,negs = TRUE)
start.y <- str_nth_number(players[2], n = 2,negs = TRUE)

sum.x <- sum.y <- 0
i <- -2
repeat{ #loosign player * number of rolls
  i <- i+3
  move.x <- sum(((i-1)%% 100+1):((i-1)%% 100+3))
  start.x <- (start.x+move.x-1) %%10+1 # spaces 1..10
  sum.x <- sum.x+ start.x
  if  (sum.x>999) {print(sum.y*(i+2));break}
  i <- i+3
  move.y <-  sum(((i-1)%% 100+1):((i-1)%% 100+3))
  start.y <- (start.y+move.y-1) %%10+1 # spaces 1..10
  sum.y <- sum.y+ start.y
  if (sum.y>999) {print(sum.x*(i+2));break}
}
