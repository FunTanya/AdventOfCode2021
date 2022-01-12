# part 1
def GammaToDec(x):
    string_ints = [str(ints) for ints in x]
    str_of_ints = "".join(string_ints)
    return int(str_of_ints,2)

data = []
f = open("data/input_03.txt",'r')
for line in f:
    x = [int(i) for i in line.rstrip()]
    data.append(x)
n=len(data)
gamma =[]
for j in range(len(data[0])):
    sum0 = 0
    for i in range(n):
        if data[i][j] == 0:
            sum0 +=1
    if sum0>  n/2:
        gamma.append(0)
    else:
        gamma.append(1)
gamma_reverse = [1 - i  for i in gamma]

print(GammaToDec(gamma)*GammaToDec(gamma_reverse))
# part 2
oxygen = C02 = []
j=0 # koukam na nultou cifru....
temp_data = data
while True:
    sum0 = 0
    for i in range(len(temp_data)): #zbyvajici data
        if temp_data[i][j] == 0:
            sum0 +=1
    if sum0>len(temp_data)/2:
        most_common = 0
    else:
        most_common = 1
    oxygen=[]
    for i in range(len(temp_data)):
        if temp_data[i][j] == most_common:
            oxygen.append(temp_data[i]) 
    if len(oxygen)==1:
        break
    else: 
        temp_data=oxygen
        j+=1

j=0 # koukam na nultou cifru....
temp_data = data
while True:
    sum0 = 0
    for i in range(len(temp_data)): #zbyvajici data
        if temp_data[i][j] == 0:
            sum0 +=1
    if sum0>len(temp_data)/2:
        less_common = 1
    else:
        less_common = 0
    CO2=[]
    for i in range(len(temp_data)):
        if temp_data[i][j] == less_common:
            CO2.append(temp_data[i]) 
    if len(CO2)==1:
        break
    else: 
        temp_data=CO2
        j+=1
print(GammaToDec(oxygen[0])*GammaToDec(CO2[0]))
