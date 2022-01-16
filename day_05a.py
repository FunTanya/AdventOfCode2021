import numpy as np
import re

paths=[]
with open("data/input_05.txt") as f:
    for line in f:
        pattern = re.match("^(\d+),(\d+) -> (\d+),(\d+)$",line)
        pattern_int = list(map(int,pattern.groups()))
        paths.append(pattern_int)

maxfield =np.max(np.array(paths)) +1 # 0 included
field = np.zeros((maxfield,maxfield)) # indeces 0...

for path in paths:
    x1, y1, x2, y2 = path
    if y1 == y2:
        x1, x2 = min(x1,x2), max(x1,x2)
        field[y1,x1:x2+1] = field[y1,x1:x2+1] +1
    elif x1 == x2:
         y1, y2 = min(y1,y2), max(y1,y2)
         field[y1:y2+1,x1] = field[y1:y2+1,x1] +1
 
len(field[np.where(field>1)])
