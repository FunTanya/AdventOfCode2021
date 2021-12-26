data <- readLines(MyFile)
n <- max(nchar(data))
data <- matrix(unlist(strsplit(data,split = "")),ncol = n,byrow = TRUE)
count <- 0
repeat{
  change.1 <- FALSE
  change.2 <- FALSE
  count <- count+1
  novadata <- data
  for (i in 1:nrow(data)){
    for (j in 1:ncol(data)){
      jindex <- j+1
      if (j==ncol(data)){jindex <- 1}
      if ((data[i,j]==">") & (data[i,jindex]==".")){
        novadata[i,j] <- "."
        novadata[i,jindex] <- ">"
        change.1 <- TRUE
        }
    }
  }
  data <- novadata
  for (i in 1:nrow(data)){
    for (j in 1:ncol(data)){
      iindex <- i+1
      if (i==nrow(novadata)){iindex <- 1}
      if ((novadata[i,j]=="v") & (novadata[iindex,j]==".")){
        data[i,j] <- "."
        data[iindex,j] <- "v"
        change.2 <- TRUE
      }
    }
  }
  if (!change.1 & !change.2){print(count);break}
}
