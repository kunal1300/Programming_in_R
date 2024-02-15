library(ggplot2)
library(data.table)
library(readr)
df <- read_csv("C:/Users/kunal/Desktop/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Capstone and Data Viz Projects/Data Visualization Project/Economist_Assignment_Data.csv")
View(Economist_Assignment_Data)


p1<- ggplot(df,aes(x=CPI,y=HDI,color = Region))

p2<-p1 + geom_point(size=4 ,shape =1)

p3<-p2 + geom_smooth(aes(group=1),method = 'lm',formula = y~log(x),se=F,color='red')



pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl4 <- p3 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)
p5<-pl4 + scale_x_continuous(limits =c(.9,10.5, breaks= 1:10) )

p5 + theme_economist_white()

install.packages('plotly')
library(plotly)

pl <- ggplot(mtcars,aes(mpg,wt))+geom_point()
pl

gpl<- ggplotly(pl)
print(gpl)
