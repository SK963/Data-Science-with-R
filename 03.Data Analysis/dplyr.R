#installing dplyr package

install.packages('dplyr')  #required once

#including dplyr 
library(dplyr) 
#or
require(dplyr)


?dplyr


#projections 

?mtcars
View(mtcars)





#----------------------------------------------
require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)
## possibly more meaningful, e.g., for summary() or bivariate plots:
mtcars2 <- within(mtcars, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})

#-------------------------------------------------------------
View(mtcars2)


v1 <- select(mtcars , mpg , cyl)
summary(mtcars)
v1

class(v1)

filter(v1 , cyl>6 )


#using pipe operator -> updates the existing memory for better memory management
mtcars%>%select(mpg  , cyl)%>% filter(cyl>6)%>%View


#SELECT STATEMENTS
?select

select(mtcars, starts_with("c"))
select(mtcars , ends_with("p"))
select(mtcars , contains("t"))



# List built-in datasets
data()

# List just the names of built-in datasets
data(package = .packages(all.available = TRUE))


#force function 
force(mtcars)



# Load the mtcars dataset
data(mtcars)


# Specify the file path for the CSV file
csv_file <- "mtcars.csv"

# Export the mtcars dataset to a CSV file
write.csv(mtcars, file = csv_file, row.names = TRUE)



#readr library to read csv 
library(readr)
mtcars <- read_csv("mtcars.csv")




#-------------------------------------------------
#mamal sleep dataset analysis with dplyr
ms <- read.csv("Dataset/msleep.csv")
ms

View(ms)


#--------------------select function
?select
#selecting few columns of data
sleepdata <- select(ms , name , sleep_total , sleep_cycle , bodywt)
#selecting all columns of data by excluding few columns

#head function <- shows only first few columns of selected data
?head
head(select(ms , -sleep_total))

#selecting a range of columns using : operator
head(select(ms , name:conservation))

#selecting data using approximate string matching of columns
#start with
head(select(ms, starts_with("c")))
#ends_with
head(select(ms , ends_with("r")))
#contains
head(select(ms , contains("t")))
#matches
?matches
head(select(ms , matches("enu")))
#num_ranges

#--------------------- filter function

#select/filter rows  using a single condition
filter(ms , sleep_total >16)

#select/filter rows using two or more condition (and)
filter(ms , sleep_total>16 , bodywt >1)

#filter rows using values of a columns
filter(ms , order %in% c("Carnivora", "Primates"))


#------------------Arrange function 

#the default order of arrangement of arrange function is ascending order for numerical 
ms %>% arrange(sleep_total) %>% head

#using arrange function with two or more parameters
ms %>% select(name , order , sleep_total) %>% arrange(order , sleep_total) %>% head


#combining select , filter and arrange function
ms %>% select(name , order , sleep_total) %>%
  arrange(order , sleep_total) %>%
  filter(sleep_total >= 16)%>% head


#changing the order of the arrange function

ms %>% select(name , order , sleep_total) %>%
  arrange(desc(order) , desc(sleep_total)) %>%
  filter(sleep_total >= 16)%>% head


#------------------mutate function
#crate new columns using mutate() function

ms %>% mutate(rem_proportion = sleep_rem / sleep_total) %>% head

ms %>% mutate(rem_proportion = sleep_rem/sleep_total, 
              bodywt_grams = bodywt* 1000) %>% head


ms%>%summarise(avg_sleep = mean(sleep_total))

ms %>% summarise(avg_sleep = mean(sleep_total),
                 min_sleep = min(sleep_total),
                 max_sleep = max(sleep_total),
                 total  = n() )


#--------------------------Group operations 
ms %>% group_by(order)
  summarise(avg_sleep = mean(sleep_total),
                 min_sleep = min(sleep_total),
                 max_sleep = max(sleep_total),
                 total  = n() )
