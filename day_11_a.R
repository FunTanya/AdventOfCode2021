inc <- function(x){eval.parent(substitute(x <- x + 1))}
increase <- function(data){ #for each cell once, you need to repeat
  for (i in 2:12){
    for (j in 2:12)
      if ((data[i,j]>9) & (change.allowed[i,j])){ 
        inc(data[(i-1):(i+1),(j-1):(j+1)])
        eval.parent(substitute(change.allowed[i,j] <- FALSE))
        eval.parent(was.change <- TRUE)
      }
  }
  return(data)
}
#reading data
MyFile <- "data/input_11.txt"
data.source <- readLines(MyFile)
n <- max(nchar(data.source))
data<- read.fwf(textConnection(data.source), rep(1, n))
data <- cbind(-999,data,-999);data <- rbind(-999,data,-999)
#main part A
flashes <- 0
for (step.i in (1:100)){
  change.allowed <- data==data
  data <- data+1  
  was.change <- FALSE
  repeat{ 
    olddata <- data
    repeat{ 
      data <- increase(data)
      if (was.change==FALSE){break}
    }
    if (identical(data,olddata)){break}
  }
  flashes <- flashes+sum(data>9)
  data[data>9] <- 0
}
print(flashes)
