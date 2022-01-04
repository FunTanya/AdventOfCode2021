MyFile <- "data/input_10.txt"
#MyFile <- "testdata/test_10.txt"
data <- readLines(MyFile)

char.string <- function(x){
  if (x!="<") 
    return(paste0("\\",x))
  else 
    return(x)
}
levaprava <- function(l,p){
  return( which(c("{","(","[","<")==l) == which(c("}",")","]",">")==p) )
}
fun.penalty.1 <- function(char){
  if (char==")") return(3) 
  else if (char=="]") return(57)
  else if (char=="}") return(1197) 
  else return(25137)
}

fun.penalty.2 <- function(char){ #"[" "(" "{" "(" "[" "[" "{" "{"
    if (char=="(") return(1)
    else if (char=="[") return(2)
    else if (char=="{") return(3) 
    else return(4)
}
which(c("{","(","[","<")==l) == which(c("}",")","]",">")==p)
#funkce pro radek:  
prvni <- function(radek){
  pole <- vector()
  penalty.bad <- 0
  s <- 0
  for (char in unlist(strsplit(radek,split = ""))){ 
    if (grepl(char.string(char),"\\(\\[\\{<"))
      pole <- c(pole,char) # put left to pole
    else
      {#print("kuk")#nedam do pole, podivam se, jestli je prava
        if (levaprava(tail(pole,1),char)){pole <- head(pole,-1)}
          else {
            penalty.bad <- fun.penalty.1(char);
            break
            }
      }
  }
  if (penalty.bad==0) {
    for (char in rev(pole)){s <- s*5+fun.penalty.2(char)}
  }
  return(c(s,penalty.bad))
}
#main program:
sum <- 0
for.median <- vector()
for (i in (1:length(data))){  
  sum <- sum+prvni(data[i])[2]
  pom <- prvni(data[i])[1]
  if (pom!=0) for.median <- c(for.median,pom)
  }
print(sum)
print(median(for.median))
