depths <- readLines("data/input_01.txt") %>% as.numeric()
# 1
sum(diff(depths) > 0)
# 2
index <- seq(1,length(depths)-2)
sum(diff(depths[index]+depths[index+1]+depths[index+2]) > 0)