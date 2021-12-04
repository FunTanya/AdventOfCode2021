commands <- read.table("data/input_02.txt", header = FALSE)
direction <- commands[,1]
magnitude <- commands[,2]
forward <- magnitude*(direction=="forward")
down <- magnitude*(direction=="down")
up <- magnitude*(direction=="up")
aim <- cumsum(down-up)

horizontal <- sum(forward)
depth <- sum(down)-sum(up)
depth.2 <- sum(forward*aim)

horizontal*depth
horizontal*depth.2