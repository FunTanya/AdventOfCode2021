MyFile <- "data/input_08.txt"
data <- readLines(MyFile)
sum <- 0
for (i in 1:(length(data))){
  numerals <-   unlist(strsplit(data[i],split = " "))[1:10]
  segments_on <- sapply(numerals,nchar)
  numerals_0_9 <- rep(NA, 10)
  numerals_0_9[2] <- names(which(segments_on==2)) # 1
  numerals_0_9[5] <- names(which(segments_on==4)) # 4
  numerals_0_9[8] <- names(which(segments_on==3)) # 7
  numerals_0_9[9] <- names(which(segments_on==7)) # 8
  for (ii in 1:10){
    if (segments_on[ii]==5) {# 3 or 2 or 5
      if (length(intersect(unlist(strsplit(numerals_0_9[2],"")), unlist(strsplit(numerals[ii],""))  ))==2)
      {numerals_0_9[4] <- numerals[ii]} else
        if (length(intersect(unlist(strsplit(numerals_0_9[5],"")), unlist(strsplit(numerals[ii],""))  ))==2)
        {numerals_0_9[3] <- numerals[ii]} else
        {numerals_0_9[6] <- numerals[ii]} }
    else {
      if (segments_on[ii]==6) # 9 or 0 or 6
        if (length(intersect(unlist(strsplit(numerals_0_9[5],"")), unlist(strsplit(numerals[ii],""))  ))==4)
        {numerals_0_9[10] <- numerals[ii]} else
          if (length(intersect(unlist(strsplit(numerals_0_9[2],"")), unlist(strsplit(numerals[ii],""))  ))==2)
          {numerals_0_9[1] <- numerals[ii]} else
          {numerals_0_9[7] <- numerals[ii]}
    }
  }
  
  values <- unlist(strsplit(data[i],split = " "))[-(1:11)]
  for (j in 1:4){
    for (k in 1:10){
      if (identical( sort(unlist(strsplit(values[j],""))), sort(unlist(strsplit(numerals_0_9[k],""))) ))
      { sum <- sum + (k-1)*10^(4-j);break}
    }
  }
}
print(sum)
