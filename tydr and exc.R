install.packages('tidyr')
install.packages('data.table')


library(tidyr)
library(data.table)

#gather

comp<-c(1,1,1,2,2,2,3,3,3)
yr<-c(1998,1999,2000,2001,1998,1996,2002,2005,1996)
q1<- runif(9, min = 0, max = 100)
q2<- runif(9, min = 0, max = 100)
q3<- runif(9, min = 0, max = 100)
q4<- runif(9, min = 0, max = 100)

df <- data.frame(Comp=comp,Year=yr,Qtr1=q1,Qtr2=q2,Qtr3=q3,Qtr4=q4)
df

gather(df,Quarter,Revenue,Qtr1:Qtr4)
##################################################


#####################################################
stocks <- tibble(
  time = as.Date("2009-01-01") + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocks


stocks.gathered <- stocks %>% gather(stocks,price,X:Z)
stocks.gathered <- stocks %>% gather(stocks,price,X,Y,Z)
head(stocks.gathered)
