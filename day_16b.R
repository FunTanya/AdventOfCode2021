library(BMS)
(x <- hex2bin("9C0141080250320F1802104A08")) 
vers <-  type <- len <- value <- ask.n<- ask.len<-op.01<-NA
df <- data.frame(vers , type, op.01 , len ,  value,  ask.n, ask.len) 

bin2dec <- function(x) {
        sum(2^(which(rev(unlist(strsplit(as.character(x), "")) == 1))-1))
}
lit2str <- function(x){
        paste0(unlist(strsplit(as.character(x), "")),collapse = "")
}
operate <- function (oper,cisla){
        ifelse(oper ==0, return(sum(cisla)),
               ifelse(oper==1, return(prod(cisla)),
                      ifelse(oper==2, return(min(cisla)),
                             ifelse(oper==3, return(max(cisla)), 
                                    ifelse(oper==5, return(as.numeric(cisla[1]>cisla[2])),
                                           ifelse(oper==6, return(as.numeric(cisla[1]<cisla[2])),  
                                                  return(as.numeric(cisla[1]==cisla[2])))))))) }
do.literal <- function(x){
        a <- x
        literal <- vector()
        odtrhnute <- 0
        repeat{ literal <- c(literal,a[2:5])
        df[i.packet,'len'] <- df[i.packet,'len'] +5
        pom <- a[1]
        a <- a[-(1:5)]
        odtrhnute <- odtrhnute+5
        if (pom==0){break}}
        return(c(odtrhnute,literal))
}

i.packet <- 0
last.operator <- 0
repeat{ #reading
        i.packet <- i.packet+1
        df[i.packet,'vers'] <- bin2dec(x[1:3])
        df[i.packet,'type'] <- bin2dec(x[4:6])
        df[i.packet,'len'] <- 6
        x <- x[-(1:6)]
        if (df[i.packet,'type']==4) {
                cislo <- do.literal(x)[-1]
                delka <- do.literal(x)[1]
                df[i.packet,'value'] <- bin2dec(lit2str(cislo))
                df[i.packet,'len'] <- df[i.packet,'len']+delka
                x <- x[-(1:delka)]
        } else if ((df[i.packet,'type']!=4) & (x[1]==0)){
                last.operator <- i.packet
                df[i.packet,'op.01'] <-0
                df[i.packet,'ask.len'] <- bin2dec(x[2:16])
                df[i.packet,'len'] <- df[i.packet,'len']+16
                x <- x[-(1:16)]} else if ((df[i.packet,'type']!=4) & (x[1]==1)){
                        last.operator <- i.packet
                        df[i.packet,'op.01'] <-1
                        df[i.packet,'ask.n'] <- bin2dec(x[2:12])
                        df[i.packet,'len'] <- df[i.packet,'len']+12
                        x <- x[-(1:12)]
        }
    #combining operators
    nochange <- FALSE
    repeat{
        if ((df[last.operator,'op.01']==0) & (df[i.packet,'type']==4)
            & (df[last.operator,'ask.len']==sum(df[(last.operator+1):i.packet,'len']))){
             new.value <- operate(oper = df$type[last.operator],df$value[(last.operator+1):i.packet])
             new.len=sum(df[last.operator:i.packet,'len'])
             df <- df[-(last.operator:i.packet),]
             df[last.operator,'type'] <- 4
             df[last.operator,'value'] <- new.value
             df[last.operator,'len'] <- new.len
             i.packet <- last.operator
             j <- nrow(df)+1
             repeat{j <- j+-1
             if (df$type[j]!=4) {last.operator <- j;break}   
             }
        } else  if ((df[last.operator,'op.01']==1) & (df[i.packet,'type']==4)
            & (df[last.operator,'ask.n']==length((last.operator+1):i.packet))){
                new.value <- operate(oper = df$type[last.operator],df$value[(last.operator+1):i.packet])
                new.len=sum(df[last.operator:i.packet,'len'])
                df <- df[-(last.operator:i.packet),]
                df[last.operator,'type'] <- 4
                df[last.operator,'value'] <- new.value
                df[last.operator,'len'] <- new.len
                i.packet <- last.operator
                j <- nrow(df)+1
                repeat{j <- j+-1
                if ( (df$type[j]!=4) | identical(df$type[j],numeric(0)) ) {
                        last.operator <- j;break}   
                }
        } else {nochange <- TRUE}
        if (nochange) break}
if ((bin2dec(x)==0) | (identical(x,numeric(0)))) {break}
}

format(df$value,scientific = FALSE)
