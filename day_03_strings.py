data=[]
with open("data/input_03.txt") as f: # sequencies of 10-digits-strings
    for line in f:
        data.append(line.strip())

# part 1
def ReverseNumber(arg):
    rev_bits = [1 - int(bit)  for bit in list(arg)]        
    return ''.join([str(digit) for digit in rev_bits])   

n=len(data) # 1000 x string of 10 digits
gamma = ''
for digit in range(len(data[0])): # for each of 12 digits
    sum0 = 0
    for number in data:
        if number[digit] == "0":
            sum0 += 1
    if sum0 > n/2:
        gamma += '0'
    else:
        gamma += '1'

answer_1 = int(gamma,2)*int(ReverseNumber(gamma),2)
print(f"and the answer is ... {answer_1}")
