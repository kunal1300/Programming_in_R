ggplot(mpg,aes(x=hwy)) +geom_histogram(bins = 20,fill='red',alpha=0.5)
######simpple graph
pl<- ggplot(mpg,aes(x=manufacturer))
pl + geom_bar(aes(fill=factor(cyl)))
####factor function

head(txhousing)

p2 <- ggplot(txhousing,aes(x= sales, y=volume) )

p3<- p2 + geom_point(color='blue',alpha= 0.2)

p4<- p3 + geom_smooth(color='red')
print(p4)
