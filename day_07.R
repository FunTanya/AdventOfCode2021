MyFile <- "data/input_07.txt"
data <- as.numeric(read.table(MyFile, header = FALSE, sep = ","))
horrible <- function(a){sum(1:a)}
cost.1 <- cost.2 <- vector()
for (i in (min(data):max(data))){
  cost.1[i] <-  sum(abs(data-i))
  cost.2[i] <-  sum(sapply(abs(data-i), FUN = horrible))
}
min(cost.1);min(cost.2)