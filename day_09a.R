MyFile <- "data/input_09.txt"
#MyFile <- "testdata/test_09.txt"
data <- readLines(MyFile)
n <- max(nchar(data))
matice <-read.fwf(textConnection(data), rep(1, n))
sum <- 0
matice <- cbind(9,matice,9)
matice <- rbind(9,matice,9)
for (i in 2:(n+1)){
  for (j in 2:(n+1)){
    if (matice[i,j]< min(c(matice[i-1,j],matice[i+1,j],
                          matice[i,j-1],matice[i,j+1]),na.rm = TRUE)){
      sum <- sum+matice[i,j]+1
    }
  }
}
print(sum)