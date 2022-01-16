data = []
with open("data/input_08.txt") as f:
    for line in f:
        data.append(line.strip().split())
        
count1478 = 0
for quadruple in data:
    segment_counts = list(map(len,quadruple[-4:]))
    for count in segment_counts:
        if count in {2,3,4,7}:
            count1478 += 1

print(count1478)
