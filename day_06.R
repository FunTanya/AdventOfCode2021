data <- as.numeric(read.table("data/input_06.txt", header = FALSE, sep = ","))
counts <- as.numeric(table(factor(data, levels = 0:8)))
for (i in 1:256){
  old <- counts[1]
  counts <-  c(counts[-1],counts[1])
  counts[7] <- counts[7]+old
}

format(sum(counts), scientific = FALSE)
