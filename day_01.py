depths = []
with open("data/input_01.txt") as f:
    #  depths = [int(line.strip()) for line in f] #shorter 
    for line in f:
        depths.append(int(line.strip()))
    
def Mycounter(x):
    count = 0
    for i in range(0, len(x)-1):
        diff = x[i+1]-x[i]
        if diff>0:
            count +=1
    return count

# part 1
print(Mycounter(depths))
# part 2
sum3=[]
for i in range(0, len(depths)-2):
    sum3.append(depths[i]+depths[i+1]+depths[i+2])
print(Mycounter(sum3))   
