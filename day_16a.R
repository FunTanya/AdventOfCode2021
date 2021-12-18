library(BMS)
bin2dec <- function(x) {
  sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))}

sum <- 0
cototumame <- function(x){
  version <- bin2dec(x[1:3])
  type <- bin2dec(x[4:6])
  print(version)
  sum <<- sum+version#sum <<- sum+version
  x <- x[-(1:6)]
  if (type==4){
    repeat{
      pom <- x[1]
      x <- x[-(1:5)]
      if (pom==0){break}
    }
    if ((bin2dec(x)==0) | (identical(x,numeric(0)))) 
    {
      print("konec celeho"); 
    }
    else {cototumame(x)}
  }
  else if (x[1]==0) {
    length.next <- bin2dec(x[2:16])
    x <- x[-(1:16)]
    cototumame(x)
  }
  else {
    num.pockets <- bin2dec(x[2:12])
    x <- x[-(1:12)]
    cototumame(x)
  }
  return(sum)
}   
cototumame(x)
