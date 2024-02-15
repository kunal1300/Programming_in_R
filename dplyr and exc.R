library(dplyr)
df<- mtcars

a<-filter(df,mpg>20)
b<-sample_n(a,size = 5)
result <- arrange(b,desc(mpg))
print(result)


#pipe operator
df %>% filter(mpg>20) %>%
sample_n(size = 5) %>% arrange(desc(mpg))


#exercies

filter(mtcars,mpg>20,cyl==6)

arrange(mtcars,cyl,desc(wt))

select(mtcars,mpg,hp)

distinct( select(mtcars,gear))

mtcars %>% select(gear) %>% distinct()

mutate(mtcars,perfromace=hp/wt)

summarise(mtcars,avg_mpg =mean(mpg))

