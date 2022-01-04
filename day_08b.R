MyFile <- "data/input_08.txt"
#MyFile <- "testdata/test_08.txt"
data <- readLines(MyFile)
sum <- 0
for (i in 1:(length(data))){
numerals <-   unlist(strsplit(data[i],split = " "))[1:10]
segments_on <- sapply(numerals,nchar)
numerals_0_9 <- c(NA,#numerals_0_9[1] ...0
            names(which(segments_on==2)), #numerals_0_9[2] ...1
            NA,#numerals_0_9[3] ...2
            NA,#numerals_0_9[4] ...3
            names(which(segments_on==4)), #numerals_0_9[5] ...4
            NA, #numerals_0_9[6] ...5
            NA, #numerals_0_9[7] ...6
            names(which(segments_on==3)), #numerals_0_9[8] ...7
            names(which(segments_on==7)), #numerals_0_9[9] ...8
            NA)#numerals_0_9[10] ...9

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

row2 <-   strsplit(data[i],split = " ")[[1]][-c(1:11)]
mojecislo <- vector()
for (j in 1:4){
   for (k in 1:10){
     if (sum(table(factor(strsplit(row2[j], split="")[[1]],levels = letters[1:7]))==
               table(factor(strsplit(numerals_0_9[k], split="")[[1]],levels = letters[1:7])))==7){
       mojecislo[j] <- k-1}
   }
}
sum <- sum+mojecislo[1]*1000+mojecislo[2]*100+mojecislo[3]*10+mojecislo[4]
}
print(sum)
