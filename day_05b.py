import numpy as np
import re

def newrange(a,b):
    if a<=b:
        return range(a,b+1)
    else:
        return range(a,b-1,-1)

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
    field[newrange(y1,y2),newrange(x1,x2)] = field[newrange(y1,y2),newrange(x1,x2)] +1
 
len(field[np.where(field>1)])
