install.packages("sqldf", dependencies = T)

library("sqldf")


#sqldf package can only be used for select qureries over a dataframe 
#only  with other modifiers like where , having , groupby , order by etc
#queries are passed inside double quotes / single quotes as string and thery are 
#case insensitive 

my_data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Name = c("Alice", "Bob", "Charlie", "David", "Eve"),
  Age = c(25, 30, 35, 40, 45)
)

my_data

sqldf("SELECT * FROM my_data")

#Use WHERE clause for filtering data:
sqldf("SELECT * FROM my_data WHERE Age > 30")


# Perform aggregations using GROUP BY and aggregate functions:
sqldf("SELECT AVG(Age) AS avg_age FROM my_data")

# You can join multiple data frames using SQL joins:
other_data <- data.frame(ID = c(1, 2, 3), Score = c(85, 90, 75))

sqldf("SELECT * FROM my_data JOIN other_data ON my_data.ID = other_data.ID")

#Subsetting Columns:Select specific columns:
sqldf("SELECT Name, Age FROM my_data")


# Using R Functions within SQL Queries
sqldf("SELECT *, fn.sqrt(Age) AS sqrt_age FROM my_data")




#------------------------------------------------
data("UCBAdmissions")
View(UCBAdmissions)


str(UCBAdmissions)

summary(UCBAdmissions)



ucb <- as.data.frame(UCBAdmissions)
View(ucb)

summary(ucb)
str(ucb)



sqldf("select * from ucb")


#queries are case insensitive but the pattern or values aren't from which thery are compared

sqldf("Select * from ucb where Admit = 'Admitted' and gender = 'Female'")

sqldf('Select * from ucb where Admit = "Admitted" and gender = "Female"')



sqldf("select * from ucb where Admit = 'Admitted' order by Freq ")

sqldf("select * from ucb where Admit = 'Admitted' order by Freq desc")


#equivalent dplyr query
library(dplyr)

ucb%>% filter(Admit == "Admitted" )%>% arrange(desc(Freq))



# Aggregate Queries
#aggregate queries are applied with groupby clauses 
sqldf("select dept , freq  from ucb group by dept")

sqldf("select dept , sum(freq)  from ucb group by dept")





sqldf("select admit , sum(freq)  from ucb where gender =='Male' group by admit ")


?sample


#alias use 
sqldf("select Dept, avg(Freq) as average_admitted from ucb 
      where  Admit ='Admitted' group by Dept ")






#joins using sqldf
major <- data.frame(major = c("math" , "biology" , "engineering" , "computer science" , "history" , "architecture"), 
                    Dept = c(LETTERS[1:5] , "Other"), 
                    Faculity = round(runif(6 , min = 10 , max = 30)))
View(major)



#inner join
sqldf("select * from ucb
      inner join major on ucb.Dept = major.Dept")


#left join
sqldf("select * from ucb
      left join major on ucb.Dept = major.Dept")



#right join 
sqldf("select * from ucb
      right join major on ucb.Dept = major.Dept")







#full outer join
sqldf("select * from ucb
     full outer join major on ucb.Dept = major.Dept")




#cross join 
sqldf("select * from ucb
       cross join major on ucb.Dept = major.Dept")

#or without any keyword
sqldf("select * from ucb
       join major on ucb.Dept = major.Dept")



#where vs on keyword
#where keyword performs inner join in place of right or left join 


#wild card / Regex using sqldf
sqldf("select * from ucb where freq between 8 and 317")  #extremes (8 and 317 ) are inclussive

#the regex expression is case insensitive unitill a equal(=) operator is used
sqldf("select * from ucb where Gender Like 'fe%")  #% incdicates 0 or more characters followed by the chars

sqldf("select * from ucb where Gender Like '__male%'")  # every underscore represent a single character position presence

sqldf("select * from ucb where Gender Like 'M%'")

sqldf("select * from ucb where Gender = 'Female'  and Freq >= 100 ")




