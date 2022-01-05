tab.count.x <-tab.count.y <-rep(0,30)
players <- readLines("data/input_21.txt")
library(strex)
start.x <- str_nth_number(players[1], n = 2,negs = TRUE)
start.y <- str_nth_number(players[2], n = 2,negs = TRUE)
moznosti <- expand.grid(1:3, 1:3,1:3)
kolikrat.hod <- as.numeric(table(rowSums(moznosti))) #fi of 3..9
hody <- unique(rowSums(moznosti)) #3..9
#inicializace pro x a y
temp.x <-temp.y  <- matice.x <- matice.y <-matrix(0,nr=10,nc=30)
for (hod in hody){
  nove.policko <-  (start.x + hod-1)%%10 +1 
  tab.count.x[nove.policko] <- kolikrat.hod[hod-2]
  matice.x[ (start.x + hod-1)%%10 +1 ,nove.policko] <- kolikrat.hod[hod-2]
}
pocet.svetu.x <- sum(matice.x)
temp.x <- matice.x

for (hod in hody){
  nove.policko <- (start.y +hod-1)%%10 +1 
  tab.count.y[nove.policko] <- kolikrat.hod[hod-2]
  matice.y[(start.y + hod-1)%%10 +1,nove.policko] <- kolikrat.hod[hod-2]
}
pocet.svetu.y <- sum(matice.y)
temp.y <- matice.y
#let's play x
svet.x <- 1
pocet.svetu.x <-pocet.vyher.x  <-  vector()
pocet.svetu.x[1] <- 27
pocet.vyher.x[1] <- 0
repeat{
  svet.x <- svet.x+1
  matice.x <- temp.x
  temp.x <-  matrix(0,nr=10,nc=30)
  for (i in 1:10){# last spot was spot i
    for (j in 1:30){ # I came to sum "j"  from spot "i" a[i,j]-times
      if (matice.x[i,j]>0){    #new roll
        tab.count.x[j] <- tab.count.x[j]-matice.x[i,j]
        for (hod in hody){
          (nove.policko <- (i+hod-1)%%10 +1 )# hod x se mi objevi nove policko()
          (nova.suma <- j+nove.policko)
          tab.count.x[nova.suma] <- tab.count.x[nova.suma]+matice.x[i,j]*kolikrat.hod[hod-2]
          (temp.x[nove.policko,nova.suma] 
            <- temp.x[nove.policko,nova.suma]+matice.x[i,j]*kolikrat.hod[hod-2])
        }
      }
    }     
  }
  pocet.svetu.x[svet.x] <- sum(tab.count.x[1:20])
  pocet.vyher.x[svet.x] <- sum(tab.count.x[21:30])
  tab.count.x[21:30] <- 0
  temp.x[,21:30] <- 0
  if (sum(tab.count.x[1:20])==0) break
}

#let's play y
svet.y <- 1
pocet.svetu.y <-pocet.vyher.y <-  vector()
pocet.svetu.y[1] <- 27
pocet.vyher.y[1] <- 0
repeat{
  svet.y<- svet.y+1
  matice.y<- temp.y 
  temp.y <-  matrix(0,nr=10,nc=30)
  for (i in 1:10){
    for (j in 1:30){ 
      if (matice.y[i,j]>0){    
        tab.count.y[j] <- tab.count.y[j]-matice.y[i,j]
        for (hod in hody){
          nove.policko <- (i+hod-1)%%10 +1 
          nova.suma <- j+nove.policko
          tab.count.y[nova.suma] <- tab.count.y[nova.suma]+matice.y[i,j]*kolikrat.hod[hod-2]
          (temp.y[nove.policko,nova.suma] 
            <- temp.y[nove.policko,nova.suma]+matice.y[i,j]*kolikrat.hod[hod-2])
        }
      }
    }     
  }
  pocet.svetu.y[svet.y] <- sum(tab.count.y[1:20])
  pocet.vyher.y[svet.y] <- sum(tab.count.y[21:30])
  tab.count.y[21:30] <- 0
  temp.y[,21:30] <- 0
  if (sum(tab.count.y[1:20])==0) break
}
format( sum(pocet.vyher.y*pocet.svetu.x[1:length(pocet.vyher.y)]),scientific = FALSE)
