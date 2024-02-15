df <- student_mat
head(df)
tail(df)
summary(df)
### null values
any(is.na(df))
##false there is no missing values

str(df)


library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)
#only numeric column

num.col<- sapply(df,is.numeric)
#filter
cor.data<-cor(df[num.col])
#
print(cor.data)


#correlation plot
print(corrplot(cor.data,method = 'color'))

corrgram(df)
####################################################################################

# split the data into test and train set
library(caTools)
#set a seed 
set.seed(101)# for random numbers
library(readr)
df <- read_delim("C:/Users/kunal/Desktop/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R/student-mat.csv", 
                          delim = ";", escape_double = FALSE, trim_ws = TRUE)
View(df)

#split up the sample

sample <- sample.split(df$G3,SplitRatio = 0.7)


#70% of data for training
train<- subset(df,sample ==TRUE)

#30% of data for test
test<- subset(df,sample == FALSE)

#train and build the model
model <- lm(G3~.,data=train)
print(summary(model))


###################residuals################
res <- residuals(model)
class(res)
res<- as.data.frame(res)
head(res)
ggplot(res,aes(res))+ geom_histogram(fill='blue')


################################################

plot(model)

G3.pridiction<- predict(model,test)
results<-cbind(G3.pridiction,test$G3)
colnames(results) <- c('predicted','actual')
results <- as.data.frame(results)
head(results)

to_zero<- function(x){
  if(x<0){
    return(0)
  }else{
    return(x)
  }
}

results$predicted<-sapply(results$predicted,to_zero)

MSE<- mean((results$actual- results$predicted)^2)
print('MSE')
print(MSE)


print('Squared root of MSE')
print(MSE^0.5)

SSE <- sum((results$predicted - results$actual)^2)
SST <- sum((mean(df$G3)-results$actual)^2)
R2<- 1- SSE/SST


print(SSE)
print(SST)
print(R2)
