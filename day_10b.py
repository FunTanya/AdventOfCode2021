data = [] 
with open("data/input_10.txt") as f: 
    for line in f:
        data.append(line.split())

def point_value(leftchar):
    if leftchar =="(":
        return 1
    elif leftchar =="{":
        return 3
    elif leftchar =="<":
        return 4
    else: 
        return 2

all_tot_scores = []
for i in range(len(data)):
    syntax_error = False
    stream = []
    for char in data[i][0]:
        if char in {"(","{","<","["}:
            stream.append(char)
        elif  brother(char)[0] == stream[-1]:
            stream.pop()
        else:
            syntax_error = True
            break
    if not syntax_error:
        print("incomplete:", stream)
        n = len(stream)
        tot_score = 0
        for i in range(n):
            tot_score = tot_score * 5 +point_value(stream.pop())
        all_tot_scores.append(tot_score)
              
        
print(sorted(all_tot_scores)[len(all_tot_scores) // 2])      
