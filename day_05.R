inc <- function(x){eval.parent(substitute(x <- x + 1))}
paths <- read.table(text = gsub("->", ",", readLines("data/input_05.txt")),sep=",")
colnames(paths) <- c("x1","y1","x2","y2")
data <- inc(paths)
diagram <- matrix(0,max(data),max(data))

attach(data)
for (i in (1:nrow(paths))){
  if (y1[i]==y2[i])
    inc(diagram[y1[i],x1[i]:x2[i]])
  else
    if (x1[i]==x2[i])
      inc(diagram[y1[i]:y2[i],x1[i]])
    else {
      x.move <- x2[i] - x1[i]
      y.move <- y2[i] - y1[i]
      inc(diag(diagram[y1[i] + (0:y.move), x1[i] + (0:x.move)]))
    }
}
detach(data)
sum(diagram>1)