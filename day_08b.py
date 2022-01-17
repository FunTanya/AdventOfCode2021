data = []
with open("data/input_08.txt") as f:
    for line in f:
        data.append(line.strip().split())

class DigitSet:
    def __init__(self,array):
        self.digitset = array
        self.sequence =dict()
    def Find1478(self,a1478):
        for digit in self.digitset:
            if len(digit) == len1478[a1478]:
                self.sequence[digit]=a1478
                self.digitset.remove(digit)
                break
    def Find3(self):
        for digit in self.digitset:
            if len(digit)==5 and set(list(self.sequence.keys())[0]).issubset(set(digit)):
                self.sequence[digit]=3
                self.digitset.remove(digit)
                break
    def Find9(self):
        for digit in self.digitset:
            if len(digit)==6 and set(list(self.sequence.keys())[1]).issubset(set(digit)):
                self.sequence[digit]=9
                self.digitset.remove(digit)
                break
    def Find0(self):
        for digit in self.digitset:
            if  set(list(self.sequence.keys())[0]).issubset(set(digit)):
                self.sequence[digit]=0
                self.digitset.remove(digit)
                break
    def Find6(self):
        for digit in self.digitset:
            if  len(digit)==6:
                self.sequence[digit]=6
                self.digitset.remove(digit)
                break
    def Find52(self):
        for digit in self.digitset:
            if  set(digit).issubset(set(list(self.sequence.keys())[5])):
                self.sequence[digit]=5
                self.digitset.remove(digit)
                break
        for digit in self.digitset:
            self.sequence[digit]=2
 
len1478 = {1:2, 4:4, 7:3, 8:7}
result = 0
for record in data:
    digit_set = DigitSet(set(record[:10]))
    for i in [1,4,7,8]:
        digit_set.Find1478(i)
    digit_set.Find3()
    digit_set.Find9()
    digit_set.Find0()        
    digit_set.Find6()        
    digit_set.Find52() 
    for order in range(4):
        for key in digit_set.sequence.keys():
            if set(key)==set(record[-4:][order]):
                result += digit_set.sequence[key]*10**(4-order-1)
print(f"total sum is {result}")
