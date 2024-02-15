#DPLYR
install.packages("dplyr")
install.packages("nycflights13")

library(dplyr)
library(nycflights13)


head(flights)

tail(flights)

summary(flights)

#Filter is use to filter the data within the column which you need to find with
filter(flights,month == 11, day==3, carrier=='AA')

head(filter(flights,month == 11, day==3, carrier=='AA'))


##Slice

slice(flights,1:10)#it shows first 10 rows

##arange
head(arrange(flights,year,month,day,air_time))

head(arrange(flights,year,month,day,arr_time))#acending e.g arr_time


#select
head(select(flights,carrier))

head(select(flights,carrier,arr_time))

head(select(flights,carrier,arr_time,month))

#Rname

head(rename(flights,airlines_carrier= carrier))
head(flights)

#distinct

distinct(select(flights,carrier))


#mutate

head(mutate(flights,new_col = arr_delay-dep_delay))
#summaris




