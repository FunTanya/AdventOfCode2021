MyFile <- "data/input_20.txt"
alg <- unlist(strsplit(readLines(MyFile,n = 1),split = ""))
alg <- gsub("#","1",alg)
alg <- gsub("\\.","0",alg)
x <- readLines(MyFile)
x <- x[3:length(x)]
x <- gsub("#","1",x)
x <- gsub("\\.","0",x)
prvni <- matrix(unlist(strsplit(x,split = "")),nr=length(x),byrow = TRUE)
for (i in 1:2) {prvni <- cbind(0,rbind(0,prvni,0),0)}

for (k in 1:50){ #50 or 2
  nx <- nrow(prvni)
  dalsi <- prvni 
  for (i in (2:(nx-1))){
    for (j in (2:(nx-1))){
      x33 <- prvni[(i-1):(i+1),(j-1):(j+1)]
      dalsi[i,j]<- alg[strtoi(paste0(t(x33),collapse = ""), base = 2)+1]
    }
  }   
  if (k%%2==1){ 
    prvni <- cbind(1,rbind(1,dalsi[2:(nx-1),2:(nx-1)],1),1)
    prvni <- cbind(1,rbind(1,prvni,1),1)
  } else{
    prvni <- cbind(0,rbind(0,dalsi[2:(nx-1),2:(nx-1)],0),0)
    prvni <- cbind(0,rbind(0,prvni,0),0)}
}
table(prvni)[2]
