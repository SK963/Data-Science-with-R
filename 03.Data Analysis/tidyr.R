
install.packages("tidyr")

#another variation
install.packages("tidyr" + dep T)
#this will include all other dependency packages 

install.packages("dplyr")

library(dplyr)
library(tidyr)



View(mtcars)


mt <- mtcars
head(mt)

View(mt)


#gather function 
?gather

#syntax
# gather(
#   data,
#   key = "key",
#   value = "value",
#   ...,
#   na.rm = FALSE,
#   convert = FALSE,
#   factor_key = FALSE
# )

#convert the data into longer format



mt_long <- gather(mt ,New_Field , Field_value , mpg:carb)
View(mt_long)


#spread function 
?spread
#Syntax


mt_wide <- spread(mt_long, New_Field , Field_value)
#gives error: Each row of output must be identified by a unique combination of keys.


mt_long$Ind <- 1:32
mt_long
mt_wide <- spread(mt_long, New_Field , Field_value)

View(mt_wide)

date <- as.Date('2021-01-01') + 0:14
class(date)
typeof(date)



date

date1 <- as.Date("2001-01-01") 

date - date1

hours <- sample(1:24 ,15)
minutes <- sample(0:60 ,15)
seconds <- sample(0:60 ,15)
event <- sample(letters , 15)
event


datehour <- data.frame(date , hours , minutes , seconds , event)

View(datehour)

# unit and separate  function
?unite


dataNew <- date %>% unite(datehour , date , hour , sep = " ") %>%
  unite(date)




bill <- read.csv("bill_data.csv")
View(bill)

new_bill <- bill %>% unite(city_state , city , state , sep = " ")
View(new_bill)
?separate


new_bill <- new_bill %>% separate(city_state , c("city" , "state") , sep =" ")

View(new_bill)

?gather

bill_long <- gather(bill , bill_type , bill_amount , gasbill:waterbill)
View(bill_long)


bill_wide <- spread(bill_long, bill_type , bill_amount)
#arrange the columns in alphabateical order
View(bill_wide)


data_sep_bill <- separate(bill , Date , c("Day" , "Month" ,"Year" ), sep = "-")
View(data_sep_bill)


unite_bill <- unite(data_sep_bill , Date , c("Day" , "Month" , "Year"), sep = "-")
View(unite_bill)


# handling na using tidyr


?replace_na
?drop_na


#remobing nas using tidyr
















