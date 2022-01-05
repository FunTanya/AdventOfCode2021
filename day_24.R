MyFile <- "data/input_24.txt"
data <- strsplit(readLines(MyFile),split = " ")

cislo <- 33279629698993 # somewhere between
charcislo <- unlist(strsplit(as.character(cislo),split = ""))
x <- y <- z <- w <- 0
j <- 1
kuk <- data.frame(step=0,w=0,x=0,y=0,z=0)
step <- 1
for (i in( 1 : length(data))){  
  if (length(data[[i]])==2){
    assign(data[[i]][2], as.integer(charcislo[j]))
    j <- j+1
  } else  {
    if (data[[i]][1]=="mul"){
      result <- eval(parse(text = data[[i]][2])) * eval(parse(text = data[[i]][3]))
    } else  if (data[[i]][1]=="eql"){
      result <- as.numeric(eval(parse(text = data[[i]][2])) == eval(parse(text = data[[i]][3])))
    } else  if (data[[i]][1]=="add"){
      result <- eval(parse(text = data[[i]][2])) + eval(parse(text = data[[i]][3]))
    } else  if (data[[i]][1]=="div"){### b <> 0
      b <- eval(parse(text = data[[i]][3]))
      if (b==0) {print("b v div nula"); break }
      result <- eval(parse(text = data[[i]][2])) %/% b
    } else  if (data[[i]][1]=="mod"){ #a>=0,  b>0
      a <- eval(parse(text = data[[i]][2]))
      b <- eval(parse(text = data[[i]][3]))
      if ((a<0)|(b<=0)) {print("a nebo b v modu"); break }
      result <- eval(parse(text = data[[i]][2])) %% eval(parse(text = data[[i]][3]))
    } 
    assign(data[[i]][2], result)  
  }
  if ((i %% 18)==0) {
    kuk <- rbind(kuk,c(step,eval(parse(text="w")),
                       eval(parse(text="x")),
                       eval(parse(text="y")),
                       eval(parse(text="z"))))
    step <- step+1
  }
} 
print(kuk)
