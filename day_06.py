from collections import Counter
with open("data/input_06.txt") as data:
    lanternfish = data.readline().strip().split(",")
    lanternfish = list(map(int, lanternfish))

table = Counter(lanternfish + list(range(9)))
table = sorted(table.items())
counts = [x[1]-1 for x in table]

for i in range(256): # or 80
  old = counts[0]
  counts =  counts[1:] + [counts[0]]
  counts[6] = counts[6]+old

sum(counts)
