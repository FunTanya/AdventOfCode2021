from statistics import median
with open("data/input_07.txt") as data:
    positions = data.readline().strip().split(",")
    positions = list(map(int, positions))

# part 1
x = [ abs(pos - median(positions)) for pos in positions]
int(sum(x))


# part 2
new_rates = np.cumsum(range(max(positions)+1)) #from Disi77
minimum = float("Inf")
for final_position in range(min(positions),max(positions)):
    totalsum = 0
    for position in positions:
        totalsum += new_rates[abs(position - final_position)]
    if totalsum < minimum:
        minimum = totalsum
        
print(minimum)    
