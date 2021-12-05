  DF1 <- read.table("data/input_01.txt", header = FALSE)
  x <- DF1$V1
  # 1
  sum(diff(x)>0)
  # 2
  n <- length(x)
  sum(diff(x[1:(n-2)]+x[2:(n-1)]+x[3:n])>0)
