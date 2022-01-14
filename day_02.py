# part 1
data = []
with open("data/input_02.txt") as f:
    for line in f:
        direction, magnitude = line.strip().split()
        data.append((direction, int(magnitude)))

depth, horizontal = 0, 0
for direction, magnitude in data:
    if direction=="down":
        depth += magnitude
    elif direction=="up":
        depth -= magnitude
    else:
        horizontal += magnitude
print(depth*horizontal)

# part 2
depth, horizontal, aim = 0, 0, 0
for direction, magnitude in data:
    if direction=="down":
        aim += magnitude
    elif direction=="up":
        aim -= magnitude 
    else:
        horizontal += magnitude
        depth += aim*magnitude
print(depth*horizontal)
