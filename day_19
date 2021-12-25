tran.1 <- matrix(c(1,2,3,   2,3,1,   3,1,2), byrow = T, nc=3)
tran.2 <- list( diag(c(1,1,1)), diag(c(-1,-1,1)), diag(c(-1,1,-1)), diag(c(1,-1,-1)))
tran.3 <- matrix( c(0,0,-1, 0,-1,0, -1,0,0), nr=3, byrow = T)
rotation <- function(a, ijk){
  a.i <- a[tran.1[ijk[1],]] 
  a.j <- t(as.numeric(a.i)) %*% tran.2[[ijk[2]]] 
  a.k<- a.j
  if (ijk[3]==2) {a.k <- as.matrix(a.j) %*% tran.3}
  return(as.numeric(a.k))
}
rotation.data <- function(old.data,ijk){
  new.data <- as.data.frame(t(apply(old.data,1,rotation,ijk = ijk)))
  new.data <- as.data.frame(t(apply(old.data,1,rotation,ijk = ijk)))
  colnames(new.data)<- c("x","y","z")
  return(new.data)
}

find.schift <- function(from,to){
  rotace <-c(NA,NA,NA)
  posun <- c(NA,NA,NA)
  for (i in 1:3){
    for (j in 1:4){
      for (k in 1:2){
        to.rotated <- rotation.data(to, c(i,j,k))
        rozdily.x <- sapply(from[,1],"-",to.rotated[,1])
        hodnota.x <- as.numeric(names(which.max(table(rozdily.x))))
        minus.x <- sum(rozdily.x==hodnota.x,na.rm = TRUE)
        rozdily.y <- sapply(from[,2],"-",to.rotated[,2])
        hodnota.y <- as.numeric(names(which.max(table(rozdily.y))))
        minus.y <- sum(rozdily.y==hodnota.y,na.rm = TRUE)
        rozdily.z <- sapply(from[,3],"-",to.rotated[,3])
        hodnota.z <- as.numeric(names(which.max(table(rozdily.z))))
        minus.z <- sum(rozdily.z==hodnota.z,na.rm = TRUE)
        if ((minus.x>11) & (minus.y>11)& (minus.z>11) ) {
          return(list(rotace=c(i,j,k), posun=c(hodnota.x,hodnota.y,hodnota.z)))
        }                                                                   
      }
    }
  }
}

#MyFile <- "data/input_19.txt"
MyFile <- "testdata/test_19.txt"
data <- read.csv(MyFile,header = FALSE)
scan.i <- -1
for (i in 1:nrow(data)){
  if (!grepl("scan", data[i,1], fixed = TRUE)){
    data[i,4] <- scan.i
  } else {data[i,4] <-NA
  data[i,1] <- NA
  scan.i <- scan.i+1}
}
colnames(data) <- c("x","y","z","scanner")
data <- na.omit(data)
data$x <- as.numeric(data$x)
n.scanner <- c(table(data$scanner))
data.zero <- data[data$scanner==0,]
scannery <- 1:(length(n.scanner)-1) 
total.sum <- nrow(data)
base.scanner <- 0 
number.base.scanner <- 1
posuny <- c(0,0,0)
repeat{
  base.scanner.0 <- base.scanner[number.base.scanner]
  for (scan.i in scannery){
    kuk <-  find.schift(from = data.zero[data.zero['scanner']==base.scanner.0,1:3],
                        to = data[data['scanner']==scan.i,1:3])
    if (!is.null(kuk)){
      d <- rotation.data(data[data$scanner==scan.i,1:3],kuk$rotace)  
      temp <- sweep(d, 2, as.numeric(kuk$posun), "+")
      posuny <- rbind(posuny,kuk$posun)
      data.zero <- rbind(data.zero,cbind(temp,scanner=scan.i))
      scannery <- scannery[!scannery %in% scan.i]
      #print(scan.i)
      base.scanner <- c(base.scanner,scan.i)
    }
  }
  number.base.scanner <- number.base.scanner+1
  if (nrow(data.zero)==total.sum) break
}
nrow(unique(data.zero[,1:3]))
max(dist(posuny,method = "manhattan"))
