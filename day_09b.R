spocitej <- function(indexi,indexj){
  maticeTF <- matice==999
  maticeTF[indexi,indexj]=TRUE
  vysl <- 0
  repeat{
    minulyvysl <- vysl
    for (i in 2:(n+1)){
      for (j in 2:(n+1)){
        if (maticeTF[i,j]) {
          if (matice[i-1,j]<9) maticeTF[i-1,j] <- TRUE
          if (matice[i+1,j]<9) maticeTF[i+1,j] <- TRUE
          if (matice[i,j-1]<9) maticeTF[i,j-1] <- TRUE
          if (matice[i,j+1]<9) maticeTF[i,j+1] <- TRUE
        }
      }
      vysl <- sum(maticeTF)
    }
    if (vysl==minulyvysl) break
  }
  return(vysl)
}
MyFile <- "data/input_09.txt"
#MyFile <- "testdata/test_09.txt"
data <- readLines(MyFile)
n <- max(nchar(data))
matice <-read.fwf(textConnection(data), rep(1, n))
bahna <- vector()
count <- 1
matice <- cbind(9,matice,9)
matice <- rbind(9,matice,9)
for (i in 2:(n+1)){
  for (j in 2:(n+1)){
    if (matice[i,j]< min(c(matice[i-1,j],matice[i+1,j],
                           matice[i,j-1],matice[i,j+1]),na.rm = TRUE)){
      print(spocitej(i,j))
     bahna[count] <- spocitej(i,j)
     count <- count+1
    }
  }
}
print(prod(rev(sort(bahna))[1:3]))