import time
start = time.time()
data = []
f = open("data/input_15.txt",'r')
for line in f:
    x = [int(i) for i in line.rstrip()]
    data.append(x)
n=len(data[0])
nn=n*n

graph = [[]]
for i in range(n):
    # j=0 
    graph.append([i*n+    +2,    i*n+1,data[i][0]]) #from right
    graph.append([(i-1)*n+ 1,    i*n+1,data[i][0]]) #from up
    graph.append([(i+1)*n+ 1,    i*n+1,data[i][0]]) #from down
    for j in range(1,n-1):
        graph.append([i*n+    (j-1)+1,    i*n+j+1,data[i][j]]) #from left
        graph.append([i*n+    (j+1)+1,    i*n+j+1,data[i][j]]) #from right
        graph.append([(i-1)*n+ j+1,       i*n+j+1,data[i][j]]) #from up
        graph.append([(i+i)*n+ j+1,       i*n+j+1,data[i][j]]) #from down
    #j=n-1
    graph.append([i*n+n+1,i*n+n,data[i][n-1]]) #from right
    graph.append([(i-1)*n+ n,      i*n+n,data[i][n-1]]) #from down
    graph.append([(i+1)*n+ n,      i*n+n,data[i][n-1]]) #from up

print(time.time() - start)
