commands <- read.table("data/input_02.txt",col.names = c("direction","magnitude"))

commands %<>%
  mutate(forward = magnitude * (direction=="forward")) %>% 
  mutate(down = magnitude * (direction=="down")) %>% 
  mutate(up = magnitude * (direction=="up")) %>% 
  mutate(aim = cumsum(down-up)) 

with(commands, sum(forward) * sum(down-up) )
with(commands, sum(forward) * sum(forward*aim) )