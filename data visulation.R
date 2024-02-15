#Data
  |
  V  
#Aesthetics
   |
   V  
#geometrics
    |
    V  
#facets
    |
    V
# satatics
    |
    V
#Coordinates
    |
    V
  #Themes
  
  
#####################################################histogram
install.packages('ggplot2')
install.packages('ggplot2movies')
library(ggplot2)
library(ggplot2movies)

plot<- ggplot(movies,aes(x=rating))
4)
p1 <- plot + geom_histogram(binwidth = 0.1,aes(fill=..count..))
p1
p1 +xlab('Movie Rating') + ylab('Counts') + ggtitle('My Project')


######scatterplot##########

df<-mtcars

pl<-ggplot(df,aes(x=wt,y =mpg))
pl+geom_point()

print(pl + geom_point(alpha = 0.5,size=5))
print(pl + geom_point(aes(shape =factor(cyl)),size=5,alpha=0.4))

print(pl + geom_point(aes(color =factor(cyl)),size=5,alpha=0.4))

p2<- print(pl + geom_point(aes(color=hp),size=5,alpha=0.4))

p2 + scale_color_gradient(low = 'blue',high = 'red')



#####bar plot############continues data####

df<-mpg
df


plotbar <- ggplot(df,aes(x=class))

print(plotbar + geom_bar(aes(fill=drv),position = "dodge"))

#####boxplot###########

plotbox<-ggplot(df,aes(x=factor(cyl,y=mpg))

print(plotbox + geom_boxplot(aes(fill=factor(cyl)))+ theme_bw())
      
###########2 variable####################

pl<- ggplot(movies,aes(x=year ,y=rating))
install.packages('hexbin')
pl+geom_hex()

  print(pl + geom_bin2d()) + scale_fill_gradient(high = 'red', low = 'green')


####~~~~~~~~~~~~~~~~~~~~~~~~~###################
p1<- ggplot(mpg , aes(x=displ,y = hwy))+geom_point()
p1  

p1+coord_cartesian(xlim = c(1,4),ylim = c(15,30))

p1+ facet_grid(.~cyl)
  
p1 + facet_grid(cyl ~.)

p1 + facet_grid(cyl~drv)

######themes########
library(ggthemes)

pl<- ggplot(mtcars,aes(x=wt,y=mpg)) + geom_point()

print(pl + theme_fivethirtyeight())
  
  
  
  