#C:\Users\kunal\Desktop\R-Course-HTML-Notes\R-Course-HTML-Notes\R-for-Data-Science-and-Machine-Learning\Training Exercises\Machine Learning Projects\CSV files for ML Projects
library(readr)
bike<- read_csv("C:/Users/kunal/Desktop/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects/bikeshare.csv")
head(bike)
library(ggplot2)
library(dplyr)
ggplot(bike,aes(temp,count)) +geom_point(alpha= 0.3)

ggplot(bike,aes(temp,count)) +geom_point(alpha= 0.3,aes(color=temp)) +theme_bw()


#convert to timestamp
bike$datetime <- as.POSIXct(bike$datetime)



pl<- ggplot(bike,aes(datetime,count)) +geom_point(aes(color=temp),alpha=0.5) 

pl + scale_color_continuous(low ='#55D8CE', high='#ff6e2e') + theme_bw()

cor(bike[,c('temp','count')])
ggplot(bike,aes(factor(season),count)) + geom_boxplot(aes(color=factor(season)))+ theme_bw()

#Feature engineering
bike$hour <- sapply(bike$datetime,function(x){format(x,"%H")})
bike$hour <- sapply(bike$hour,as.numeric)

#scatterplot 
p0l <- ggplot(filter(bike,workingday==1),aes(hour,count))

plot1 <- p0l + geom_point(position = position_jitter(w=1,h=0),aes(color=temp),alpha=0.5)
print(plot1)

plot1 + scale_color_gradientn(colours=c('darkblue','blue', 'lightblue','lightgreen','yellow','orange','red')) + theme_bw()

#build model
model <- lm(count~.-casual - registered -datetime -atemp,bike)

print(summary(model))
