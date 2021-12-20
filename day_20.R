MyFile <- "data/input_20.txt"
#  MyFile <- "testdata/test_20.txt"
BinToDec <- function(x){
  sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))}
repl <- function(mat33){
  temp <- paste0(t(mat33),collapse = "")
  kuk <- gsub("#","1",temp)
  kuk <- gsub("\\.","0",kuk)
  return(alg[BinToDec(kuk)+1])
}
alg <- unlist(strsplit(readLines(MyFile,n = 1),split = ""))
x <- readLines(MyFile)
x <- x[3:length(x)]
prvni <- matrix(unlist(strsplit(x,split = "")),nr=length(x),byrow = TRUE)
 
for (i in 1:2) {prvni <- cbind(".",rbind(".",prvni,"."),".")}
for (k in 1:50){
    nx <- nrow(prvni)
    dalsi <- prvni 
    for (i in (2:(nx-1))){
      for (j in (2:(nx-1))){
        x33 <- prvni[(i-1):(i+1),(j-1):(j+1)]
        dalsi[i,j]<- repl(x33)
      }
    }   
    if (k%%2==1){ 
      prvni <- cbind("#",rbind("#",dalsi[2:(nx-1),2:(nx-1)],"#"),"#")
      prvni <- cbind("#",rbind("#",prvni,"#"),"#")
      } else{
      prvni <- cbind(".",rbind(".",dalsi[2:(nx-1),2:(nx-1)],"."),".")
      prvni <- cbind(".",rbind(".",prvni,"."),".")}
}
table(prvni)
