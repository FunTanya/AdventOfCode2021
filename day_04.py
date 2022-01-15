import numpy as np
with open("data/input_04.txt") as data:
    lotteryline = data.readline().strip().split(",")
    #lottery = [int(drawn) for drawn in lotteryline] #shortcut
    lottery = list(map(int,lotteryline))
    tables = data.read()[1:-1] # read lines, skip first and last
    tables = tables.split("\n\n") #split w.r.t. empty line
    matrices = [np.mat(table.replace("\n", ";")) for table in tables]


class MyTable:
    uhodnute = []
    table = []
    won = False
    winner_order = None
    winning_number = None
    rest_sum = 0
    def __init__(self,t):
        self.table = t
        self.uhodnute =  np.full((5,5), False, dtype=bool)
    
    def SumTable(self):
        neuhodnute = self.table[self.uhodnute == False]
        self.rest_sum = neuhodnute.sum()
        return(self.rest_sum)
      
    def Pull_number(self, picked_number):
        self.uhodnute[self.table == picked_number] = True

    def Is_winning(self):
        sum_row = self.uhodnute.sum(axis = 0).max()
        sum_col = self.uhodnute.sum(axis = 1).max()
        if (sum_row>4) or  (sum_col>4):
            self.won = True
        return(self.won)

first_win = len(lottery)+1
for matrix in matrices:
    player_now = MyTable(matrix)
    counter = 0
    for cislo in lottery:
        player_now.Pull_number(cislo)
        counter +=1
        if player_now.Is_winning():
            player_now.winning_number = cislo
            player_now.winner_order = counter
            break
    if player_now.winner_order < first_win:
        winner = player_now
        first_win = player_now.winner_order
      

winner.winning_number * winner.SumTable()
