data = [] 
with open("data/input_10.txt") as f: 
    for line in f:
        data.append(line.split())

def brother(leftchar):
    if leftchar ==")":
        return "(",3
    elif leftchar =="}":
        return "{",1197
    elif leftchar ==">":
        return "<",25137
    else: 
        return "[",57
      
total_syntax_error_score =0 

for i in range(len(data)):
    stream = []
    for char in data[i][0]:
        if char in {"(","{","<","["}:
            stream.append(char)
        elif  brother(char)[0] == stream[-1]:
            stream.pop()
        else:
            total_syntax_error_score += brother(char)[1]
            break
        
print(total_syntax_error_score)      
