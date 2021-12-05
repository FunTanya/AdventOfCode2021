zeros.ones <- readLines("data/input_03.txt")
n <- max(nchar(zeros.ones))
oxygen <- Co2 <- read.fwf(textConnection(zeros.ones), rep(1, n))

#1
puzzle.one.max <- as.numeric(apply(oxygen,2,sum)>nrow(oxygen)/2)
puzzle.one.min <- 1-puzzle.one.max
strtoi(paste(puzzle.one.max, collapse = ""), base=2)*
  strtoi(paste(puzzle.one.min, collapse = ""), base=2)

#2
for (i in 1:(n)){
ones <- sum(oxygen[,i])
zeros <- sum(!oxygen[,i])
if (ones<zeros){
oxygen <- oxygen[oxygen[,i]==0,]
} else oxygen <- oxygen[oxygen[,i]==1,]
if (nrow(oxygen)==1) break
}
for (i in 1:n){
ones <- sum(Co2[,i])
zeros <- sum(!Co2[,i])
if (ones<zeros){
Co2 <- Co2[Co2[,i]==1,]
} else Co2 <- Co2[Co2[,i]==0,]
if (nrow(Co2)==1) break
}
strtoi(paste(oxygen, collapse = ""), base=2)*
strtoi(paste(Co2, collapse = ""), base=2)
