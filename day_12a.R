inc <- function(x){eval.parent(substitute(x <- x + 1))}
poradi.mesta <- function(char){
  return (which(hodnoty==char))
}
jevelke <- function(char){
  return(toupper(char)==char)
}
jemale <- function(char){
  return(tolower(char)==char)
}
posledni <- function(x){x[length(x)]}
muzu.pridat <- function(char,dosudcesta){
  test <- FALSE
  if (TSP.matrix[posledni(dosudcesta),poradi.mesta(char)]>0)
    if ((jevelke(char)) | (jemale(char) & (sum(dosudcesta==char)) <1))
    {test <- TRUE}
  else {test <- FALSE}
  if (max(char==zakazane[[length(dosudcesta)]]))  {test <- FALSE}
  return(test)
}

{MyFile <- "data/input_12.txt"
#MyFile <- "testdata/test_12.txt"
data <- unlist(strsplit(readLines(MyFile),split = "-"))
data <- matrix(data,ncol=2,byrow=TRUE)
hodnoty <- names(table(data))
poc.mest <- length(hodnoty)
poc.cest <- nrow(data)
TSP.matrix <- matrix(0,nrow = poc.mest,ncol = poc.mest)
for (i in 1:poc.cest){
  TSP.matrix[poradi.mesta(data[i,1]),poradi.mesta(data[i,2])] <-TSP.matrix[poradi.mesta(data[i,2]),poradi.mesta(data[i,1])] <-  1
  if (jevelke(data[i,1]) |jevelke(data[i,2])) 
    TSP.matrix[poradi.mesta(data[i,1]),poradi.mesta(data[i,2])] <-TSP.matrix[poradi.mesta(data[i,2]),poradi.mesta(data[i,1])] <- 1 #999
}
TSP.matrix[,poradi.mesta("start")] <- 0
TSP.matrix[poradi.mesta("end"),] <- 0
colnames(TSP.matrix) <-rownames(TSP.matrix) <- hodnoty
TSP.matrix }#nacteni

cesta <- "start"
vysl.pocet <- 0
zakazane <- list()
for (i in 1:100)
  zakazane[[i]] <- c("start")

repeat{
  dalsi.moznosti <-  which(TSP.matrix[posledni(cesta),]==1)
  dalsi.moznosti.ok <- sapply(names(dalsi.moznosti),muzu.pridat, dosudcesta=cesta)
  dalsi.moznosti <- dalsi.moznosti[dalsi.moznosti.ok==TRUE]
  if (length(dalsi.moznosti)==0 & (length(cesta)>1)){
    zakazane[[length(cesta)]] <- "start"
    zakazane[[length(cesta)-1]] <- c(zakazane[[length(cesta)-1]],cesta[length(cesta)])
    cesta <- cesta[-length(cesta)]
  } 
  else {cesta <- c(cesta,names(dalsi.moznosti[1]))}
  if (is.na(posledni(cesta))) break
  if (posledni(cesta)=="end") {inc(vysl.pocet)}
}
print(vysl.pocet)
