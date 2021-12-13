MyFile <- "data/input_07.txt"
data <- as.numeric(read.table(MyFile, header = FALSE, sep = ","))
horrible <- function(a){sum(1:a)}
cost.1 <- cost.2 <- vector()
for (i in (min(data):max(data))){
  cost.1[i] <-  sum(abs(data-i))
  cost.2[i] <-  sum(sapply(abs(data-i), FUN = horrible))
}
min(cost.1);min(cost.2)

# cost.1 after coffee break :-)
sum((abs(data-median(data)))) 

# cost.2 by  CrashAndSideburns
# https://www.reddit.com/r/adventofcode/comments/rawxad/2021_day_7_part_2_i_wrote_a_paper_on_todays/
k <- floor(mean(data))
0.5*sum((k-data)^2+abs(k-data))
k <- ceiling(mean(data))
0.5*sum((k-data)^2+abs(k-data))
