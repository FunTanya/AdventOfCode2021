#MyFile <- "testdata/test_22.txt"
 MyFile <- "data/input_22.txt"
data <- readLines(MyFile)
data <- gsub("on ","1,",data)
data <- gsub("off ","0,",data)
data <- gsub("x=","",data)
data <- gsub("y=","",data)
data <- gsub("z=","",data)
data <- gsub("\\..",",",data)
data <- read.csv(textConnection(data), header = FALSE)
names(data) <- c("val","x1","x2","y1","y2","z1","z2")
data[,c(3,5,7)] <- data[,c(3,5,7)]+1

attach(data)
n1 <- length(unique(c(x1,x2)))
n2 <- length(unique(c(y1,y2)))
n3 <- length(unique(c(z1,z2)))
matice <- vector()
density <- matice

x <- as.numeric(unique(sort(c(x1,x2))))
y <- as.numeric(unique(sort(c(y1,y2))))
z <- as.numeric(unique(sort(c(z1,z2))))
matice.1 <- numeric((n1-1)*(n2-1)*(n3-1)/2)
matice.2 <- numeric((n1-1)*(n2-1)*(n3-1)/2)
delka <- length(matice.1)

for (radek in 1:nrow(data)){
  i.1 <- which(x1[radek]==x)
  i.2 <- which(x2[radek]==x)-1
  j.1 <- which(y1[radek]==y)
  j.2 <- which(y2[radek]==y)-1
  k.1 <- which(z1[radek]==z)
  k.2 <- which(z2[radek]==z)-1
  for (i in i.1:i.2){
    for (j in j.1:j.2){
      for (k in k.1:k.2){
        pomoc=(i-1)*(n3-1)*(n2-1)+(j-1)*(n3-1)+k
          if (pomoc<=delka){
            matice.1[pomoc] <-val[radek]* (x[i+1]-x[i])*(y[j+1]-y[j])*(z[k+1]-z[k])}
          else{
          matice.2[pomoc-delka] <-val[radek]* (x[i+1]-x[i])*(y[j+1]-y[j])*(z[k+1]-z[k])
          }
        }
       }
    }
  }  
detach(data)

format(sum(matice.1)+sum(matice.2),scientific = FALSE)
