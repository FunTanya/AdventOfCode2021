from collections import Counter
with open("data/input_06.txt") as data:
    lanternfish = data.readline().strip().split(",")
    lanternfish = list(map(int, lanternfish))

counts = [Counter(lanternfish)[i] for i in range(9)]

for i in range(256): # or 80
  old = counts[0]
  counts =  counts[1:] + [counts[0]]
  counts[6] = counts[6]+old

sum(counts)
