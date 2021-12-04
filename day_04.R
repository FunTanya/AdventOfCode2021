lottery <- as.numeric(read.table("data/input_04.txt", nrows = 1, sep = ","))
bingo.tables <- read.table("data/input_04.txt", skip = 2)
tab.count <- nrow(bingo.tables) %/% 5
winner.order <- winning.number <- notwinning.numbers <- vector()

for (ktera in 1:tab.count){
  bingo.table <- bingo.tables[(ktera-1)*5+(1:5),]
  uhodnute <- bingo.table == 9999
  for (i in 1:length(lottery)){
    uhodnute <- ( bingo.table == lottery[i] ) | uhodnute
    if ((max(rowSums(uhodnute))>4) | (max(colSums(uhodnute))>4)) {
      winner.order[ktera] <- i
      winning.number[ktera]  <- lottery[i]
      notwinning.numbers[ktera]  <- sum(bingo.table*(!uhodnute))
      break
    }
  }
}

first.win.res <- winning.number[which.min(winner.order)]*
notwinning.numbers[which.min(winner.order)]

last.win.res <- winning.number[which.max(winner.order)]*
notwinning.numbers[which.max(winner.order)]

