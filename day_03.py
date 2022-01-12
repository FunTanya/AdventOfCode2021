# part 1
data = []
f = open("data/input_03.txt")
for line in f:
    x = [int(i) for i in line.rstrip()]
    data.append(x)
gamma =[]
for j in range(0,12):
    sum0 = 0
    for i in range(len(data)):
        if data[i][j] == 0:
            sum0 +=1
    if sum0>len(data)/2:
        numero = 0
    else:
        numero = 1
    gamma.append(numero)
print(gamma)
reverse = [1 - number  for number in gamma]
print(reverse)

string_ints = [str(int) for int in gamma]
str_of_ints = "".join(string_ints)
first = int(str_of_ints,2)

string_ints = [str(int) for int in reverse]
str_of_ints = "".join(string_ints)
second = int(str_of_ints,2)

print(first*second) 