import numpy as np
def count_bottom(_i,_j):  
    bottom_matrix = np.full((r+2,c+2),fill_value=float("Inf"))         
    bottom_matrix[_i,_j]=True
    visit_and_check = {(_i,_j)}
    visited = {(_i,_j)}
    while True:
        visit_new = set()
        for i,j in visit_and_check:
            if matrix[i-1,j]<9:
                bottom_matrix[i-1,j] = True
                visit_new.add((i-1,j)) 
            if matrix[i+1,j]<9:
                bottom_matrix[i+1,j] = True
                visit_new.add((i+1,j)) 
            if matrix[i,j-1]<9:
                bottom_matrix[i,j-1] = True
                visit_new.add((i,j-1)) 
            if matrix[i,j+1]<9:
                bottom_matrix[i,j+1] = True
                visit_new.add((i,j+1)) 
        visit_and_check =  visit_new - visited            
        visited = visited | visit_and_check  
        if visit_and_check==set():
            break
    return np.sum(bottom_matrix[bottom_matrix==1])
#input
data = [] 
with open("data/input_09.txt") as f: 
    for line in f:
        x = [int(i) for i in line.strip()]
        data.append(x)

matrix = np.array(data)
r,c = np.shape(matrix)
matrix = np.c_[[9]*r,matrix,[9]*r]
matrix = np.r_[[[9]*(c+2)],matrix,[[9]*(c+2)]]

# part 1
result = 0
for i in range(1,r+1):
  for j in range(1,c+1):
     if matrix[i,j]< min([matrix[i-1,j],matrix[i+1,j], matrix[i,j-1],matrix[i,j+1]]):
       result += matrix[i,j]+1

print(result)
# part 2
bottoms = []
for i in range(1,r+1):
  for j in range(1,c+1):
     if matrix[i,j]< min([matrix[i-1,j],matrix[i+1,j], matrix[i,j-1],matrix[i,j+1]]):
         bottoms.append(count_bottom(i,j))
         
bottoms.sort(reverse = True)
print(int(np.prod(bottoms[:3])))
