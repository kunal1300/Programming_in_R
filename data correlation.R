library(readr)
library(corrgram)
library(corrplot)
df<-student_mat

head(df)

summary(df)


any(is.na(df))

str(df)

library(ggplot2)
library(ggthemes)
library(dplyr)
#num only
num.cols<- sapply(df,is.numeric)
#filter

cor.data<-cor(df[,num.cols])
cor.data

print(corrplot(cor.data,method = 'color'))

corrgram(df)


