  MyFile <- "data/input_14.txt"
  #MyFile <- "testdata/test_14.txt"
  x <- unlist(strsplit(readLines(MyFile)[1],split = ""))
  data <- read.table(text = gsub(" -> ", ",", readLines(MyFile)),sep=",")
  couple <- rownames(data)
  insert <- data[,1]
  final.table <- table(factor(x, levels=names(table(insert))))
  names <- names(final.table)
  counts <- final.table
  insert.poradi <- vector()
  for (i in 1:length(couple)){
    insert.poradi[i] <- which(names==insert[i])
  }
coovlivni <- function(char){
  added <- insert[couple==char]
  return(c(paste0(substr(char,1,1),added),
          paste0(added,substr(char,2,2)))
         )
}
vliv.1 <- vliv.2 <- pocatecnidvojice <- vector()
for (i in 1:length(couple)){
  vliv.1[i] <- coovlivni(couple[i])[1]
  vliv.2[i] <- coovlivni(couple[i])[2]
}
for (i in 1:(length(x)-1)){
  pocatecnidvojice[i] <- paste0(x[i],x[i+1])
}
kolikratkteradvojice <- as.numeric(table(factor(pocatecnidvojice, levels = couple)))
addedcounts <- vector()
for (i in 1:length(counts)){
  addedcounts[i]<- sum(kolikratkteradvojice[insert.poradi==i])}
counts <- counts+addedcounts

for (i in 1:39){ #9
  novypocet <-integer(length(couple))
  for (i in 1:length(couple)){
    pismenko <- insert[couple==vliv.1[i]]
    counts[pismenko]=counts[pismenko]+kolikratkteradvojice[i]
    novypocet[couple==vliv.1[i]] <- novypocet[couple==vliv.1[i]]+kolikratkteradvojice[i]
    pismenko <- insert[couple==vliv.2[i]]
    counts[pismenko]=counts[pismenko]+kolikratkteradvojice[i]
    novypocet[couple==vliv.2[i]] <- novypocet[couple==vliv.2[i]]+kolikratkteradvojice[i]
  }
    kolikratkteradvojice <- novypocet
}
format(max(counts)-min(counts), scientific = FALSE)