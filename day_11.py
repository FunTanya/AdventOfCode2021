import numpy as np
import itertools
from itertools import product

grid_n=10
def adjacent(_i,_j):
    for i,j in product(range(-1,2),range(-1,2)):
        if (i,j )== (0,0): continue
        if i+_i in range(grid_n):
            if j +_j in range(grid_n):
                yield i,j
#input
data = [] 
with open("data/input_11.txt") as f: 
    for line in f:
        x = [int(i) for i in line.strip()]
        data.append(x)
grid = np.array(data)

## part 1
flashes_number = 0
for step in range(100):
    grid = grid +1
    while np.max(grid)>9:
        for i,j in product(range(grid_n),range(grid_n)):
            if grid[i,j]>9:
                grid[i,j]=0
                flashes_number +=1
                for ii,jj in adjacent(i,j):
                    if grid[ii+i, jj +j]>0:
                        grid[ii+i, jj +j]+=1  

print(flashes_number)        

##part 2
round_number = 0
step = 0
while round_number<100:
    step+=1
    round_number = 0
    grid = grid +1
    while np.max(grid)>9:
        for i,j in product(range(grid_n),range(grid_n)):
            if grid[i,j]>9:
                grid[i,j]=0
                flashes_number +=1
                round_number +=1
                for ii,jj in adjacent(i,j):
                    if grid[ii+i, jj +j]>0:
                        grid[ii+i, jj +j]+=1  
    print(round_number)
print(step)
