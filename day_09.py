import numpy as np

data = [] 
with open("data/input_09.txt") as f: 
    for line in f:
        x = [int(i) for i in line.strip()]
        data.append(x)

# part 1
result = 0
matrix = np.array(data)
r,c = np.shape(matrix)
matrix = np.c_[[9]*r,matrix,[9]*r]
matrix = np.r_[[[9]*(c+2)],matrix,[[9]*(c+2)]]
for i in range(1,r+1):
  for j in range(1,c+1):
     if matrix[i,j]< min([matrix[i-1,j],matrix[i+1,j], matrix[i,j-1],matrix[i,j+1]]):
       result += matrix[i,j]+1

print(result)
