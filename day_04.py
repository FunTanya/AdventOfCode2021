# library(reticulate)
# py_install("pandas")
bingo_tables = []
with open("data/input_04.txt") as data:
  lottery = data.readline().strip()
  all_line_tables = data.read().splitlines()
  for line in all_line_tables:
    if line.strip():
      bingo_tables.append(line)

tab_count = len(bingo_tables) // 5
print(tab_count)

#import numpy as np
#a = np.array(bingo_tables[0:6])
#print(a)

# winner.order <- winning.number <- notwinning.numbers <- vector()
# 
# for (ktera in 1:tab.count){
#   bingo.table <- bingo.tables[(ktera-1)*5+(1:5),]
#   uhodnute <- bingo.table == 9999
#   for (i in 1:length(lottery)){
#     uhodnute <- ( bingo.table == lottery[i] ) | uhodnute
#     if ((max(rowSums(uhodnute))>4) | (max(colSums(uhodnute))>4)) {
#       winner.order[ktera] <- i
#       winning.number[ktera]  <- lottery[i]
#       notwinning.numbers[ktera]  <- sum(bingo.table*(!uhodnute))
#       break
#     }
#   }
# }
# 
# print(first.win.res <- winning.number[which.min(winner.order)]*
#   notwinning.numbers[which.min(winner.order)])
# 
# print(last.win.res <- winning.number[which.max(winner.order)]*
#   notwinning.numbers[which.max(winner.order)])
