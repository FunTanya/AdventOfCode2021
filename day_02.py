# part 1
f = open("data/input_02.txt")
depth, horizontal = 0, 0
for line in f:
    number = int(line.rstrip().split()[1])
    if line.rstrip().split()[0]=="down":
        depth += number
    elif line.rstrip().split()[0]=="up":
        depth -= number 
    else:
        horizontal += number
print(depth*horizontal)

# part 2
f = open("data/input_02.txt")
depth, horizontal, aim = 0, 0, 0
for line in f:
    number = int(line.rstrip().split()[1])
    if line.rstrip().split()[0]=="down":
        aim += number
    elif line.rstrip().split()[0]=="up":
        aim -= number 
    else:
        horizontal += number
        depth += aim*number
print(depth*horizontal)