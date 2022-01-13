import time
start = time.time()
data = []
f = open("data/input_15.txt",'r')
for line in f:
    x = [int(i) for i in line.rstrip()]
    data.append(x)
n=len(data[0])
nn=n*n

path = [ [ float('inf') for i in range(n) ] for j in range(n) ]
path[0][0]=0
Z_unvisited = list(range(0,nn))

while True:
    mini = float('inf')
    for k in Z_unvisited:
        nenavstivena_path = path[k // n][k % n]
        if nenavstivena_path < mini:
            mini =  nenavstivena_path
            minx = k
    i = minx // n
    j = minx % n
    Z_unvisited.remove(minx)
    if j < n-1:
        alt = path[i][j]+data[i][j+1]
        if alt < path[i][j+1]:
            path[i][j+1] = alt
    if j > 0:
        alt = path[i][j]+data[i][j-1]
        if alt < path[i][j-1]:
            path[i][j-1] = alt
    if i > 0:
        alt = path[i][j]+data[i-1][j]
        if alt < path[i-1][j]:
            path[i-1][j] = alt
    if i < n-1:
        alt = path[i][j]+data[i+1][j]
        if alt < path[i+1][j]:
            path[i+1][j] = alt
    if len(Z_unvisited)==0: break
    
print(time.time() - start)
print(path[n-1][n-1])
