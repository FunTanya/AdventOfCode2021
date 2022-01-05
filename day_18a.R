rad2tab <- function(x){
  cisla <- pocty <-vector()
  j <- 1
  pocty[j] <- 0  
  for (i in (1:length(x))){
    if (x[i]==(-1)){
      pocty[j] <- pocty[j]+1
    } else if (x[i]==(-2)){
      pocty[j] <- pocty[j]-1
    }    else  {
      cisla[j]  <- x[i]
      j <- j+1
      pocty[j] <- pocty[j-1]}
  }
  return(list(pocty=pocty[-length(pocty)], cisla=cisla))
} 
snailsum <- function(a,b){
  sum.cisla <- c(a$cisla,b$cisla)
  sum.pocty <- c(a$pocty,b$pocty)+1
  return(list(pocty=sum.pocty, cisla=sum.cisla))
}
explode <- function(a){
  pocty <- as.numeric(a$pocty)
  cisla <- as.numeric(a$cisla)
  if (max(pocty)>4){
    ii <- which.max(pocty)
    if (ii==1){
      cisla <- c(0,sum(cisla[2:3]),tail(cisla,-3))
      pocty <- c(pocty[1]-1, tail(pocty,-2))
    } else  if (ii==length(cisla)-1){
      cisla <- c(head(cisla,length(cisla)-3),sum(cisla[(length(cisla)-2):(length(cisla)-1)]),0)
      pocty <- c(head(pocty,length(pocty)-2),pocty[length(pocty)]-1)
    }  else {
      cisla <- c(head(cisla,ii-2),
                 sum(cisla[(ii-1):(ii)]),0,
                 sum(cisla[(ii+1):(ii+2)]),
                 tail(cisla,length(cisla)-ii-2))
      pocty <- c(head(pocty,ii-1),pocty[ii]-1,tail(pocty,length(pocty)-ii-1))}
  }
  return(list(pocty=pocty, cisla=cisla))
}
split <- function(a){
  pocty <- as.numeric(a$pocty)
  cisla <- as.numeric(a$cisla)
  ii <- which(cisla>9)[1]
  nove1 <- ceiling(cisla[ii]/2)
  nove2 <- floor(cisla[ii]/2)
  cisla[ii] <- nove2
  if (ii==1){
    cisla <- c(cisla[1:ii],nove1,cisla[(ii+1):length(cisla)])
    pocty <- c(pocty[ii]+1,pocty[ii]+1,pocty[(ii+1):length(pocty)]) 
  } else  if (ii!=length(cisla)){
    cisla <- c(cisla[1:ii],nove1,cisla[(ii+1):length(cisla)])
    pocty <- c(pocty[1:(ii-1)],pocty[ii]+1,pocty[ii]+1,pocty[(ii+1):length(pocty)])   
  } else {
    cisla <- c(cisla[1:ii],nove1)
    pocty <- c(pocty[1:(ii-1)],pocty[ii]+1,pocty[ii]+1)
  }
  return(list(pocty=pocty, cisla=cisla))
}
magnitude <- function(kuk){
  repeat{
    i <- which.max(kuk$pocty)  
    kuk$pocty[i]==kuk$pocty[i+1]
    if (kuk$pocty[i]==kuk$pocty[i+1]){
      sum <- as.numeric(kuk$cisla[i])*3+as.numeric(kuk$cisla[i+1])*2
      kuk$cisla[i] <- sum
      kuk$cisla <- kuk$cisla[-(i+1)]
      kuk$pocty[i] <- kuk$pocty[i] -1
      kuk$pocty<- kuk$pocty[-(i+1)] 
    }
    if (length(kuk$pocty)<2){return(sum); break}
  }
}

MyFile <- "data/input_18.txt"
dataall <- readLines(MyFile)
data.cisla <- data.pocty <- list()
for (i in 1:length(dataall)){ #snailfish number as a table
  radek <- unlist(strsplit(dataall[i],split = ""))
  temp <- gsub("\\[",-1,radek)
  temp <-gsub("\\]",-2,temp)
  temp <-temp[temp!=","]
  data.cisla[[i]] <- rad2tab(temp)[2]$cisla
  data.pocty[[i]] <- rad2tab(temp)[1]$pocty
}
#addition of numbers
result <- data.frame(pocty =  data.pocty[[1]], cisla= data.cisla[[1]])
for (i in 2:length(data.cisla)){
  nactene <- data.frame(pocty =  data.pocty[[i]], cisla= data.cisla[[i]])
  result  <-  snailsum(result,nactene)
  repeat{
    if (max(result$pocty)>4) {
      result <- explode(result)} else
        if (max(result$cisla)>9) {result <- split(result)}
    if ((max(result$pocty)<5)  &  (max(as.numeric(result$cisla))<10)) break
  }
}
magnitude(result)
