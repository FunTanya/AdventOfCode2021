from itertools import chain

def BitsToDec(x):
    list_of_str_digits = [str(digit) for digit in x]
    str_digits = "".join(list_of_str_digits)
    return int(str_digits,2)

data = [] 
with open("data/input_03.txt") as f: # single digits
    for line in f:
        x = [int(i) for i in line.strip()]
        data.append(x)

# part 1
n=len(data)
gamma =[]
for j in range(len(data[0])):
    sum0 = 0
    for i in range(n):
        if data[i][j] == 0:
            sum0 +=1
    if sum0 > n/2:
        gamma.append(0)
    else:
        gamma.append(1)
        
gamma_reverse = [1 - bit  for bit in gamma]
print(BitsToDec(gamma)*BitsToDec(gamma_reverse))

# part 2
def BitRating(data,target_val):
    j=0 # start with first digit
    temp_data = data
    while True:
        sum0 = 0
        for i in range(len(temp_data)): #data after restriction
            if temp_data[i][j] == 0:
                sum0 +=1
        if sum0>len(temp_data)/2:
            less_common = target_val
        else:
            less_common = 1-target_val
        rating=[]
        for i in range(len(temp_data)):
            if temp_data[i][j] == less_common:
                rating.append(temp_data[i]) 
        if len(rating)==1:
            break
        else: 
            temp_data=rating
            j+=1
    return BitsToDec(list(chain(*rating)))
          

print(BitRating(data, target_val = 1) * BitRating(data,target_val = 0))
