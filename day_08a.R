MyFile <- "data/input_08.txt"
data <- readLines(MyFile)
count <- 0
for (i in 1:(length(data))){
  values <-   unlist(strsplit(data[i],split = " "))[-(1:11)]
  segments_on <- sapply(values,nchar)
  count <- count + sum(segments_on %in% c(2,3,4,7))
}
print(count)
